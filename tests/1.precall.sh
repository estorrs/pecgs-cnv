#!/bin/bash
mkdir -p /storage1/fs1/dinglab/Active/Projects/estorrs/pecgs_resources/cnv/pon/pecgs_pon_v1/precall/logs
export LSF_DOCKER_VOLUMES="/storage1/fs1/m.wyczalkowski:/storage1/fs1/m.wyczalkowski /storage1/fs1/dinglab:/storage1/fs1/dinglab /scratch1/fs1/dinglab:/scratch1/fs1/dinglab /storage1/fs1/dinglab/Active/Projects/estorrs/pecgs_resources/cnv/pon/pecgs_pon_v1/precall/logs:/storage1/fs1/dinglab/Active/Projects/estorrs/pecgs_resources/cnv/pon/pecgs_pon_v1/precall/logs"
bgadd -L 25 /estorrs/pecgs-25
export PATH="/opt/java/openjdk/bin:$PATH"
bsub -R 'select[mem>28GB] rusage[mem=28GB] span[hosts=1]' -M 28GB -n 1 -q dinglab -G compute-dinglab -a 'docker(estorrs/pecgs_cnv:0.0.2)' -g /estorrs/pecgs-25 -J PE001C1_precall -oo /storage1/fs1/dinglab/Active/Projects/estorrs/pecgs_resources/cnv/pon/pecgs_pon_v1/precall/logs/PE001C1_precall.txt 'export PATH=/miniconda/envs/cnv/bin:$PATH && gatk CollectReadCounts -I /storage1/fs1/dinglab/Active/Projects/PECGS/PECGS_analysis/pecgs_batch1/runs/PE001C1_1c32a190-745c-421b-9f2b-eee3ea6e9e81/cromwell-workdir/cromwell-executions/pecgs_TN_wxs_fq.cwl/877c6c49-90a7-40af-8330-b81027660cdc/call-align_tumor_wxs/execution/output.bam -L /storage1/fs1/dinglab/Active/Projects/estorrs/pecgs_resources/cnv/db/IDT_xGen_Exome_Research_Panel_v1.hg38.removed_alt_chr.autosome_only.bed.preprocessed.exome.interval_list -interval-merging-rule OVERLAPPING_ONLY -O /storage1/fs1/dinglab/Active/Projects/estorrs/pecgs_resources/cnv/pon/pecgs_pon_v1/precall/PE001C1.N.counts.hdf5'
bsub -R 'select[mem>28GB] rusage[mem=28GB] span[hosts=1]' -M 28GB -n 1 -q dinglab -G compute-dinglab -a 'docker(estorrs/pecgs_cnv:0.0.2)' -g /estorrs/pecgs-25 -J PE001C1_precall -oo /storage1/fs1/dinglab/Active/Projects/estorrs/pecgs_resources/cnv/pon/pecgs_pon_v1/precall/logs/PE001C1_precall.txt 'export PATH=/miniconda/envs/cnv/bin:$PATH && gatk CollectReadCounts -I /storage1/fs1/dinglab/Active/Projects/PECGS/PECGS_analysis/pecgs_batch1/runs/PE001C1_1c32a190-745c-421b-9f2b-eee3ea6e9e81/cromwell-workdir/cromwell-executions/pecgs_TN_wxs_fq.cwl/877c6c49-90a7-40af-8330-b81027660cdc/call-align_normal_wxs/execution/output.bam -L /storage1/fs1/dinglab/Active/Projects/estorrs/pecgs_resources/cnv/db/IDT_xGen_Exome_Research_Panel_v1.hg38.removed_alt_chr.autosome_only.bed.preprocessed.exome.interval_list -interval-merging-rule OVERLAPPING_ONLY -O /storage1/fs1/dinglab/Active/Projects/estorrs/pecgs_resources/cnv/pon/pecgs_pon_v1/precall/PE001C1.N.counts.hdf5'
bsub -R 'select[mem>28GB] rusage[mem=28GB] span[hosts=1]' -M 28GB -n 1 -q dinglab -G compute-dinglab -a 'docker(estorrs/pecgs_cnv:0.0.2)' -g /estorrs/pecgs-25 -J PE002C1_precall -oo /storage1/fs1/dinglab/Active/Projects/estorrs/pecgs_resources/cnv/pon/pecgs_pon_v1/precall/logs/PE002C1_precall.txt 'export PATH=/miniconda/envs/cnv/bin:$PATH && gatk CollectReadCounts -I /storage1/fs1/dinglab/Active/Projects/PECGS/PECGS_analysis/pecgs_batch1/runs/PE002C1_dfd8fa5c-873e-4ce8-99eb-c8e361104428/cromwell-workdir/cromwell-executions/pecgs_TN_wxs_fq.cwl/dce57945-2818-45f0-8de7-797a8f2d4dab/call-align_tumor_wxs/execution/output.bam -L /storage1/fs1/dinglab/Active/Projects/estorrs/pecgs_resources/cnv/db/IDT_xGen_Exome_Research_Panel_v1.hg38.removed_alt_chr.autosome_only.bed.preprocessed.exome.interval_list -interval-merging-rule OVERLAPPING_ONLY -O /storage1/fs1/dinglab/Active/Projects/estorrs/pecgs_resources/cnv/pon/pecgs_pon_v1/precall/PE002C1.N.counts.hdf5'
bsub -R 'select[mem>28GB] rusage[mem=28GB] span[hosts=1]' -M 28GB -n 1 -q dinglab -G compute-dinglab -a 'docker(estorrs/pecgs_cnv:0.0.2)' -g /estorrs/pecgs-25 -J PE002C1_precall -oo /storage1/fs1/dinglab/Active/Projects/estorrs/pecgs_resources/cnv/pon/pecgs_pon_v1/precall/logs/PE002C1_precall.txt 'export PATH=/miniconda/envs/cnv/bin:$PATH && gatk CollectReadCounts -I /storage1/fs1/dinglab/Active/Projects/PECGS/PECGS_analysis/pecgs_batch1/runs/PE002C1_dfd8fa5c-873e-4ce8-99eb-c8e361104428/cromwell-workdir/cromwell-executions/pecgs_TN_wxs_fq.cwl/dce57945-2818-45f0-8de7-797a8f2d4dab/call-align_normal_wxs/execution/output.bam -L /storage1/fs1/dinglab/Active/Projects/estorrs/pecgs_resources/cnv/db/IDT_xGen_Exome_Research_Panel_v1.hg38.removed_alt_chr.autosome_only.bed.preprocessed.exome.interval_list -interval-merging-rule OVERLAPPING_ONLY -O /storage1/fs1/dinglab/Active/Projects/estorrs/pecgs_resources/cnv/pon/pecgs_pon_v1/precall/PE002C1.N.counts.hdf5'
bsub -R 'select[mem>28GB] rusage[mem=28GB] span[hosts=1]' -M 28GB -n 1 -q dinglab -G compute-dinglab -a 'docker(estorrs/pecgs_cnv:0.0.2)' -g /estorrs/pecgs-25 -J PE0038U1_precall -oo /storage1/fs1/dinglab/Active/Projects/estorrs/pecgs_resources/cnv/pon/pecgs_pon_v1/precall/logs/PE0038U1_precall.txt 'export PATH=/miniconda/envs/cnv/bin:$PATH && gatk CollectReadCounts -I /storage1/fs1/dinglab/Active/Projects/PECGS/PECGS_analysis/pecgs_batch1/runs/PE0038U1_dec733ea-9d93-493e-9fe2-5d2bd1c126fa/cromwell-workdir/cromwell-executions/pecgs_TN_wxs_fq.cwl/6a6dcdc0-e4ec-4e9f-ad00-1fb369e7f2c3/call-align_tumor_wxs/execution/output.bam -L /storage1/fs1/dinglab/Active/Projects/estorrs/pecgs_resources/cnv/db/IDT_xGen_Exome_Research_Panel_v1.hg38.removed_alt_chr.autosome_only.bed.preprocessed.exome.interval_list -interval-merging-rule OVERLAPPING_ONLY -O /storage1/fs1/dinglab/Active/Projects/estorrs/pecgs_resources/cnv/pon/pecgs_pon_v1/precall/PE0038U1.N.counts.hdf5'
bsub -R 'select[mem>28GB] rusage[mem=28GB] span[hosts=1]' -M 28GB -n 1 -q dinglab -G compute-dinglab -a 'docker(estorrs/pecgs_cnv:0.0.2)' -g /estorrs/pecgs-25 -J PE0038U1_precall -oo /storage1/fs1/dinglab/Active/Projects/estorrs/pecgs_resources/cnv/pon/pecgs_pon_v1/precall/logs/PE0038U1_precall.txt 'export PATH=/miniconda/envs/cnv/bin:$PATH && gatk CollectReadCounts -I /storage1/fs1/dinglab/Active/Projects/PECGS/PECGS_analysis/pecgs_batch1/runs/PE0038U1_dec733ea-9d93-493e-9fe2-5d2bd1c126fa/cromwell-workdir/cromwell-executions/pecgs_TN_wxs_fq.cwl/6a6dcdc0-e4ec-4e9f-ad00-1fb369e7f2c3/call-align_normal_wxs/execution/output.bam -L /storage1/fs1/dinglab/Active/Projects/estorrs/pecgs_resources/cnv/db/IDT_xGen_Exome_Research_Panel_v1.hg38.removed_alt_chr.autosome_only.bed.preprocessed.exome.interval_list -interval-merging-rule OVERLAPPING_ONLY -O /storage1/fs1/dinglab/Active/Projects/estorrs/pecgs_resources/cnv/pon/pecgs_pon_v1/precall/PE0038U1.N.counts.hdf5'
bsub -R 'select[mem>28GB] rusage[mem=28GB] span[hosts=1]' -M 28GB -n 1 -q dinglab -G compute-dinglab -a 'docker(estorrs/pecgs_cnv:0.0.2)' -g /estorrs/pecgs-25 -J PE003C1_precall -oo /storage1/fs1/dinglab/Active/Projects/estorrs/pecgs_resources/cnv/pon/pecgs_pon_v1/precall/logs/PE003C1_precall.txt 'export PATH=/miniconda/envs/cnv/bin:$PATH && gatk CollectReadCounts -I /storage1/fs1/dinglab/Active/Projects/PECGS/PECGS_analysis/pecgs_batch1/runs/PE003C1_faa5967f-8b8e-4163-ba93-da3043ffe4d5/cromwell-workdir/cromwell-executions/pecgs_TN_wxs_fq.cwl/e97345a4-714f-4d02-9fe7-d27a048b2495/call-align_tumor_wxs/execution/output.bam -L /storage1/fs1/dinglab/Active/Projects/estorrs/pecgs_resources/cnv/db/IDT_xGen_Exome_Research_Panel_v1.hg38.removed_alt_chr.autosome_only.bed.preprocessed.exome.interval_list -interval-merging-rule OVERLAPPING_ONLY -O /storage1/fs1/dinglab/Active/Projects/estorrs/pecgs_resources/cnv/pon/pecgs_pon_v1/precall/PE003C1.N.counts.hdf5'
bsub -R 'select[mem>28GB] rusage[mem=28GB] span[hosts=1]' -M 28GB -n 1 -q dinglab -G compute-dinglab -a 'docker(estorrs/pecgs_cnv:0.0.2)' -g /estorrs/pecgs-25 -J PE003C1_precall -oo /storage1/fs1/dinglab/Active/Projects/estorrs/pecgs_resources/cnv/pon/pecgs_pon_v1/precall/logs/PE003C1_precall.txt 'export PATH=/miniconda/envs/cnv/bin:$PATH && gatk CollectReadCounts -I /storage1/fs1/dinglab/Active/Projects/PECGS/PECGS_analysis/pecgs_batch1/runs/PE003C1_faa5967f-8b8e-4163-ba93-da3043ffe4d5/cromwell-workdir/cromwell-executions/pecgs_TN_wxs_fq.cwl/e97345a4-714f-4d02-9fe7-d27a048b2495/call-align_normal_wxs/execution/output.bam -L /storage1/fs1/dinglab/Active/Projects/estorrs/pecgs_resources/cnv/db/IDT_xGen_Exome_Research_Panel_v1.hg38.removed_alt_chr.autosome_only.bed.preprocessed.exome.interval_list -interval-merging-rule OVERLAPPING_ONLY -O /storage1/fs1/dinglab/Active/Projects/estorrs/pecgs_resources/cnv/pon/pecgs_pon_v1/precall/PE003C1.N.counts.hdf5'
bsub -R 'select[mem>28GB] rusage[mem=28GB] span[hosts=1]' -M 28GB -n 1 -q dinglab -G compute-dinglab -a 'docker(estorrs/pecgs_cnv:0.0.2)' -g /estorrs/pecgs-25 -J PE0043A_precall -oo /storage1/fs1/dinglab/Active/Projects/estorrs/pecgs_resources/cnv/pon/pecgs_pon_v1/precall/logs/PE0043A_precall.txt 'export PATH=/miniconda/envs/cnv/bin:$PATH && gatk CollectReadCounts -I /storage1/fs1/dinglab/Active/Projects/PECGS/PECGS_analysis/pecgs_batch1/runs/PE0043A_c309412b-3dfc-45f2-8909-5c492858ecaa/cromwell-workdir/cromwell-executions/pecgs_TN_wxs_fq.cwl/9970b67f-025d-49df-be94-0fbbb84baa85/call-align_tumor_wxs/execution/output.bam -L /storage1/fs1/dinglab/Active/Projects/estorrs/pecgs_resources/cnv/db/IDT_xGen_Exome_Research_Panel_v1.hg38.removed_alt_chr.autosome_only.bed.preprocessed.exome.interval_list -interval-merging-rule OVERLAPPING_ONLY -O /storage1/fs1/dinglab/Active/Projects/estorrs/pecgs_resources/cnv/pon/pecgs_pon_v1/precall/PE0043A.N.counts.hdf5'
bsub -R 'select[mem>28GB] rusage[mem=28GB] span[hosts=1]' -M 28GB -n 1 -q dinglab -G compute-dinglab -a 'docker(estorrs/pecgs_cnv:0.0.2)' -g /estorrs/pecgs-25 -J PE0043A_precall -oo /storage1/fs1/dinglab/Active/Projects/estorrs/pecgs_resources/cnv/pon/pecgs_pon_v1/precall/logs/PE0043A_precall.txt 'export PATH=/miniconda/envs/cnv/bin:$PATH && gatk CollectReadCounts -I /storage1/fs1/dinglab/Active/Projects/PECGS/PECGS_analysis/pecgs_batch1/runs/PE0043A_c309412b-3dfc-45f2-8909-5c492858ecaa/cromwell-workdir/cromwell-executions/pecgs_TN_wxs_fq.cwl/9970b67f-025d-49df-be94-0fbbb84baa85/call-align_normal_wxs/execution/output.bam -L /storage1/fs1/dinglab/Active/Projects/estorrs/pecgs_resources/cnv/db/IDT_xGen_Exome_Research_Panel_v1.hg38.removed_alt_chr.autosome_only.bed.preprocessed.exome.interval_list -interval-merging-rule OVERLAPPING_ONLY -O /storage1/fs1/dinglab/Active/Projects/estorrs/pecgs_resources/cnv/pon/pecgs_pon_v1/precall/PE0043A.N.counts.hdf5'
bsub -R 'select[mem>28GB] rusage[mem=28GB] span[hosts=1]' -M 28GB -n 1 -q dinglab -G compute-dinglab -a 'docker(estorrs/pecgs_cnv:0.0.2)' -g /estorrs/pecgs-25 -J PE005A1_precall -oo /storage1/fs1/dinglab/Active/Projects/estorrs/pecgs_resources/cnv/pon/pecgs_pon_v1/precall/logs/PE005A1_precall.txt 'export PATH=/miniconda/envs/cnv/bin:$PATH && gatk CollectReadCounts -I /storage1/fs1/dinglab/Active/Projects/PECGS/PECGS_analysis/pecgs_batch1/runs/PE005A1_fa7d2b83-f10b-441f-9073-44a0a9b0fdde/cromwell-workdir/cromwell-executions/pecgs_TN_wxs_fq.cwl/1c698aad-dec9-48eb-b7b4-ba2f52e181e4/call-align_tumor_wxs/execution/output.bam -L /storage1/fs1/dinglab/Active/Projects/estorrs/pecgs_resources/cnv/db/IDT_xGen_Exome_Research_Panel_v1.hg38.removed_alt_chr.autosome_only.bed.preprocessed.exome.interval_list -interval-merging-rule OVERLAPPING_ONLY -O /storage1/fs1/dinglab/Active/Projects/estorrs/pecgs_resources/cnv/pon/pecgs_pon_v1/precall/PE005A1.N.counts.hdf5'
bsub -R 'select[mem>28GB] rusage[mem=28GB] span[hosts=1]' -M 28GB -n 1 -q dinglab -G compute-dinglab -a 'docker(estorrs/pecgs_cnv:0.0.2)' -g /estorrs/pecgs-25 -J PE005A1_precall -oo /storage1/fs1/dinglab/Active/Projects/estorrs/pecgs_resources/cnv/pon/pecgs_pon_v1/precall/logs/PE005A1_precall.txt 'export PATH=/miniconda/envs/cnv/bin:$PATH && gatk CollectReadCounts -I /storage1/fs1/dinglab/Active/Projects/PECGS/PECGS_analysis/pecgs_batch1/runs/PE005A1_fa7d2b83-f10b-441f-9073-44a0a9b0fdde/cromwell-workdir/cromwell-executions/pecgs_TN_wxs_fq.cwl/1c698aad-dec9-48eb-b7b4-ba2f52e181e4/call-align_normal_wxs/execution/output.bam -L /storage1/fs1/dinglab/Active/Projects/estorrs/pecgs_resources/cnv/db/IDT_xGen_Exome_Research_Panel_v1.hg38.removed_alt_chr.autosome_only.bed.preprocessed.exome.interval_list -interval-merging-rule OVERLAPPING_ONLY -O /storage1/fs1/dinglab/Active/Projects/estorrs/pecgs_resources/cnv/pon/pecgs_pon_v1/precall/PE005A1.N.counts.hdf5'
bsub -R 'select[mem>28GB] rusage[mem=28GB] span[hosts=1]' -M 28GB -n 1 -q dinglab -G compute-dinglab -a 'docker(estorrs/pecgs_cnv:0.0.2)' -g /estorrs/pecgs-25 -J PE0078U1_precall -oo /storage1/fs1/dinglab/Active/Projects/estorrs/pecgs_resources/cnv/pon/pecgs_pon_v1/precall/logs/PE0078U1_precall.txt 'export PATH=/miniconda/envs/cnv/bin:$PATH && gatk CollectReadCounts -I /storage1/fs1/dinglab/Active/Projects/PECGS/PECGS_analysis/pecgs_batch1/runs/PE0078U1_38d6995c-28e8-46d1-9b29-3c1d9c693b94/cromwell-workdir/cromwell-executions/pecgs_TN_wxs_fq.cwl/ea0a4889-00b6-4ea1-b7c0-55d3a54f37a5/call-align_tumor_wxs/execution/output.bam -L /storage1/fs1/dinglab/Active/Projects/estorrs/pecgs_resources/cnv/db/IDT_xGen_Exome_Research_Panel_v1.hg38.removed_alt_chr.autosome_only.bed.preprocessed.exome.interval_list -interval-merging-rule OVERLAPPING_ONLY -O /storage1/fs1/dinglab/Active/Projects/estorrs/pecgs_resources/cnv/pon/pecgs_pon_v1/precall/PE0078U1.N.counts.hdf5'
bsub -R 'select[mem>28GB] rusage[mem=28GB] span[hosts=1]' -M 28GB -n 1 -q dinglab -G compute-dinglab -a 'docker(estorrs/pecgs_cnv:0.0.2)' -g /estorrs/pecgs-25 -J PE0078U1_precall -oo /storage1/fs1/dinglab/Active/Projects/estorrs/pecgs_resources/cnv/pon/pecgs_pon_v1/precall/logs/PE0078U1_precall.txt 'export PATH=/miniconda/envs/cnv/bin:$PATH && gatk CollectReadCounts -I /storage1/fs1/dinglab/Active/Projects/PECGS/PECGS_analysis/pecgs_batch1/runs/PE0078U1_38d6995c-28e8-46d1-9b29-3c1d9c693b94/cromwell-workdir/cromwell-executions/pecgs_TN_wxs_fq.cwl/ea0a4889-00b6-4ea1-b7c0-55d3a54f37a5/call-align_normal_wxs/execution/output.bam -L /storage1/fs1/dinglab/Active/Projects/estorrs/pecgs_resources/cnv/db/IDT_xGen_Exome_Research_Panel_v1.hg38.removed_alt_chr.autosome_only.bed.preprocessed.exome.interval_list -interval-merging-rule OVERLAPPING_ONLY -O /storage1/fs1/dinglab/Active/Projects/estorrs/pecgs_resources/cnv/pon/pecgs_pon_v1/precall/PE0078U1.N.counts.hdf5'
bsub -R 'select[mem>28GB] rusage[mem=28GB] span[hosts=1]' -M 28GB -n 1 -q dinglab -G compute-dinglab -a 'docker(estorrs/pecgs_cnv:0.0.2)' -g /estorrs/pecgs-25 -J PEx011U1_precall -oo /storage1/fs1/dinglab/Active/Projects/estorrs/pecgs_resources/cnv/pon/pecgs_pon_v1/precall/logs/PEx011U1_precall.txt 'export PATH=/miniconda/envs/cnv/bin:$PATH && gatk CollectReadCounts -I /storage1/fs1/dinglab/Active/Projects/PECGS/PECGS_analysis/pecgs_batch1/runs/PEx011U1_2a6ecea8-8d07-428b-bfb2-729e3d429436/cromwell-workdir/cromwell-executions/pecgs_TN_wxs_fq.cwl/e8084d62-e596-4f01-88a5-3e525f4eb1c0/call-align_tumor_wxs/execution/output.bam -L /storage1/fs1/dinglab/Active/Projects/estorrs/pecgs_resources/cnv/db/IDT_xGen_Exome_Research_Panel_v1.hg38.removed_alt_chr.autosome_only.bed.preprocessed.exome.interval_list -interval-merging-rule OVERLAPPING_ONLY -O /storage1/fs1/dinglab/Active/Projects/estorrs/pecgs_resources/cnv/pon/pecgs_pon_v1/precall/PEx011U1.N.counts.hdf5'
bsub -R 'select[mem>28GB] rusage[mem=28GB] span[hosts=1]' -M 28GB -n 1 -q dinglab -G compute-dinglab -a 'docker(estorrs/pecgs_cnv:0.0.2)' -g /estorrs/pecgs-25 -J PEx011U1_precall -oo /storage1/fs1/dinglab/Active/Projects/estorrs/pecgs_resources/cnv/pon/pecgs_pon_v1/precall/logs/PEx011U1_precall.txt 'export PATH=/miniconda/envs/cnv/bin:$PATH && gatk CollectReadCounts -I /storage1/fs1/dinglab/Active/Projects/PECGS/PECGS_analysis/pecgs_batch1/runs/PEx011U1_2a6ecea8-8d07-428b-bfb2-729e3d429436/cromwell-workdir/cromwell-executions/pecgs_TN_wxs_fq.cwl/e8084d62-e596-4f01-88a5-3e525f4eb1c0/call-align_normal_wxs/execution/output.bam -L /storage1/fs1/dinglab/Active/Projects/estorrs/pecgs_resources/cnv/db/IDT_xGen_Exome_Research_Panel_v1.hg38.removed_alt_chr.autosome_only.bed.preprocessed.exome.interval_list -interval-merging-rule OVERLAPPING_ONLY -O /storage1/fs1/dinglab/Active/Projects/estorrs/pecgs_resources/cnv/pon/pecgs_pon_v1/precall/PEx011U1.N.counts.hdf5'
bsub -R 'select[mem>28GB] rusage[mem=28GB] span[hosts=1]' -M 28GB -n 1 -q dinglab -G compute-dinglab -a 'docker(estorrs/pecgs_cnv:0.0.2)' -g /estorrs/pecgs-25 -J PEx012U1_precall -oo /storage1/fs1/dinglab/Active/Projects/estorrs/pecgs_resources/cnv/pon/pecgs_pon_v1/precall/logs/PEx012U1_precall.txt 'export PATH=/miniconda/envs/cnv/bin:$PATH && gatk CollectReadCounts -I /storage1/fs1/dinglab/Active/Projects/PECGS/PECGS_analysis/pecgs_batch1/runs/PEx012U1_823074a6-766d-4272-939c-25f8a42aa739/cromwell-workdir/cromwell-executions/pecgs_TN_wxs_fq.cwl/27f58bd0-65ed-44a5-b61f-8f1a7a9903a8/call-align_tumor_wxs/execution/output.bam -L /storage1/fs1/dinglab/Active/Projects/estorrs/pecgs_resources/cnv/db/IDT_xGen_Exome_Research_Panel_v1.hg38.removed_alt_chr.autosome_only.bed.preprocessed.exome.interval_list -interval-merging-rule OVERLAPPING_ONLY -O /storage1/fs1/dinglab/Active/Projects/estorrs/pecgs_resources/cnv/pon/pecgs_pon_v1/precall/PEx012U1.N.counts.hdf5'
bsub -R 'select[mem>28GB] rusage[mem=28GB] span[hosts=1]' -M 28GB -n 1 -q dinglab -G compute-dinglab -a 'docker(estorrs/pecgs_cnv:0.0.2)' -g /estorrs/pecgs-25 -J PEx012U1_precall -oo /storage1/fs1/dinglab/Active/Projects/estorrs/pecgs_resources/cnv/pon/pecgs_pon_v1/precall/logs/PEx012U1_precall.txt 'export PATH=/miniconda/envs/cnv/bin:$PATH && gatk CollectReadCounts -I /storage1/fs1/dinglab/Active/Projects/PECGS/PECGS_analysis/pecgs_batch1/runs/PEx012U1_823074a6-766d-4272-939c-25f8a42aa739/cromwell-workdir/cromwell-executions/pecgs_TN_wxs_fq.cwl/27f58bd0-65ed-44a5-b61f-8f1a7a9903a8/call-align_normal_wxs/execution/output.bam -L /storage1/fs1/dinglab/Active/Projects/estorrs/pecgs_resources/cnv/db/IDT_xGen_Exome_Research_Panel_v1.hg38.removed_alt_chr.autosome_only.bed.preprocessed.exome.interval_list -interval-merging-rule OVERLAPPING_ONLY -O /storage1/fs1/dinglab/Active/Projects/estorrs/pecgs_resources/cnv/pon/pecgs_pon_v1/precall/PEx012U1.N.counts.hdf5'