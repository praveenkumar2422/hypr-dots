#!/bin/bash

toggle() {
    if [ -e /tmp/SLEEP_HYPR ]; then
        rm /tmp/SLEEP_HYPR
        notify-send "Power Management" "Caffine is disabled."
    else 
        touch /tmp/SLEEP_HYPR 
        notify-send "Power Management" "Caffine is enabled."
    fi
}

ask() {
    if [ -e /tmp/SLEEP_HYPR ]; then
        choice=$(notify-send "Power Management" "Caffine is activated" -A "Deactivate")
        status="active"
    else 
        choice=$(notify-send "Power Management" "Caffine is deactivated" -A "Activate")
        status="deactive"
    fi 

    if [[ "$status" = "active" && "$choice" = 0 ]]; then
        rm /tmp/SLEEP_HYPR
    elif [[ "$status" = "deactive" && "$choice" = 0 ]]; then
        touch /tmp/SLEEP_HYPR
    fi
}

if [ -z "$1" ]; then
    toggle 
elif [ "$1" = "-a" ]; then
    ask 
else 
    ask
fi
