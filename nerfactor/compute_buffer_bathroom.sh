#!/usr/bin/env bash

scene='bathroom'
gpus='1'
proj_root='/home/ccw/cloned_repos/nerfactor'
repo_dir="$proj_root"
data_root="$repo_dir/data/IBL-NeRF/${scene}"
imh='512'
lr=5e-4

trained_nerf="$proj_root/output/train/${scene}_nerf/lr$lr"
occu_thres='0.5'
scene_bbox='-4.0,4.0,-4.0,4.0,-4.0,4.0'

out_root="$proj_root/output/surf/$scene"
mlp_chunk='1000000'
REPO_DIR="$repo_dir" "$repo_dir/nerfactor/geometry_from_nerf_run.sh" "$gpus" --data_root="$data_rot" --trained_nerf="$trained_nerf" --out_root="$out_root" --imh="$imh" --scene_bbox="$scene_bbox" --occu_thres="$occu_thres" --mlp_chunk="$mlp_chunk"