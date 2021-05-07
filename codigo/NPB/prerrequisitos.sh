#!/usr/bin/env bash
#
# Este script instala los prerrequisitos para el NPB (NAS Parallel Benchmark).
# En este caso particular 
#
# Autor: John Sanabria - john.sanabria@correounivalle.edu.co
# Fecha: 2021-05-05
#
sudo apt install -y build-essential gfortran
NPB_URL="https://www.nas.nasa.gov/assets/npb/NPB3.4.1.tar.gz"
# Descargar archivo
wget ${NPB_URL} || exit 1
