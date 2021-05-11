#!/usr/bin/env bash
#
# Este script tiene como proposito sacar los tiempos de ejecucion que se 
# obtuvieron durante las ejecuciones de las aplicaciones bajo estudio: 
#
# - cg
# - ep
# - ft
#
# Cada aplicacion se ejecuto con diferentes numeros de hilos: 1, 2, 4,..., 64.
#
# Un archivo llamado <app>.<num_hilos>.valores.txt contendra cinco valores, 
# uno en cada linea, que responde a un tiempo de ejecucion en particular.
#
# Autor: John Sanabria - john.sanabria@correounivalle.edu.co
# Fecha: 2021-05-11
#

array_apps=(cg ep ft)
array_nhilos=( 1 2 4 8 16 32 64 )
array_dirs=( 1 2 3 4 5 )
resultados_dir="NPB-resultados"
target_dir="resultados"

target_file() {
  echo "${1}.${2}.valores.txt"
}

#
# Este metodo se encarga de inicializar los archivos donde residiran los
# resultados de las salidas de ejecucion de las aplicaciones bajo 
# observacion.
#
ini_archivos() {
  for i in "${array_apps[@]}"; do
    for j in "${array_nhilos[@]}"; do
      > ${target_dir}/${i}.${j}.valores.txt
    done
  done
}

#
# Este metodo toma la salida de ejecucion de uno de los aplicativos de
# NPB. Recibe cuatro argumentos:
# 1er- Una cadena patron a buscar. Se extrae la primera aparicion de dicha
# cadena.
# 2do- El campo por el cual se quiere delimitar la linea que tiene el 
# patron indicado en el primer argumento.
# 3ro- El campo particular que se desea extraer.
# 4to- El nombre del archivo que se quiere procesar.
#
# Con estos cuatro argumentos, y para este caso, es suficiente para 
# extraer el valor que se desea.
#
sacar_tiempo() {
  search_pattern="${1}"
  field_delim="${2}"
  field="${3}"
  filename="${4}"
  comando="grep ${search_pattern} ${filename} | head -1 | cut -d '${field_delim}' -f ${field}"
  valor=$(eval "${comando}")
  echo ${valor}
}

#
# Inicio
#

ini_archivos # inicializacion de archivos de resultados consolidados

for i in "${array_apps[@]}"; do
  for j in "${array_nhilos[@]}"; do
    filename=$(target_file ${i} ${j})
    for k in "${array_dirs[@]}"; do
      valor=$(sacar_tiempo "Time" = 2 "${resultados_dir}/${k}/resultado.${i}.${j}.C.x.txt")
      echo ${valor} >> ${target_dir}/${filename}
    done
    # Se calcula el valor promedio a partir de valores observados 
    valor=$(./average.py ${target_dir}/${filename})
    # Se pone al final el promedio de los valores observados
    echo ${valor} >> ${target_dir}/${filename}
  done
done
