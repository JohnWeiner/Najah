
import matplotlib
from os import environ
if "DISPLAY"  not in environ:
    matplotlib.use('Agg')
import matplotlib.pyplot as plt
import numpy as np
from matplotlib.ticker import (MultipleLocator, FormatStrFormatter, AutoMinorLocator)

minorLocator=MultipleLocator(20)

wvl=np.genfromtxt('wvl_slab.dat', delimiter='\n')
flux=np.genfromtxt('flux_slab.dat', delimiter='\n')

plt.figure(figsize=(12,6), dpi=100)
plt.scatter(1000*wvl,flux,s=30, marker='o',color='blue', edgecolors="red", linewidths=0.5 )

ax=plt.gca()
ax.tick_params(axis='both', which='major', labelsize= 11) #alternative (and simpler) way to alter font size of tick labels.
ax.tick_params(axis='x', which='major', top=True, direction='in', length=14)
ax.tick_params(axis='x', which='minor', top=True, direction='in', length=7)
ax.xaxis.set_minor_locator(minorLocator)
ax.set_xlabel('wavelength(nm)',fontsize=14)
ax.set_ylabel('fractional flux', fontsize=14)
ax.set_title('Net Fractional Flux through Subwavelength Slit', fontsize=16)
ax.set_ylim([0.0,0.4])
plt.grid()
plt.savefig('slit_flux_vs_wvl')
plt.show()
