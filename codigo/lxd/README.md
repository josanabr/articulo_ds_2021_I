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

EL archivo *.sh que ejecuta todas las pruebas es `scripts/stress_ng.sh` este archivo se ejecuta en el contenedor lxd mediante

`lxc file push stress_ng.sh $CONTAINER/root/`  
`lxc exec $CONTAINER -- sh stress_ng.sh`  

Los resultados del test quedan guardados en /root/stress_test.log en el contenedor, y pueden consultarse extrayendo el archivo mediante

`lxc file pull $CONTAINER/root/stress_ng.log .`

## Vagrant

Se dispone un archivo vagrantfile que corre la imagen generic/ubuntu2010 para desplegar una maquina virtual
donde se aproviciona la instalación de lxc/lxd y se copian los archivos *.sh necesarios para ejecutar las
pruebas de stress-ng en el contenedor

Para modificar las pruebas es necesario editar el archivo scripts/stress_ng.sh