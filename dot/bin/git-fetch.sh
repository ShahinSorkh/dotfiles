#!/usr/bin/env bash

lock_file () {
    l=${1##/}
    l=${l%%/.git}
    echo "$l" | sed 's!/!:!g'
}

LOCKDIR=/tmp/gitfetch.lock.d

if [ -d "$LOCKDIR" ]
then
    echo another process is running
    exit 0
fi

mkdir -p "$LOCKDIR"

REPOS=$(find "$HOME/code" -type d -name .git -print)

for r in $REPOS
do
    (
        cd "${r%%/.git}" || exit
        git fetch --all --prune
    ) >"$LOCKDIR/$(lock_file "$r")" &
done

wait

for r in $REPOS
do
    echo '---' "${r%%/.git}"
    cat "$LOCKDIR/$(lock_file "$r")"
done

rm -rf "$LOCKDIR"
