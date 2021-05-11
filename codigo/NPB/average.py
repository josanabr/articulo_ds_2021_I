#!/usr/bin/env python3
# Este script lee las lineas de un archivo. Cada linea se asume es un valor real
# Las cantidades se suman y se imprime el promedio
import sys
if len(sys.argv) != 2: 
  print("Se requiere un nombre de archivo como argumento")
  sys.exit(1)
filename=sys.argv[1]
f = open(filename, "r")
acum=0
i=0
for x in f:
  i = i + 1
  try:
    acum = acum + float(x)
  except ValueError as ve:
    print("erorr en archivo %s"%filename)
    sys.exit(1)
acum = "{:.2f}".format(acum/float(i))
print(acum)
