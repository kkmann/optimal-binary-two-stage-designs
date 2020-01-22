#!/usr/bin/env bash

set -ex

# create a new home folder in working directory
mkdir -p .home

singularity exec \
  --bind $PWD/.home:/run/user \
  --home $PWD/.home \
  $1 \
  jupyter lab \
  --no-browser
