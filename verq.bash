#!/usr/bin/env bash

# Terminate already running bar instances
killall -q polybar
# If all your bars have ipc enabled, you can also use 
# polybar-msg cmd quit

# Launch bar1 and bar2
if type "xrandr"; then
  for m in $(xrandr --listactivemonitors | awk '{ print$4 }' | grep .); do
    MONITOR=$m polybar --reload example &
  done
else
  polybar --reload main_bar &
fi
echo "Bars launched..."
