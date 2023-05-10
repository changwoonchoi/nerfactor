#!/usr/bin/env/bash

scene="kitchen_no_transparent"
gpus='0'
repo_dir='/home/ccw/cloned_repos/nerfactor'
data_root="/home/ccw/cloned_repos/nerfactor/data/IBL-NeRF/${scene}"

imh='360'
lr='5e-4'

near='0.143'; far='8.212'
outroot="/home/ccw/cloned_repos/nerfactor/output/train/${scene}_nerf"
REPO_DIR="$repo_dir" "$repo_dir/nerfactor/trainvali_run.sh" "$gpus" --config='nerf.ini' --config_override="data_root=$data_root,imh=$imh,near=$near,far=$far,lr=$lr,outroot=$outroot"

ckpt="$outroot/lr$lr/checkpoints/ckpt-10"
REPO_DIR="$repo_dir" "$repo_dir/nerfactor/nerf_test_run.sh" "$gpus" --ckpt="$ckpt"

