#!/bin/bash

warn=0

while true
do
    monitor="0"
    vol=0
    new=0

    monitor=$(pactl list sinks | awk -v sink="$(pactl info | grep 'Default Sink' | cut -d' ' -f3)" 'BEGIN { RS = "" } $0 ~ sink && $0 ~ /Headphones|Headset/ { print "1" }')
    monitor=${monitor:-0}

    if [ $monitor -eq "1" ]; then
        vol=$(wpctl get-volume @DEFAULT_AUDIO_SINK@ | awk '{print int($2 * 100)}')
        sleep 10
        new=$(wpctl get-volume @DEFAULT_AUDIO_SINK@ | awk '{print int($2 * 100)}')
    
        if [ $new -ge $vol ] && [ $vol -ge 75 ]; then
            if [ $warn -eq 0 ]; then
                notify-send "High volume warning!" "Listing to music/videos at this volume can cause permanent hearing damage!"
                warn=1
            elif [ $warn -eq 1 ]; then
                notify-send "High volume warning!" "Your volume is still too high! Turning it down..."
                pactl set-sink-volume @DEFAULT_SINK@ 50%
                warn=2
            elif [[ $warn -eq 2 ]]; then
                sleep 1780
                warn=0
            fi
        fi 
    fi
done
