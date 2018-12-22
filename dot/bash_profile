# Startup file for bash login shells.
#

if [ -n "$PS1" ]; then
	PS1='${debian_chroot:+($debian_chroot)}\[\033[01;32m\]\u@\h\[\033[00m\] \[\033[01;34m\]\w \$\[\033[00m\] '
	IGNOREEOF=1
fi

LOGIN_SHELL=true

# If the user has her own init file, then use that one, else use the
# canonical one.
if [ -f ~/.bashrc ]; then
	. ~/.bashrc
fi
export GPG_TTY=$(tty)
