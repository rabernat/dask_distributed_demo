#!/bin/bash

#SBATCH --account=ocp
#SBATCH --exclusive
#SBATCH -N 1
#SBATCH -J worker
#SBATCH --time=12:00:00
#SBATCH --array=0-4 

df /local

# where to store local files
LDIR="/local/dask-worker-dir-$$"

source activate dask_distributed
dask-worker --memory-limit 100e9 --nthreads 4 --local-directory $LDIR \
       	--scheduler-file $HOME/.dask_schedule_file.json --interface ib0

