#!/bin/bash

#SBATCH --account=ocp
#SBATCH --exclusive
#SBATCH -N 1
#SBATCH -J worker
#SBATCH --time=12:00:00
#SBATCH --array=0-4 

df /local

# where to store local files
LDIR="/local"

source activate dask_distributed
dask-worker --memory-limit 0.08 --nprocs 12 --nthreads 1 --local-directory $LDIR \
       	--scheduler-file $HOME/.dask_schedule_file.json --interface ib0

