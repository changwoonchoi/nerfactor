#!/usr/bin/env/bash

scene='bathroom2'
gpus='0'
model='nerfactor'
overwrite='True'
proj_root='/home/ccw/project/cloned_repos/nerfactor'
repo_dir="$proj_root"

data_root="$proj_root/data/IBL-NeRF/$scene"

imh='360'
near='16.97'; far='76.67'

use_nerf_alpha='True'

surf_root="$proj_root/output/surf/$scene"
shape_outdir="$proj_root/output/train/${scene}_shape"

shape_ckpt="$shape_outdir/lr1e-2/checkpoints/ckpt-2"
brdf_ckpt="$proj_root/output/train/merl/lr1e-2/checkpoints/ckpt-50"
xyz_jitter_std=0.001
test_envmap_dir="$proj_root/data/envmaps/for-render_h16/test"
shape_mode='finetune'
outroot="$proj_root/output/train/${scene}_$model"
REPO_DIR="$repo_dir" "$repo_dir/nerfactor/trainvali_run.sh" "$gpus" --config="$model.ini" --config_override="data_root=$data_root,imh=$imh,near=$near,far=$far,use_nerf_alpha=$use_nerf_alpha,data_nerf_root=$surf_root,shape_model_ckpt=$shape_ckpt,brdf_model_ckpt=$brdf_ckpt,xyz_jitter_std=$xyz_jitter_std,test_envmap_dir=$test_envmap_dir,shape_mode=$shape_mode,outroot=$outroot,viewer_prefix=$viewer_prefix,overwrite=$overwrite"
