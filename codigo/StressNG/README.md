# StressNG Benchmark Scripts

# Configuración

Para instalar la herramienta ejecutar el script `install.sh` ó ejecutar `make install`

# Tests

Para ejecutar las pruebas correr el script `run_test.sh` con 
- `-t` para indicar el tiempo de ejecución de las pruebas, se recomienda usar 60m para un total de 35h
- `-l` para indicar la carpeta donde se guardarán los logs. se recomienda que sea la misma ubicación del script. ejemplo:

`sh /home/vagrant/StressNG/run_test.sh -t 60m -l /home/vagrant/StressNG`

En la carpeta se guardarian diferentes archivos con la siguiente estructura en el nombre: `stressng.$test.$worker.log` donde `$test` puede tomar valores [cpu, io, hdd, vm, dccp] y `$worker` puede tomar valores [1, 2, 4, 8, 16, 32, 64]

# Makefile

Se dispone un archivo Makefile para ejecutar las pruebas con `make` con 60m por defecto de tiempo y la ubicación de los logs en la carpeta `logs/` junto al archivo Makefile