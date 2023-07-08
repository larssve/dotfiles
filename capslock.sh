#!/usr/bin/env bash
#setxkbmap -option caps:super

dconf write /org/gnome/desktop/input-sources/xkb-options "['caps:super']"
