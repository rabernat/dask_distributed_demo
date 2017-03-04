#!/bin/bash

source activate dask_distributed
dask-scheduler --scheduler-file schedule_file & dask-worker --scheduler-file schedule_file &
JUPYTER_RUNTIME_DIR=$HOME/.jupyter/runtime jupyter notebook --ip='*' --no-browser .
