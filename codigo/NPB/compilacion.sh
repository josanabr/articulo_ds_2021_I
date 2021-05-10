#!/usr/bin/env bash
#
# Este script compila el  NPB (NAS Parallel Benchmark).
#
# Autor: John Sanabria - john.sanabria@correounivalle.edu.co
# Fecha: 2021-05-05
#
NPB_URL="https://www.nas.nasa.gov/assets/npb/NPB3.4.1.tar.gz"
FILENAME=$(basename ${NPB_URL})
tar xfz ${FILENAME}
# Ir a directorio recien creado a partir de la extraccion
CURRENT_DIR=$(pwd)
cd NPB3.4.1/NPB3.4-OMP
cp config/make.def.template config/make.def
make ep CLASS=C
make ft CLASS=C
make cg CLASS=C
cd ${CURRENT_DIR}
