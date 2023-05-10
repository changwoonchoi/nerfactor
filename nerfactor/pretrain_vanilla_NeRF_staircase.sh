#!/usr/bin/env/bash

scene="staircase"
gpus='2'
repo_dir='/home/ccw/project/cloned_repos/nerfactor'
data_root="/home/ccw/project/cloned_repos/nerfactor/data/IBL-NeRF/${scene}"

imh='640'
lr='5e-4'

near='0.02'; far='12.19'
outroot="/home/ccw/project/cloned_repos/nerfactor/output/train/${scene}_nerf"
REPO_DIR="$repo_dir" "$repo_dir/nerfactor/trainvali_run.sh" "$gpus" --config='nerf.ini' --config_override="data_root=$data_root,imh=$imh,near=$near,far=$far,lr=$lr,outroot=$outroot"

ckpt="$outroot/lr$lr/checkpoints/ckpt-10"
REPO_DIR="$repo_dir" "$repo_dir/nerfactor/nerf_test_run.sh" "$gpus" --ckpt="$ckpt"

