#!/usr/bin/sh
while getopts ":t:l:" arg; do
  case $arg in
    t) TIMEOUT=$OPTARG;;
    l) LOGLOC=$OPTARG;;
    \?) echo "Invalid option -$OPTARG" >&2
  esac
done

for test in cpu io hdd vm dccp; do
  for workers in 1 2 4 8 16 32 64; do    
    echo "Running $test with $workers workers"
    LOGFILE=$LOGLOC/stressng.$test.$workers.log
    touch $LOGFILE
    RUN="stress-ng --$test $workers --timeout $TIMEOUT --metrics --log-file $LOGFILE"
    eval $RUN
    echo "Log file in: $LOGFILE"
  done
done