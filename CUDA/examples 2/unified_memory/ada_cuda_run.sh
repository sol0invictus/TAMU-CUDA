## Only 5 login nodes (ada1, ada2, ..., ada5) on Ada are 
## equipped with either one or two K20s.
##
## Command line to submit a job to a GPU node on Ada.
##
## $bsub < ada_cuda_run.sh
##
## the default executable name is a.out, please change it accordingly.
##
#BSUB -J CUDAExample         #Set the job name to "CUDAExample"
#BSUB -L /bin/bash           #Uses the bash login shell to initialize the job's execution environment.
#BSUB -W 1:00                #Set the wall clock limit to 2hr
#BSUB -n 1                   #Request 1 core
#BSUB -R "span[ptile=1]"     #Request 1 core per node.
#BSUB -R "rusage[mem=2560]"  #Request 2560MB per process (CPU) for the job
#BSUB -M 2560                #Set the per process enforceable memory limit to 2560MB.
#BSUB -o CUDAExampleOut.%J   #Send stdout and stderr to "Example4Out.[jobID]"
#BSUB -R "select[gpu]"       #Request a node with a GPU

##OPTIONAL JOB SPECIFICATIONS
#BSUB -u jtao@tamu.edu       #Send all emails to your email address.
#BSUB -B -N                  #Send email on job begin (-B) and end (-N)

## load CUDA module ()
ml CUDA
nvprof ./a.out
