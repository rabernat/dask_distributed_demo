#!/bin/bash

#SBATCH --account=ocp
#SBATCH --exclusive
#SBATCH -N 1
#SBATCH -J jupyter
#SBATCH --time=12:00:00

source activate dask_distributed

cd $SLURM_SUBMIT_DIR

dask-scheduler  --scheduler-file $HOME/.dask_schedule_file.json --interface ib0 &

JUPYTER_RUNTIME_DIR=$HOME/.jupyter/runtime jupyter notebook --ip='*' --no-browser .
