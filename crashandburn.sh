#!/bin/bash

# copy to /usr/bin/crashandburn.sh
# chmod +x /usr/bin/crashandburn.sh

blink() {
    for i in $(seq 1 1 $1 ) ; do
        echo 200 > /sys/class/leds/white/brightness
        sleep 0.2
        echo 0 > /sys/class/leds/white/brightness
        sleep 0.2
    done
    sleep 1
}


breathe() {
    for i in $(seq 0 20 100) ; do
        echo $i > /sys/class/leds/white/brightness ;
        sleep 0.1 ;
    done
    for i in $(seq 100 -20 0) ; do
        echo $i > /sys/class/leds/white/brightness ;
        sleep 0.1 ;
    done
}

breathe
echo "Crash and burn - will force kernel panic in 60 seconds" | tee /dev/kmsg
sleep 60
breathe
sync
blink 7
echo "Crash and burn - forcing kernel panic" | tee /dev/kmsg
sleep 2

echo 1 > /proc/sys/kernel/sysrq
echo c > /proc/sysrq-trigger


