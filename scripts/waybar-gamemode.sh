#!/usr/bin/env bash
# Simple Waybar Toggle Script for Gaming
# Usage: waybar-gamemode.sh [hide|show|toggle]
# Handles both top and bottom waybar instances via systemd

WAYBAR_STATE_FILE="/tmp/waybar-state"

hide_waybar() {
    echo "Hiding both waybar instances..."
    # Stop both waybar services
    systemctl --user stop waybar.service 2>/dev/null
    systemctl --user stop waybar-bottom.service 2>/dev/null
    # Also kill any remaining waybar processes
    pkill waybar 2>/dev/null
    echo "hidden" > "$WAYBAR_STATE_FILE"
    echo "Waybar hidden"
}

show_waybar() {
    echo "Showing both waybar instances..."
    # Start both waybar services
    systemctl --user start waybar.service
    systemctl --user start waybar-bottom.service
    echo "visible" > "$WAYBAR_STATE_FILE"
    echo "Waybar visible"
}

toggle_waybar() {
    # Check if waybar services are active
    if systemctl --user is-active --quiet waybar.service && systemctl --user is-active --quiet waybar-bottom.service; then
        hide_waybar
    else
        show_waybar
    fi
}

case "${1:-toggle}" in
    hide)
        hide_waybar
        ;;
    show)
        show_waybar
        ;;
    toggle)
        toggle_waybar
        ;;
    *)
        echo "Usage: $0 [hide|show|toggle]"
        exit 1
        ;;
esac