#!/bin/sh
set -e

if ! ( pgrep -x emacs ); then
    emacs --daemon
fi

emacsclient -c
