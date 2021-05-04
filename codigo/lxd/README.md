# LXC/LXD

Esta carpeta contiene el paso a paso para ejecutar un ambiente de puebas de estrés en la herramienta de virtualización de contenedores LXC/LXD

Ejecutar sobre una versión del kernel de linux 5.10.19

## Configuración

- Instalar lxc: `sudo apt install lxc`
- Instalar lxd: `sudo snap install lxd`
- Inicializar lxd con: `lxd init` 
- Crear cualquier contenedor: `lxc launch imageserver:imagename instancename`
- Instanciar cualquier contenedor: `lxc start instancename`
[ver mas](https://linuxcontainers.org/lxd/getting-started-cli/)

## Ejecución

Después de configurar lxd, para ejecutar las pruebas en lxd se debe ejecutar el archivo `scripts/stress_lxd.sh` el cual realiza lo siguiente

- Crear contenedor de prueba: `lxc launch ubuntu:20.10 lxdtest`
- Instanciar contenedor de prueba: `lxc start lxdtest`
- Instalar stress-ng en el contenedor: `lxc exec lxdtest -- snap install stress-ng`

### Stress-ng

EL comando que ejecuta todas las pruebas es el siguiente para el contenedor $CONTAINER y el tiempo de ejecución $TIMEOUT

`lxc exec $CONTAINER -- stress-ng --cpu 4 --timeout $TIMEOUT --metrics --log-file /root/stress_test.log`

Los resultados del test quedan guardados en /root/stress_test.log en el contenedor, y pueden consultarse extrayendo el archivo mediante

`lxc file pull $CONTAINER/root/stress_ng.log .`