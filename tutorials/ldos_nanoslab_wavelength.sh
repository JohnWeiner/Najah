#!/bin/bash
# This is a bash script for running ldos_nanoslab.py...either mp or pmp version
#-----------------------------------------------------------------
#remove old  files
rm ldos_slab_*.out 
rm ldos_slab.dat
rm flux_slab.dat
rm wvl_slab.dat

for i in `seq 0 1 1`; do #wavelength increment index loop (in nm)
     python -u ldos_nanoslab_wavelength.py -res 100 -wvl_init 500 -dwvl 50 -w_init 0.050 -dw 0 -n $i | tee -a ldos_slab_${i}.out; #single-processor version
   # mpirun -np 4 python -u ldos_nanoslab_pmp.py -res 200  -wvl 0.500 -w_init 0.050 -dw 0.005 -n ${i} | tee -a ldos_slab_${i}.out; #parallel version
    
    grep ldos0: ldos_slab_${i}.out |cut -d, -f2- >> ldos_slab.dat;
    grep normalised ldos_slab_${i}.out | cut -d, -f2- >> flux_slab.dat;
    grep wavelength: ldos_slab_${i}.out | cut -d, -f2- >> wvl_slab.dat;
    printf "\n"
done
