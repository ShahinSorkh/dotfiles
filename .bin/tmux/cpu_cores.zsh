#!/usr/bin/zsh

echo $(grep -c ^processor /proc/cpuinfo)
