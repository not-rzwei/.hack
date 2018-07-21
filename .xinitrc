#! /bin/bash
export QT_QPA_PLATFORMTHEME=gtk2
export DESKTOP_SESSION=gnome
export _JAVA_AWT_WM_NONREPARENTING=1

xrdb -merge ~/.Xresources
autocutsel -fork &
autocutsel -selection PRIMARY -fork &

exec xmonad
