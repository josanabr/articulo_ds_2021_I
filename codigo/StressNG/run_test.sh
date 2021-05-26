#!/usr/bin/sh
while getopts ":t:l:" arg; do
  case $arg in
    t) TIMEOUT=$OPTARG;;
    l) LOGFILE=$OPTARG;;
    \?) echo "Invalid option -$OPTARG" >&2
  esac
done

stress-ng --cpu 4 --io 4 --hdd 1 --hdd-bytes 2M --vm 2 --vm-bytes 2M --dccp 2 --timeout $TIMEOUT --metrics --log-file $LOGFILE

echo "Modify line.10 to change stress-ng cpu/io/hdd/vm/dccp worker amount"