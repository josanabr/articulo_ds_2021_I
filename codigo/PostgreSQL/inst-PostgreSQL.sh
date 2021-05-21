#!/bin/bash

#Actualizar el sistema operativo
sudo apt-get update

#Instalar Postgresql
sudo apt install -y postgresql postgresql-contrib

#Configuración
sudo -u postgres psql -c "ALTER USER postgres WITH PASSWORD 'postgres';"