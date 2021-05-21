#!/bin/bash

read -p "¿Desea borrar la base de datos previa? [s/n]: " name
if [ $name = s ]
then
echo "BORRANDO LA ANTERIOR BASE DE DATOS DE PRUEBA"
yes Y |  sudo -u postgres psql -c "DROP DATABASE IF EXISTS tpcc;"
else
echo "NO SE BORRÓ LA BASE DE DATOS DE PRUEBA"
fi
echo "INICIO CONSTRUCCION ESQUEMA"
date
echo "Construyendo esquema, espere por favor..."
bash hammerdbcli auto esquemaPostgreSQL.tcl > log-pg.txt
echo "Esquema construido"
echo "FIN CONSTRUCCION ESQUEMA"
date
echo "Empezando prueba"
echo "INICIO EJECUCION PRUEBA"
date
echo "Ejecutando prueba, espere por favor..."
bash hammerdbcli auto pruebaPostgreSQL.tcl > ejecucion-pg.txt
echo "FIN EJECUCION PRUEBA"
date
echo "Fin prueba, consulte los resultados en ejecucion-pg.txt"