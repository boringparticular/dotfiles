#!/bin/sh

# . /etc/X11/xinit/xinitrc
# . /etc/X11/xinit/xinitrc-common

# Make sure this is before the 'exec' command or it won't be sourced.
# [ -f /etc/xprofile ] && . /etc/xprofile
# [ -f ~/.xprofile ] && . ~/.xprofile

export GTK_IM_MODULE=fcitx
export QT_IM_MODULE=fcitx
export XMODIFIERS=@im=fcitx

export editor=vim

export fmod_alsa_device=pulse

dbus-update-activation-environment --systemd display

xrdb -merge $home/.xresources

xsetroot -cursor_name left_ptr

xset -dpms s off

setxkbmap -layout us -variant altgr-intl

xss-lock -n /usr/lib/xsecurelock/dimmer -l -- xsecurelock &

fcitx5 &

if [ -x /usr/bin/nm-applet ] ; then
    nm-applet --sm-disable &
fi

kdwallet5 &
export ssh_auth_sock

redshift -l 50.73438:7.09549 &
flameshot &
volumeicon &
clipcatd &
sxhkd &
nextcloud &

exec awesome
