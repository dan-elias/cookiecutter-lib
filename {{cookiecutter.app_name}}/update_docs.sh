#!/usr/bin/env bash
set -e

# build the docs
cd docs
make clean
make html
cd ..
