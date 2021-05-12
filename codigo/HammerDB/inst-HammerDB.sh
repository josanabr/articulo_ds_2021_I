#!/bin/bash

#Actualizar el sistema operativo
sudo apt-get update

#Instalación de paquete para descarga instalador HammerDB
sudo apt-get install -y curl

#Instalación librerias adicionales HammerDB
sudo  apt-get install -y libxft2 libxft2:amd64 lib32ncurses5

sudo apt-get install -y libxft2

sudo apt-get install -y libxft2:amd64

#Descarga del instalador HammerDB desde el repositorio GitHub oficial
wget --no-check-certificate --content-disposition https://github.com/TPC-Council/HammerDB/releases/download/v4.1/HammerDB-4.1-Linux.tar.gz

#Descompresión de archivo instalador HammerDB
tar -zxvf HammerDB-4.1-Linux.tar.gz

#Borrar el archivo comprimido del instalador HammerDB
rm -rf HammerDB-4.1-Linux.tar.gz

#Instalación paquete adicional para métricas de CPU
sudo apt install sysstat -y

#Habilitación paquete adicional métricas
sudo bash -c 'echo "ENABLED="true"" >> /etc/default/sysstat'

#Inicio servicio métricas
sudo systemctl enable sysstat

sudo systemctl start sysstat


