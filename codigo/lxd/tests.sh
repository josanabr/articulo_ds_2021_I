#!/usr/bin/sh
TIMEOUT=10

# Run stress-ng benchmark
stress-ng --cpu 4 --io 4 --hdd 1 --hdd-bytes 2M --vm 2 --vm-bytes 2M --dccp 2 --timeout $TIMEOUT --metrics --log-file /root/stress_ng_lxc.log

# Run NPB benchmark
NPBWD=/root/NPB/NPB3.4.1/NPB3.4-OMP/bin
chmod 777 $NPB/runtests.sh
cd $NPBWD && sh runtests.sh

# Run HammerDB benchmarks
# TODO: wait for script fixes
# cd /root/HammerDB && sh pruebaPostgreSQL-HDB.sh
