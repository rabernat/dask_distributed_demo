#!/bin/bash

#SBATCH --account=ocp
#SBATCH --exclusive
#SBATCH -N 1
#SBATCH -J jupyter
#SBATCH --time=12:00:00

source activate dask_distributed

cd $SLURM_SUBMIT_DIR

# where to store local files
LDIR="/local/dask-worker-dir-$$"

export DASK_SCHEDULER_FILE="$HOME/.dask_scheduler_file_$$.json"

dask-scheduler  --scheduler-file $DASK_SCHEDULER_FILE --interface ib0 &

# wait for the scheduler to start
sleep 10

dask-worker --nthreads 24 --local-directory $LDIR \
	       	--scheduler-file $DASK_SCHEDULER_FILE --interface ib0 &

# the notebook will need to get the environment variable DASK_SCHEDULER_FILE
# to find the scheduler

JUPYTER_RUNTIME_DIR=$HOME/.jupyter/runtime jupyter notebook --ip='*' --no-browser .
