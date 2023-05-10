#!/usr/bin/env bash

scene='classroom'
gpus='4'
proj_root='/home/ccw/cloned_repos/nerfactor'
repo_dir="$proj_root"
data_root="$repo_dir/data/IBL-NeRF/${scene}"
imh='360'
lr=5e-4

trained_nerf="$proj_root/output/train/${scene}_nerf/lr$lr"
occu_thres='0.5'
scene_bbox='-150,150,-150,150,-150,150'

out_root="$proj_root/output/surf/$scene"
mlp_chunk='1000000'
REPO_DIR="$repo_dir" "$repo_dir/nerfactor/geometry_from_nerf_run.sh" "$gpus" --data_root="$data_rot" --trained_nerf="$trained_nerf" --out_root="$out_root" --imh="$imh" --scene_bbox="$scene_bbox" --occu_thres="$occu_thres" --mlp_chunk="$mlp_chunk"