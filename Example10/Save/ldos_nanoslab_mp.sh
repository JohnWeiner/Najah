#!/bin/bash
# This is a bash script for running ldos_nanoslab.py...either mp or pmp version
#-----------------------------------------------------------------
    echo `date`" >>>>>>>>>>>>>>>>>>>>> Starting run: $i"
    source activate meep
    python -u ldos_nanoslab_pmp.py -res 200  -wvl 0.500 -w_init 0.050 -dw 0.005 -n $1 | tee -a ldos_slab_${i}.out;
    echo `date`" >>>>>>>>>>>>>>>>>>>>> Ending run: $i"

done
