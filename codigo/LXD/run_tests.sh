CONTAINER = $1

# This file executes from host, runt the diffe

lxc exec $CONTAINER -- sh tests.sh

# Pull Stress-ng logs
lxc file pull $CONTAINER/root/stress_ng_lxc.log .

# TODO: Pull NPB logs
# TODO: Pull HammerDB logs
