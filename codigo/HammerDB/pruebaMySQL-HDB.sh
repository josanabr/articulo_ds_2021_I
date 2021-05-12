#!/bin/bash

read -p "¿Desea borrar la base de datos previa? [s/n]: " name
if [ $name = s ]
then
echo "BORRANDO BASE DE DATOS PRUEBA ANTERIOR"
yes Y |  mysqladmin -h localhost -u root -pmysql drop tpcc 2> /tmp/error.txt 1> /tmp/output.txt
fi
if [ $name = n ]
then
echo "NO BORRADO BASE DE DATOS PRUEBA ANTERIOR"
fi
echo "INICIO CONSTRUCCION ESQUEMA"
date
echo "Construyendo esquema, espere por favor..."
#mkdir ../HammerDB_MySQL
bash hammerdbcli auto esquemaMySQL.tcl > log.txt
echo "Esquema construido"
echo "FIN CONSTRUCCION ESQUEMA"
date
echo "Empezando prueba"
echo "INICIO EJECUCION PRUEBA"
date
echo "Ejecutando prueba, espere por favor..."
bash hammerdbcli auto pruebaMySQL.tcl > ejecucion.txt
echo "FIN EJECUCION PRUEBA"
date
echo "Fin prueba, consulte los resultados en ejecucion.txt"

