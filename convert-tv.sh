#!/bin/bash
rawout=$(HandBrakeCLI -i *.iso -t 0 --min-duration 0 2>&1 >/dev/null)
#rawout=$(HandBrakeCLI -i /dev/dvd -t 0 2>&1 >/dev/null)
#read handbrake's stderr into variable

count=$(echo $rawout | grep -Eao "\\+ title [0-9]+:" | wc -l)
#parse the variable using grep to get the count

for i in $(seq $count)
do
    # HandBrakeCLI --input /dev/dvd --title $i --preset Normal --min-duration 0 --output $i.mp4
    HandBrakeCLI --input *.iso --title $i --preset Normal --min-duration 0 --output $i.mp4
done
