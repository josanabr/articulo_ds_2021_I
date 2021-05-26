#!/usr/bin/sh
TIMEOUT=10

# Run stress-ng benchmark
cd /root/ && sh ./StressNG/run_test.sh -t $TIMEOUT -l /root/StressNG/stress_ng.log

# Run NPB benchmark
NPBWD=/root/NPB/NPB3.4.1/NPB3.4-OMP/bin
cd $NPBWD && sh runtests.sh

# Run HammerDB benchmarks for PostgreSQL
cd /root/HammerDB && sh pruebaPostgreSQL-HDB.sh

# Run HammerDB benchmarks for MySQL
cd /root/HammerDB && sh pruebaMySQL-HDB.sh

