#!/usr/bin/env bash

# Terminate already running bar instances
killall -q polybar
# If all your bars have ipc enabled, you can also use
# polybar-msg cmd quit

# Launch bar1 on all monitors
echo "---" | tee -a /tmp/polybar1.log
#polybar bar1 >>/tmp/polybar1.log 2>&1 & disown

## Undust this code if I ever go back to not having top monitors!
#if type "xrandr"; then
#  for m in $(xrandr --query | grep " connected" | cut -d" " -f1); do
#    MONITOR=$m polybar --reload primary >>/tmp/polybar1.log 2>&1 & disown
#  done
#else
#  polybar --reload primary >>/tmp/polybar1.log 2>&1 & disown
#fi

if type "xrandr"; then
  for m in $(xrandr --query | grep " connected" | cut -d" " -f1); do
    if [ "$m" == "DP-2" ]; then
      MONITOR=$m polybar --reload primary >>/tmp/polybar1.log 2>&1 & disown
    elif [ "$m" == "HDMI-0" ] || [ "$m" == "DP-0" ]; then
      MONITOR=$m polybar --reload secondary >>/tmp/polybar1.log 2>&1 & disown
    fi
  done
else
  polybar --reload primary >>/tmp/polybar1.log 2>&1 & disown
fi

echo "Bars launched..."
