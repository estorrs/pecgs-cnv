class: Workflow
cwlVersion: v1.0
id: cnv_workflow
inputs:
- id: sample
  type: string
- id: tumor_bam
  type: File
- id: normal_bam
  type: File
- id: reference_dir
  type: Directory
- id: target_interval_list
  type: File
- id: common_biallelic
  type: File
- id: protein_coding_gene
  type: File
- id: pool_of_normals
  type: File
label: cnv_workflow
outputs:
- id: gene_level_cnv
  outputSource: cnv/gene_level_cnv
  type: File
requirements:
- class: ScatterFeatureRequirement
steps:
- id: cnv
  in:
  - id: reference_dir
    source: reference_dir
  - id: target_interval_list
    source: target_interval_list
  - id: common_biallelic
    source: common_biallelic
  - id: protein_coding_gene
    source: protein_coding_gene
  - id: pool_of_normals
    source: pool_of_normals
  - id: sample
    source: sample
  - id: normal_bam
    source: stage_normal_bam/output
  - id: tumor_bam
    source: stage_tumor_bam/output
  label: cnv
  out:
  - id: gene_level_cnv
  run: ./cnv.cwl
- id: stage_normal_bam
  in:
  - id: BAM
    source: normal_bam
  label: stage_normal_bam
  out:
  - id: output
  run: ./stage_bam.cwl
- id: stage_tumor_bam
  in:
  - id: BAM
    source: tumor_bam
  label: stage_tumor_bam
  out:
  - id: output
  run: ./stage_bam.cwl
