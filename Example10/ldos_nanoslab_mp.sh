#!/bin/bash
# This is a bash script for running ldos_nanoslab.py...either mp or pmp version
#-----------------------------------------------------------------

i=$1

echo `date`" >>>>>>>>>>>>>>>>>>>>> Starting run: ${i}"
# source activate meep
mkdir slab_noslit-out slab_slit-out out
python -u ldos_nanoslab_mp.py -res 200  -wvl 0.500 -dwvl 0.0   -w_init 0.050 -dw 0.001 -n $1 | tee -a ldos_slab_${i}.out;
# python -u ldos_nanoslab_mp.py -res 200  -wvl 0.100 -dwvl 0.050 -w_init 0.050 -dw 0.00 -n $1 | tee -a ldos_slab_${i}.out;
cp slab_noslit-out/* .
cp slab_slit-out/*   .
mv ldos_slab_${i}.out out/
echo `date`" >>>>>>>>>>>>>>>>>>>>> Ending run: $i"

