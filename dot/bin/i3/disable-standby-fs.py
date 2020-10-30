#!/usr/bin/env python3

from argparse import ArgumentParser
from subprocess import call
import i3ipc

i3con = i3ipc.Connection()

parser = ArgumentParser(prog='disable-standby-fs',
                        description='''
        Disable standby (dpms) and screensaver when a window becomes fullscreen
        or exits fullscreen-mode. Requires `xorg-xset`.
        ''')

args = parser.parse_args()


def is_fullscreen(tree):
    return any(con.find_fullscreen() for con in tree.descendants())


def set_dpms(state):
    if state:
        print('setting dpms on')
        call(['xset', 's', 'on'])
        call(['xset', '+dpms'])
    else:
        print('setting dpms off')
        call(['xset', 's', 'off'])
        call(['xset', '-dpms'])


def on_fullscreen_mode(i3, _):
    set_dpms(not is_fullscreen(i3.get_tree()))


def on_window_close(i3, _):
    if not is_fullscreen(i3.get_tree()):
        set_dpms(True)


i3con.on('window::fullscreen_mode', on_fullscreen_mode)
i3con.on('window::close', on_window_close)

i3con.main()

