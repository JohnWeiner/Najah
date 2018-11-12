#!/bin/bash
# This is a bash script for running ldos_nanoslab.py...either mp or pmp version
#-----------------------------------------------------------------
#remove old  files
rm ldos_slab*.out 
rm ldos_slab*.dat
rm flux_slab*.dat
rm w_slab*.dat

for i in `seq 1 1 2`; do #slab thickness increment index loop (in um)
   # python -u ldos_nanoslab.py -res 60 -wvl $i | tee -a ldos_slab${i}.out; #single-processor version
   # mpirun -np 4 python -u ldos_nanoslab_pmp.py -res 200  -wvl 0.500 -w_init 0.050 -dw 0.005 -n ${i} | tee -a ldos_slab_${i}.out; #parallel version
    python -u ldos_nanoslab_pmp.py -res 200  -wvl 0.500 -w_init 0.050 -dw 0.005 -n ${i} | tee -a\
											       ldos_slab_${i}.out; #single core version
    grep ldos0: ldos_slab_${i}.out |cut -d, -f2- >> ldos_slab.dat;
    grep normalised ldos_slab_${i}.out | cut -d, -f2- >> flux_slab.dat;
    grep 'slab thickness' ldos_slab_${i}.out | cut -d, -f2- >>w_slab.dat;
    printf "\n"
done
