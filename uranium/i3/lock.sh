#!/usr/bin/sh

maim /tmp/back.png
convert /tmp/back.png -scale 10% -scale 1000% /tmp/back.png
playerctl pause
pkill -u "$USER" -USR1 dunst
i3lock -n -i /tmp/back.png
pkill -u "$USER" -USR2 dunst

