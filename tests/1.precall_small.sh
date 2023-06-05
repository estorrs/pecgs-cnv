#!/bin/bash
mkdir -p /storage1/fs1/dinglab/Active/Projects/estorrs/pecgs_resources/cnv/pon/pecgs_pon_v1/precall/logs
export LSF_DOCKER_VOLUMES="/storage1/fs1/m.wyczalkowski:/storage1/fs1/m.wyczalkowski /storage1/fs1/dinglab:/storage1/fs1/dinglab /scratch1/fs1/dinglab:/scratch1/fs1/dinglab /storage1/fs1/dinglab/Active/Projects/estorrs/pecgs_resources/cnv/pon/pecgs_pon_v1/precall/logs:/storage1/fs1/dinglab/Active/Projects/estorrs/pecgs_resources/cnv/pon/pecgs_pon_v1/precall/logs"
bgadd -L 25 /estorrs/pecgs-25