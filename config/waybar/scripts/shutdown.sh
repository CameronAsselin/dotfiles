#!/bin/bash

answer=$(zenity --info --text="<span size=\"xx-large\">Do you want to <b>shutdown</b>?</span>" --title="Shutdown options" --ok-label="Cancel" --extra-button="Logout" --extra-button="Restart" --extra-button="Shutdown")

echo $answer

if [ $answer = "Logout" ]; then
  hyprctl dispatch exit
elif [ $answer = "Restart" ]; then
  reboot
elif [ $answer = "Shutdown" ]; then
  shutdown now
else
  exit 
fi
