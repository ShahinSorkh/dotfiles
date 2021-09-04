#!/bin/sh

set -e

pkill -x emacs || echo 'emacs not running'
emacs --daemon
emacsclient -c

