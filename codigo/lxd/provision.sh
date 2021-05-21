#!/usr/bin/sh
CONTAINER=$1

# Create lxc/lxd container in host
if [ $(lxc list | grep "$CONTAINER" > /dev/null; echo $?) != 0 ]
then
    lxc launch ubuntu:20.10 $CONTAINER    
    echo "Wait for container to finish starting up"
    lxc exec $CONTAINER -- cloud-init status -w
fi

echo "Install stress-ng"
lxc exec $CONTAINER -- snap install stress-ng
echo "push .sh files to container and run tests"
sh push_files.sh $CONTAINER

echo "Install NPB Benchmark tool"
lxc exec $CONTAINER -- bash -c "cd /root/NPB/ && sh script_instalacion.sh"

echo "Install MySQL"
lxc exec $CONTAINER -- bash -c "cd /root/MySQL/ && sh inst-MySQL.sh"

echo "Install PostgreSQL"
lxc exec $CONTAINER -- bash -c "cd /root/PostgreSQL/ && sh inst-PostgreSQL.sh"

echo "Install HammerDB"
# TODO: wait for script fixes
#lxc exec $CONTAINER -- bash -c "cd /root/HammerDB/ && sh inst-HammerDB.sh"

echo "Redo from zero with make clean"