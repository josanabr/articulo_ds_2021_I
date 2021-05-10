# NPB - NAS Parallel Benchmark

Este directorio contiene los scripts que permiten llevar a cabo el despliegue, compilación y ejecución de algunos *kernels* del paquete de benchmarks NPB. 
La descripción de NPB se puede acceder [aquí](https://www.nas.nasa.gov/publications/npb.html).

## Instalación del software

Para llevar a cabo la instalación del software se deben descargar los scripts en este directorio y ubicarlos en el directorio de su preferencia.
Ubicado en su directorio de preferencia, ejecute el siguiente comando:

```
./script_instalacion.sh $(pwd)
```

Al final del proceso, en el directorio `$(pwd)/NPB/NPB3.4.1/NPB3.4-OMP/bin/` se encontrarán los archivos: `cg.C.x`, `ep.C.x`, `ft.C.x` y `runtests.sh`.

Para llevar a cabo la ejecución de los tests, se ejecuta el script `runtests.sh` localizado en el directorio `$(pwd)/NPB/NPB3.4.1/NPB3.4-OMP/bin/` de la siguiente manera:

```
./runtests.sh
```

Este script ejecuta alrededor de 21 ejecuciones donde diferentes aplicaciones se ponen a prueba.
Las aplicaciones(*app*) que se ejecutan son:

* **EP** *Embarransingly Parallel*. Es una aplicación que puede ejecutarse arbirtrariamente en paralelo. Mide CPU.

* **CG** *Conjugate Gradient*. Esta aplicación tiene un acceso irregular a memoria.

* **FT** *Discrete 3D fast Fourier Transform*. 

Cada aplicación se ejecuta con diferentes números de hilos(*num_hilos*): 1, 2, 4, 8, 16, 32 y 64. 
Son tres aplicaciones y cada aplicación con 7 configuraciones de hilos.
La salida de cada ejecución queda en un archivo `.txt` que tiene el siguiente nombre `resultado.<app>.<num_hilos>.C.x.txt`. 
