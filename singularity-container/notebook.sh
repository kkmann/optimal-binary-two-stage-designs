#!/usr/bin/env bash

set -ex

mkdir -p .jupyter/home

singularity exec \
  --bind $PWD/.jupyter:/run/user \
  --home $PWD/.jupyter/home \
  singularity-container/bad-singularity.sif \
  jupyter notebook \
  --no-browser \
  --ip=127.0.0.1
