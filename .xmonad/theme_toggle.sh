#!/bin/sh

# theme_toggle.sh
# Original author: Hiradur
# License: CC0
# Description: Toggle between two themes for various applications
# designed for the Solarized themes by Ethan Schoonover

# This script toggles between a light and a dark theme for various applications
# by replacing the corresponding option(s) in their config files
# You need to have the Solarized Light/Dark theme installed for these applications

# Currently supported applications:
# background image, urxvt, zathura, vimperator (FF addon), GTK2/3-apps

# Tip: For a complete solarized experience you can use the Stylish addon for
# Firefox with Solarized dark/light Everywhere theme. It's not toggled here
# because it breaks the layout of a few websites.

# check which theme is active first
grep -q '#include ".Xresources.d/solarized-light"' ~/.Xresources
if [ $? -eq 0 ]; then
    # light theme active, switch to dark theme

    # background
    xsetroot -solid "#002b36"
    # urxvt
    sed -i 's|#include ".Xresources.d/solarized-light"|#include ".Xresources.d/solarized-dark"|' ~/.Xresources
    # GTK
    sed -i 's|gtk-theme-name="Arc"|gtk-theme-name="Arc-Dark"|' ~/.gtkrc-2.0
    sed -i 's|gtk-theme-name=Arc|gtk-theme-name=Arc-Dark|' ~/.config/gtk-3.0/settings.ini
		gsettings set org.gnome.desktop.interface gtk-theme Arc-Dark
#		term_dark
		touch ~/.config/darkmode
		rm ~/.config/i3/config
		ln -s ~/.config/i3/config-dark ~/.config/i3/config
else
    # switch to light theme
    xsetroot -solid "#fdf6e3"
    # urxvt
    sed -i 's|#include ".Xresources.d/solarized-dark"|#include ".Xresources.d/solarized-light"|' ~/.Xresources
    # GTK
    sed -i 's|gtk-theme-name="Arc-Dark"|gtk-theme-name="Arc"|' ~/.gtkrc-2.0
    sed -i 's|gtk-theme-name=Arc-Dark|gtk-theme-name=Arc|' ~/.config/gtk-3.0/settings.ini
		gsettings set org.gnome.desktop.interface gtk-theme Arc
#		term_light
		rm  ~/.config/darkmode
		rm ~/.config/i3/config
		ln -s ~/.config/i3/config-light ~/.config/i3/config
fi
xrdb ~/.Xresources
python ~/.config/i3/gtk-reload.py
for i in `xdotool search --class st`
do
	xdotool key --clearmodifiers --window $i Alt+Tab
done
xmonad --restart
