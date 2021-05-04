#!/usr/bin/sh
CONTAINER=lxdtest
TIMEOUT=10

lxc launch ubuntu:20.10 $CONTAINER
lxc start $CONTAINER
lxc exec lxdtest -- snap install stress-ng
lxc exec $CONTAINER -- stress-ng --cpu 4 --io 4 --hdd 1 --hdd-bytes 2M --vm 2 --vm-bytes 2M --dccp 2 --timeout $TIMEOUT --metrics --log-file /root/stress_ng_lxc.log
lxc file pull $CONTAINER/root/stress_ng_lxc.log .