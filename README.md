# Dask Distributed Demos

For use on Habanero

## set up environment

This has been tested in the conda environment described in `package-list.txt`.
The file `environment.yml` is a template for creating such an environment.
Or you can install distributed into an existing environment. I think it all
needs python 3, but I'm not sure about that.

## scheduler, worker, and notebook on a single node

Launch the following job

    $ sbatch jobscript_everything_single_node.sh

Once this job is running, you will see something like this in the output of `sbatch`

     JOBID PARTITION     NAME     USER ST       TIME  NODES NODELIST(REASON)
    458297     short  jupyter   ra2697  R    7:18:50      1 node132

This shows that the job is running on compute node `node132`.

Open two ssh tunnels to this node from your laptop. One for the dask scheduler bokeh
dashboard:

    ssh -L 8787:node132:8787 haba

and one for the jupyter notebook

    ssh -L 9999:node132:8888 haba

Open tabs in your browser to http://localhost:9999 (notebook) and http://localhost:9999 (bokeh).
To connect to the client, run the following commands from your notebook:

    import os
    from dask.distributed import Client
    client = Client(os.environ['DASK_SCHEDULER_FILE'])



