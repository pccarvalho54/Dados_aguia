#!/bin/bash -v 
#PBS -S /bin/bash
#PBS -N FeBulk_Sem_Spin_Orbita
#PBS -l nodes=1:ppn=4
#PBS -l walltime=275:00:00
##PBS -l cput=2999:00:00
#PBS -q parallel

date

### cd to directory where the job was submitted:
cd $PBS_O_WORKDIR

### determine the number of allocated processors:
NPROCS=`wc -l < $PBS_NODEFILE`

echo "----------------"
echo "PBS job running on: `hostname`"
echo "in directory:       `pwd`"
echo "nodes: $NPROCS"
echo "nodefile:"
cat $PBS_NODEFILE
echo "----------------"

ulimit -s unlimited

module add mkl/parallel_studio_xe_2016.0.047.sp1
module add fftw/3.3.4-intel

ulimit -s unlimited

mpirun -np 4 -machinefile $PBS_NODEFILE ~/rs-asr/for/rsnew.x > job.out
