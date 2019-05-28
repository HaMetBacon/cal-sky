#!/bin/bash

if [ $(uname) == 'Darwin' ] ; then export TMPDIR='/tmp'; fi
echo $TMPDIR

source ~/.bashrc

boxsize=2000
boxsizeot=-`echo $boxsize | awk '{print $1/2}'`
nres=1024
testdata=$SCRATCH/ppruns/gbt/1024Mpc_n624_nb64_nt8/fields/Fvec_1024Mpc_n624_nb64_nt8_13579

echo '------- 21cm test low-z --------'
mapnum=4
nchunk=1
binary_only=0
testname='21cm_low-z'
nproc=32
mpirun -n $nproc ../bin/lin2map -P param.low-z -v -D $testdata -C $nchunk -N $nres -B $boxsize -p $boxsize -x $boxsizeot -y $boxsizeot -z $boxsizeot -m $mapnum -o $testname -b $binary_only
cp weights.dat weights_low-z.dat
