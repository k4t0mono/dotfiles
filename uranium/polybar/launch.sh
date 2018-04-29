#!/usr/bin/env sh

# Export the API KEYS
source ~/.config/polybar/.env

# Terminate already running bar instances
killall -q polybar

# Wait until the processes have been shut down
while pgrep -x polybar >/dev/null; do sleep 1; done

# Launch bar1 and bar2
polybar top &
polybar sec &


echo "Bars launched..."
