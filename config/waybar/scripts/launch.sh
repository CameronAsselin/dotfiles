#!/bin/bash

# Terminate already running bar instances
killall -q waybar

# Launch waybar
waybar

echo "Waybar launched..."
