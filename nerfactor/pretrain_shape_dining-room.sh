#!/usr/bin/env/bash

scene='dining-room'
gpus='4'
model='nerfactor'
overwrite='True'
proj_root='/home/ccw/project/cloned_repos/nerfactor'
repo_dir="$proj_root"

data_root="$proj_root/data/IBL-NeRF/$scene"

imh='360'
near='0.1'; far='16.44'

use_nerf_alpha='True'

surf_root="$proj_root/output/surf/$scene"
shape_outdir="$proj_root/output/train/${scene}_shape"
REPO_DIR="$repo_dir" "$repo_dir/nerfactor/trainvali_run.sh" "$gpus" --config='shape.ini' --config_override="data_root=$data_root,imh=$imh,near=$near,far=$far,use_nerf_alpha=$use_nerf_alpha,data_nerf_root=$surf_root,outroot=$shape_outdir,viewer_prefix=$viewer_prefix,overwrite=$overwrite"