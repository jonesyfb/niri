#!/bin/sh
# ~/.local/bin/set-random-wallpaper.sh

# Wait for awww daemon to be ready
#for i in $(seq 1 2); do
#    awww img /dev/null 2>/dev/null && break
#    echo "Seeing if awww is working"
#    sleep 0.2
#done

awww img $(find ~/Pictures/Wallpapers -type f | shuf -n 1) --transition-type fade --transition-duration 0.05
echo "Set background"
