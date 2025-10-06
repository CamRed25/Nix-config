#!/usr/bin/env bash
# Simple waybar toggle script

if pgrep waybar >/dev/null; then
    # Waybar is running - hide it
    pkill waybar
    echo "Waybar hidden"
else
    # Waybar is not running - show it
    waybar &
    echo "Waybar shown"
fi