#!/usr/bin/env bash
#
# Este script invoca los diversos pasos (scripts) que generalmente se deben 
# ejecutar para llevar a cabo el proceso de instalacion de un paquete.
#
# Autor: John Sanabria - john.sanabria@correounivalle.edu.co
# Fecha: 2021-05-05
#
if [ "${0}" == "./script_borrado.sh" ]; then
  ./borrar.sh && exit 0
fi
if [ "$1" == "" ]; then
  echo "Indicar el directorio donde se encuentran los scripts para la instalacion del paquete"
  exit 1
fi
CURRENT_DIR=$(pwd)
#cd ${1} || echo "Directorio no encontrado" && exit 1
./prerrequisitos.sh
./compilacion.sh
./instalacion.sh
cd ${CURRENT_DIR}
