#!/usr/bin/sh
CONTAINER=lxdtest

if [ $(lxc list | grep "lxdtest" > /dev/null; echo $?) != 0 ]
then
    lxc launch ubuntu:20.10 $CONTAINER
    lxc start $CONTAINER
fi

lxc exec $CONTAINER -- snap install stress-ng
lxc file push stress_ng.sh $CONTAINER/root/
lxc exec $CONTAINER -- sh stress_ng.sh
lxc file pull $CONTAINER/root/stress_ng_lxc.log .