urxvtd -o -q -f
xrdb -merge ~/.config/X11/.Xresources

xset s 2700
xset -dpms

udiskie &

exec i3

