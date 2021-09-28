#!/bin/sh

interval="./input_files/set_timer_interval.txt"
symbols="./input_files/set_stock_symbols.txt"

eval $@

while true; do clear; echo $(date "+%Y-%m-%d%n%H:%M:%S"); ./ticker.sh $(cat $symbols); sleep $(cat $interval); done

exit 0
