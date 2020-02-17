#!/bin/bash

xset s noblank
xset s off
xset -dpms

unclutter -idle 0.5 -root &

sed -i 's/"exited_cleanly":false/"exited_cleanly":true/' /home/pi/.config/chromium/Default/Preferences
sed -i 's/"exit_type":"Crashed"/"exit_type":"Normal"/' /home/pi/.config/chromium/Default/Preferences
sleep 60 

/usr/bin/chromium-browser --noerrdialogs --disable-infobars --kiosk https://bit.ly/csee-foyer &

while true; do
  xdotool keydown ctrl+r; xdotool keyup ctrl+r;
  sleep 60
done