#!/usr/bin/env python3
#
# Este script permite la generacion de las graficas de los resultados
# de ejecucion de las pruebas del benchmark NPB (NASA Parallel Benchmark)
#
# Autor: John Sanabria - john.sanabria@correounivalle.edu.co
# Fecha: 2021-05-11
#
import  numpy as np
import matplotlib.pyplot as plt

#
# Se haran corrales para 1, 2, 4, 8 y 64
#
# En este caso para la aplicacion 'ep'
#
N = 5
bare_metal = (70.4, 35.7, 17.84, 9.18, 6.78)
docker = (118.38, 59.7, 31.94, 16.66, 16.86)
lxd = (214.3, 108.93, 56.29, 29.46, 30.5)
coreos = (1, 1, 1, 1, 1)

ind = np.arange(N) 
width = 0.15       
plt.bar(ind - width, bare_metal, width, label='Embarrasingly Parallel')
plt.bar(ind, docker, width, label='Fourier Transform')
plt.bar(ind + width, lxd, width, label='Conjugate Gradient')
plt.bar(ind + 2*width, coreos, width, label='XXX')

plt.ylabel('Time (s)')
#plt.title('Observed times for Embarrasingly Parallel benchmark')
plt.title('Observed times for Bare Metal executions')

plt.xticks(ind + width / 2, ('1', '2', '4', '8', '64'))
plt.legend(loc='best')
plt.savefig('/vagrant/demo.png')
