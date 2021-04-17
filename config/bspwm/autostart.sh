#!/bin/bash

function run {
  if ! pgrep $1 ;
  then
    $@&
  fi
}

#Find out your monitor name with xrandr or arandr (save and you get this line)
#xrandr --output VGA-1 --primary --mode 1360x768 --pos 0x0 --rotate normal
#xrandr --output DP2 --primary --mode 1920x1080 --rate 60.00 --output LVDS1 --off &
#xrandr --output LVDS1 --mode 1366x768 --output DP3 --mode 1920x1080 --right-of LVDS1
#xrandr --output HDMI2 --mode 1920x1080 --pos 1920x0 --rotate normal --output HDMI1 --primary --mode 1920x1080 --pos 0x0 --rotate normal --output VIRTUAL1 --off

xrandr \
  --output eDP --primary --mode 1920x1080 --pos 1920x0 --rotate normal \
  --output DisplayPort-0 --mode 1920x1200 --pos 0x0 --rotate normal

# $HOME/.config/polybar/launch.sh &
#xfsettingsd &
xfce4-panel &


xsetroot -cursor_name left_ptr &
sxhkd &

feh --bg-fill --randomize ~/Pictures/wallpapers/**

#conky -c $HOME/.config/bspwm/system-overview &
#run variety &
run nm-applet &
run nextcloud --background &
#run pamac-tray &
run xfce4-power-manager &
#numlockx on &
#blueberry-tray &
#compton --config $HOME/.config/bspwm/compton.conf &
#/usr/lib/polkit-gnome/polkit-gnome-authentication-agent-1 &
/usr/lib/xfce4/notifyd/xfce4-notifyd &
#nitrogen --restore &
#run caffeine &
#run vivaldi-stable &
#run firefox &
#run thunar &
#run dropbox &
#run insync start &
#run discord &
