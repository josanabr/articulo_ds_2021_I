#!/usr/bin/sh
TIMEOUT=10
stress-ng --cpu 4 --io 4 --hdd 1 --hdd-bytes 2M --vm 2 --vm-bytes 2M --dccp 2 --timeout $TIMEOUT --metrics --log-file ~/stress_ng_lxc.log