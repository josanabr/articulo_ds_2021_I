#!/usr/bin/sh
CONTAINER=$1

mkdir -p ./logs/

echo "Pull Stress-ng logs"
for test in cpu io hdd vm dccp; do
  for workers in 1 2 4 8 16 32 64; do
    lxc file pull $CONTAINER/root/StressNG/stressng.$test.$workers.log logs/stressng.$test.$workers.lxd.log
  done
done

echo "Pull NPB logs"
for j in cg ep ft; do
  for i in 1 2 4 8 16 32 64; do
    lxc file pull $CONTAINER/root/NPB/NPB3.4.1/NPB3.4-OMP/bin/resultado.$j.$i.C.x.txt logs/npb.$j.$i.C.x.lxd.log
  done
done

echo "Pull HammerDB logs"
lxc file pull $CONTAINER/root/HammerDB/log.txt logs/mysql-schema.lxd.log
lxc file pull $CONTAINER/root/HammerDB/ejecucion.txt logs/mysql-exec.lxd.log
lxc file pull $CONTAINER/root/HammerDB/log-pg.txt logs/postgresql-schema.lxd.log
lxc file pull $CONTAINER/root/HammerDB/ejecucion-pg.txt logs/postgresql-exec.lxd.log

echo "Done"