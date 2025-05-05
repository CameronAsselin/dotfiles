#!/bin/bash

answer=$(zenity --info --text="<span size=\"xx-large\">Do you want to <b>shutdown</b>?</span>" --title="Shutdown options" --ok-label="Cancel" --extra-button="Logout" --extra-button="Restart" --extra-button="Shutdown")

echo $answer

if [ $answer = "Logout" ]; then
  sure=$(zenity --info --text="<span size=\"xx-large\">Are you <b>sure</b>?</span>" --title="Logout" --ok-label="No" --extra-button="Yes")
  if [ $sure =  "Yes" ]; then
    hyprctl dispatch exit
  else
    exit
  fi
elif [ $answer = "Restart" ]; then
  sure=$(zenity --info --text="<span size=\"xx-large\">Are you <b>sure</b>?</span>" --title="Restart" --ok-label="No" --extra-button="Yes")
  if [ $sure =  "Yes" ]; then
    reboot
  else
    exit
  fi
elif [ $answer = "Shutdown" ]; then
  sure=$(zenity --info --text="<span size=\"xx-large\">Are you <b>sure</b>?</span>" --title="Shutdown" --ok-label="No" --extra-button="Yes")
  if [ $sure =  "Yes" ]; then
    shutdown now
  else
    exit
  fi
else
  exit 
fi
