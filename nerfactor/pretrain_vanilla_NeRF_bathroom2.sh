#!/usr/bin/env/bash

scene='bathroom2'
gpus='1'
repo_dir='/home/ccw/project/cloned_repos/nerfactor'
data_root='/home/ccw/project/cloned_repos/nerfactor/data/IBL-NeRF/bathroom2'

imh='360'
lr='5e-4'

near='16.97'; far='76.67'
outroot="/home/ccw/project/cloned_repos/nerfactor/output/train/${scene}_nerf"
REPO_DIR="$repo_dir" "$repo_dir/nerfactor/trainvali_run.sh" "$gpus" --config='nerf.ini' --config_override="data_root=$data_root,imh=$imh,near=$near,far=$far,lr=$lr,outroot=$outroot"

ckpt="$outroot/lr$lr/checkpoints/ckpt-10"
REPO_DIR="$repo_dir" "$repo_dir/nerfactor/nerf_test_run.sh" "$gpus" --ckpt="$ckpt"

