#!/bin/bash

#SBATCH --account=ocp
#SBATCH --exclusive
#SBATCH -N 1
#SBATCH -J dask_cluster
#SBATCH --time=4:00:00

source activate dask_distributed

cd $SLURM_SUBMIT_DIR
schedfile="$SLURM_SUBMIT_DIR/.dask_scheduler/dask_scheduler_file-$SLURM_JOBID"
dask-scheduler --scheduler-file $schedfile &
dask-worker --scheduler-file $schedfile &
JUPYTER_RUNTIME_DIR=$HOME/.jupyter/runtime jupyter notebook --ip='*' --no-browser .
