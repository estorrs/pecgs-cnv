$namespaces:
  sbg: https://www.sevenbridges.com/
arguments:
- position: 0
  prefix: --gene-level-script
  valueFrom: /pecgs-cnv/cnv/segment_to_geneLevel.py
- position: 0
  prefix: --merge-gene-script
  valueFrom: /pecgs-cnv/cnv/mergeMultipleFilesToOne.py
- position: 0
  prefix: --out-dir
  valueFrom: outputs
baseCommand:
- python
- /pecgs-cnv/cnv/cnv.py
class: CommandLineTool
cwlVersion: v1.0
id: cnv
inputs:
- id: sample
  inputBinding:
    position: '1'
  type: string
- id: tumor_bam
  inputBinding:
    position: '2'
  type: File
- id: normal_bam
  inputBinding:
    position: '3'
  type: File
- id: genome
  inputBinding:
    position: '0'
    prefix: --genome
  type: File
- id: genome_dict
  inputBinding:
    position: '0'
    prefix: --genome-dict
  type: File
- id: target_interval_list
  inputBinding:
    position: '0'
    prefix: --target-interval-list
  type: File
- id: common_biallelic
  inputBinding:
    position: '0'
    prefix: --common-biallelic
  type: File
- id: protein_coding_gene
  inputBinding:
    position: '0'
    prefix: --protein-coding-gene
  type: File
- id: pool_of_normals
  inputBinding:
    position: '0'
    prefix: --pool-of-normals
  type: File
- default: /miniconda/envs/cnv/bin:$PATH
  id: environ_PATH
  type: string?
label: cnv
outputs:
- id: gene_level_cnv
  outputBinding:
    glob: outputs/*T.geneLevel.from_seg.cn
  type: File
requirements:
- class: DockerRequirement
  dockerPull: estorrs/pecgs_cnv:0.0.1
- class: ResourceRequirement
  ramMin: 50000
- class: EnvVarRequirement
  envDef:
    PATH: $(inputs.environ_PATH)
