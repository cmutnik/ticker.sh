#!/bin/sh

symbols=$(cat "./stored_parameter_files/set_stock_symbols.txt")
interval=$(cat "./stored_parameter_files/set_timer_interval.txt")

eval $@

while true; do clear; echo $(date "+%Y-%m-%d%n%H:%M:%S"); ./scripts/ticker.sh `echo ${symbols}`; sleep `echo ${interval}`; done

exit 0
