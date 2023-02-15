#!/bin/sh

. /etc/X11/xinit/xinitr
# source /etc/X11/xinit/xinitrc

# Make sure this is before the 'exec' command or it won't be sourced.
[ -f /etc/xprofile ] && . /etc/xprofile
[ -f ~/.xprofile ] && . ~/.xprofile

. ~/.xsharedrc
