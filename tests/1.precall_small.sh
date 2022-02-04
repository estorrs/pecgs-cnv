#!/bin/bash
export LSF_DOCKER_VOLUMES="/storage1/fs1/m.wyczalkowski/Active:/storage1/fs1/m.wyczalkowski/Active /storage1/fs1/dinglab/Active:/storage1/fs1/dinglab/Active /storage1/fs1/dinglab/Active/Projects/estorrs/pecgs_resources/cnv/pon/precall/logs:/storage1/fs1/dinglab/Active/Projects/estorrs/pecgs_resources/cnv/pon/precall/logs"
bgadd -L 25 /estorrs/pecgs-25
bsub -R 'rusage[mem=28GB]' -M 28GB -q dinglab -G compute-dinglab -a 'docker(estorrs/pecgs_cnv:0.0.1)' -g /estorrs/pecgs-25 -J C3L-00081_precall -oo /storage1/fs1/dinglab/Active/Projects/estorrs/pecgs_resources/cnv/pon/precall/logs/C3L-00081_precall.txt 'export PATH=/miniconda/envs/cnv/bin:$PATH && gatk CollectReadCounts -I /storage1/fs1/m.wyczalkowski/Active/Primary/CPTAC3.share/CPTAC3-GDC/GDC_import/data/ec948c00-910b-4c7b-82a7-4d209d377116/5e04faec-58e8-403f-942b-74e8c0053805_gdc_realn.bam -L /storage1/fs1/dinglab/Active/Projects/estorrs/pecgs_resources/cnv/db/IDT_xGen_Exome_Research_Panel_v1.hg38.removed_alt_chr.bed.target.preprocessed.exome.interval_list -interval-merging-rule OVERLAPPING_ONLY -O /storage1/fs1/dinglab/Active/Projects/estorrs/pecgs_resources/cnv/pon/precall/C3L-00081.N.counts.hdf5'