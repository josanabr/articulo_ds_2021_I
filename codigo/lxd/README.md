# LXC/LXD

Esta carpeta contiene el paso a paso para ejecutar un ambiente de puebas de estrés en la herramienta de virtualización de contenedores LXC/LXD

## Todo

- Realizar script para desplegar un contenedor de LXC/LXD
- Como ejecutar un script con las pruebas en el contenedor
- Obtener resultados

## Setup

Instalar LXC/LXD con:

- `sudo apt install lxc`
- `sudo snap install lxd`

Configurar servidor LXD con

- `lxd init` 

Desplegar contenedor

- `lxc launch ubuntu:20.10 lxc_test`
- `lxc exec pgcont -- /bin/bash` para conectar al servidor

[ver mas](https://linuxcontainers.org/lxd/getting-started-cli/)

## Deploy Tests


