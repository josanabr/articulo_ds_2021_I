#!/usr/bin/env bash
#
# Este script instala un script para la ejecucion de aplicaciones de NPB
#
# Autor: John Sanabria - john.sanabria@correounivalle.edu.co
# Fecha: 2021-05-05
#
RUNTESTS="$(pwd)/NPB3.4.1/NPB3.4-OMP/bin/runtests.sh"
cat <<EOF > ${RUNTESTS}
for j in cg ep ft; do
  for i in 1 2 4 8 16 32 64; do
    export OMP_NUM_THREADS=\${i}
    BINARIO="./\${j}.C.x > resultado.\${j}.\${i}.C.x.txt"
    echo -n "Corriendo '\${BINARIO}' "
    eval \${BINARIO}
    echo "hecho!"
  done
done
EOF
chmod +x ${RUNTESTS}
echo "Archivo de pruebas en ${RUNTESTS}"
