#!/usr/bin/sh
CONTAINER=$1

# This file executes from host, runt the diffe

lxc exec $CONTAINER -- sh tests.sh