#!/usr/bin/sh
CONTAINER=$1

echo "Push files to $CONTAINER"

echo "Push stress-ng script"
lxc file push tests.sh $CONTAINER/root/

echo "Push NPB/StressNG/HammerDB/MySQL/PostgreSQL benchmark files"
lxc file push -r ../NPB/ $CONTAINER/root/
lxc file push -r ../StressNG/ $CONTAINER/root/
lxc file push -r ../HammerDB/ $CONTAINER/root/
lxc file push -r ../MySQL/ $CONTAINER/root/
lxc file push -r ../PostgreSQL/ $CONTAINER/root/

echo "CHMOD permission to .sh files"
lxc exec $CONTAINER -- bash -c "chmod 777 /root/NPB/*.sh"
lxc exec $CONTAINER -- bash -c "chmod 777 /root/StressNG/*.sh"
lxc exec $CONTAINER -- bash -c "chmod 777 /root/HammerDB/*.sh"
lxc exec $CONTAINER -- bash -c "chmod 777 /root/MySQL/*.sh"
lxc exec $CONTAINER -- bash -c "chmod 777 /root/PostgreSQL/*.sh"