#!/usr/bin/zsh

if ( command -v nproc 2>&1 >/dev/null ); then
    echo $(nproc --all)
    exit 0
fi

echo $(grep -c ^processor /proc/cpuinfo)
