#!/usr/bin/sh
CONTAINER=$1

echo "Pull Stress-ng logs"
lxc file pull $CONTAINER/root/stress_ng_lxc.log logs/stress-ng.lxd.log

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