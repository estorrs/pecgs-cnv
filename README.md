# pecgs-fusion
cwl wrapper for dinglab somatic cnv pipeline based on GATK4 workflow

based on [dinglab cnv pipeline](https://github.com/ding-lab/GATK4SCNA)

#### Running cnv.py

###### Arguments

usage: cnv.py [-h] [--out-dir OUT_DIR] [--gene-level-script GENE_LEVEL_SCRIPT] [--merge-gene-script MERGE_GENE_SCRIPT]
              [--genome GENOME] [--genome-dict GENOME_DICT] [--target-interval-list TARGET_INTERVAL_LIST]
              [--common-biallelic COMMON_BIALLELIC] [--protein-coding-gene PROTEIN_CODING_GENE] [--pool-of-normals POOL_OF_NORMALS]
              sample tumor_bam normal_bam


positional arguments:

  - sample
    - Sample id
  - tumor_bam
    - wxs tumor bam
  - normal_bam
    - wxs normal bam
  
    
optional arguments:

  + -h, --help
    - show this help message and exit
    
  + --out-dir OUT_DIR
    - output directory
   
  + --gene-level-script GENE_LEVEL_SCRIPT
    - location of gene level python script from https://github.com/ding-lab/GATK4SCNA/tree/main/src. included in cnv/ dir.
   
  + --merge-gene-script MERGE_GENE_SCRIPT
    - location of merge gene level python script from https://github.com/ding-lab/GATK4SCNA/tree/main/src. included in cnv/ dir.
    
  + --genome GENOME
    - reference location
   
  + --genome-dict GENOME_DICT
    - reference .dict location
    
  + --target-interval-list TARGET_INTERVAL_LIST
    - location of IDT_xGen_Exome_Research_Panel_v1.hg38.removed_alt_chr.bed.target.preprocessed.exome.interval_list
    
  + --common-biallelic COMMON_BIALLELIC
    - location of af-only-gnomad.hg38.common_biallelic.chr1-22XY.vcf
    
  + --protein-coding-gene PROTEIN_CODING_GENE
    - location of gencode.v34.annotation.gene_filterd.need_gene_symbol.no_sym.filtered_to_hgnc_protein-coding_genes.bed
   
  + --pool-of-normals POOL_OF_NORMALS
    - location of pool of normals created in step 1 and 2 of https://github.com/ding-lab/GATK4SCNA/tree/main/src. available at /storage1/fs1/dinglab/Active/Projects/estorrs/pecgs-resources/cnv_resources/pon/create_pon/gatk4scnaPON.Normal.hdf5


###### Docker

docker image is available from dockerhub (estorrs/pecgs_cnv:0.0.1)
