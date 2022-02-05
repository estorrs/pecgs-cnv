import argparse
import os
import logging
import subprocess
from pathlib import Path

logging.basicConfig(format='%(asctime)s - %(message)s', level=logging.INFO)

parser = argparse.ArgumentParser()

parser.add_argument('sample', type=str,
    help='Sample id')

parser.add_argument('tumor_bam', type=str,
    help='tumor wxs bam')

parser.add_argument('normal_bam', type=str,
    help='normal WXS bam')

parser.add_argument('--out-dir', type=str, default='output',
    help='output directory')

parser.add_argument('--gene-level-script', type=str,
    help='location of gene level python script from https://github.com/ding-lab/GATK4SCNA/tree/main/src')

parser.add_argument('--merge-gene-script', type=str,
    help='location of merge gene level python script from https://github.com/ding-lab/GATK4SCNA/tree/main/src')

parser.add_argument('--genome', type=str,
    help='reference location')

parser.add_argument('--genome-dict', type=str,
    help='reference .dict location')

parser.add_argument('--target-interval-list', type=str,
    help='location of IDT_xGen_Exome_Research_Panel_v1.hg38.removed_alt_chr.bed.target.preprocessed.exome.interval_list')

parser.add_argument('--common-biallelic', type=str,
    help='location of af-only-gnomad.hg38.common_biallelic.chr1-22XY.vcf')

parser.add_argument('--protein-coding-gene', type=str,
    help='location of gencode.v34.annotation.gene_filterd.need_gene_symbol.no_sym.filtered_to_hgnc_protein-coding_genes.bed')

parser.add_argument('--pool-of-normals', type=str,
        help='location of pool of normals created in step 1 and 2 of https://github.com/ding-lab/GATK4SCNA/tree/main/src')


args = parser.parse_args()


def collect_read_counts(tumor_bam, sample, out_dir):
    pieces = [
        'gatk CollectReadCounts',
        '-I', tumor_bam,
        '-L', args.target_interval_list,
        '--interval-merging-rule OVERLAPPING_ONLY',
        '-O', os.path.join(out_dir, f'{sample}.T.counts.hdf5')
    ]
    return ' '.join(pieces)


def denoise_counts(sample, out_dir):
    pieces = [
        'gatk DenoiseReadCounts',
        '-I', os.path.join(out_dir, f'{sample}.T.counts.hdf5'),
        '--count-panel-of-normals', args.pool_of_normals,
        '--standardized-copy-ratios', os.path.join(out_dir, f'{sample}.T.standardizedCR.tsv'),
        '--denoised-copy-ratios', os.path.join(out_dir, f'{sample}.T.denoisedCR.tsv')
    ]
    return ' '.join(pieces)


def collect_allelic_counts(bam, sample, out_dir, char):
    pieces = [
        'gatk CollectAllelicCounts',
        '-L', args.common_biallelic,
        '-I', bam,
        '-R', args.genome,
        '-O', os.path.join(out_dir, f'{sample}.{char}.allelicCounts.tsv')
    ]
    return ' '.join(pieces)


def model_segments(sample, out_dir):
    pieces = [
        'gatk ModelSegments',
        '--denoised-copy-ratios', os.path.join(out_dir, f'{sample}.T.denoisedCR.tsv'),
        '--allelic-counts', os.path.join(out_dir, f'{sample}.T.allelicCounts.tsv'),
        '--normal-allelic-counts', os.path.join(out_dir, f'{sample}.N.allelicCounts.tsv'),
        '--output', out_dir,
        '--output-prefix', f'{sample}.T'
    ]
    return ' '.join(pieces)


def call_copy_segments(sample, out_dir):
    pieces = [
        'gatk CallCopyRatioSegments',
        '--input', os.path.join(out_dir, f'{sample}.T.cr.seg'),
        '--output', os.path.join(out_dir, f'{sample}.T.called.seg')
    ]
    return ' '.join(pieces)


def plot_denoised(sample, out_dir, min_contig_len=10000000, char='T'):
    pieces = [
        'gatk PlotDenoisedCopyRatios',
        '--standardized-copy-ratios', os.path.join(out_dir, f'{sample}.{char}.standardizedCR.tsv'),
        '--denoised-copy-ratios', os.path.join(out_dir, f'{sample}.{char}.denoisedCR.tsv'),
        '--sequence-dictionary', args.genome_dict,
        '--minimum-contig-length', str(min_contig_len),
        '--output', os.path.join(out_dir, 'plots'),
        '--output-prefix', f'{sample}.{char}',
        '--tmp-dir', out_dir
    ]
    return ' '.join(pieces)


def plot_segments(sample, out_dir, min_contig_len=10000000, char='T'):
    pieces = [
        'gatk PlotModeledSegments',
        '--denoised-copy-ratios', os.path.join(out_dir, f'{sample}.{char}.denoisedCR.tsv'),
        '--allelic-counts', os.path.join(out_dir, f'{sample}.{char}.hets.tsv'),
        '--segments', os.path.join(out_dir, f'{sample}.{char}.modelFinal.seg'),
        '--sequence-dictionary', args.genome_dict,
        '--minimum-contig-length', str(min_contig_len),
        '--output', os.path.join(out_dir, 'plots'),
        '--output-prefix', f'{sample}.{char}',
        '--tmp-dir', out_dir
    ]
    return ' '.join(pieces)


def gene_level(script, sample, out_dir):
    pieces = [
        'python', script,
        '--prefix', f'{sample}.T',
        '--name', sample,
        '--seg', os.path.join(out_dir, f'{sample}.T.called.igv.seg'),
        '--gene', args.protein_coding_gene,
        '-o', out_dir
    ]
    return ' '.join(pieces)


def merge_gene_level(script, out_dir):
    pieces = [
        'python', script, out_dir
    ]
    return ' '.join(pieces)


def run_cnv(normal_bam, tumor_bam, sample, out_dir, gene_level_script,
            merge_gene_script):
    logging.info('collecting tumor reads')
    cmd = collect_read_counts(tumor_bam, sample, out_dir)
    logging.info(f'executing command: {cmd}')
    subprocess.check_output(cmd, shell=True)

    logging.info('denoising counts')
    cmd = denoise_counts(sample, out_dir)
    logging.info(f'executing command: {cmd}')
    subprocess.check_output(cmd, shell=True)

    logging.info('collect allelic counts normal')
    cmd = collect_allelic_counts(normal_bam, sample, out_dir, 'N')
    logging.info(f'executing command: {cmd}')
    subprocess.check_output(cmd, shell=True)

    logging.info('collect allelic counts tumor')
    cmd = collect_allelic_counts(tumor_bam, sample, out_dir, 'T')
    logging.info(f'executing command: {cmd}')
    subprocess.check_output(cmd, shell=True)

    logging.info('modeling segments')
    cmd = model_segments(sample, out_dir)
    logging.info(f'executing command: {cmd}')
    subprocess.check_output(cmd, shell=True)

    logging.info('call copy ratio segments')
    cmd = call_copy_segments(sample, out_dir)
    logging.info(f'executing command: {cmd}')
    subprocess.check_output(cmd, shell=True)

    logging.info('plot denoised tumor')
    cmd = plot_denoised(sample, out_dir, char='T')
    logging.info(f'executing command: {cmd}')
    subprocess.check_output(cmd, shell=True)

    logging.info('plot segments tumor')
    cmd = plot_segments(sample, out_dir, char='T')
    logging.info(f'executing command: {cmd}')
    subprocess.check_output(cmd, shell=True)

    logging.info('plot denoised normal')
    cmd = plot_denoised(sample, out_dir, char='N')
    logging.info(f'executing command: {cmd}')
    subprocess.check_output(cmd, shell=True)

    logging.info('plot segments normal')
    cmd = plot_segments(sample, out_dir, char='N')
    logging.info(f'executing command: {cmd}')
    subprocess.check_output(cmd, shell=True)

    logging.info('running gene level')
    cmd = gene_level(gene_level_script, sample, out_dir)
    logging.info(f'executing command: {cmd}')
    subprocess.check_output(cmd, shell=True)

    logging.info('merging gene level')
    cmd = merge_gene_level(merge_gene_script, out_dir)
    logging.info(f'executing command: {cmd}')
    subprocess.check_output(cmd, shell=True)


def main():
    Path(args.out_dir).mkdir(parents=True, exist_ok=True)
    run_cnv(args.normal_bam, args.tumor_bam, args.sample, args.out_dir,
            args.gene_level_script, args.merge_gene_script)


if __name__ == '__main__':
    main()
