#!/usr/bin/zsh

CMD="$0"
usage () {
    echo "USAGE: $CMD [-h | --help] [-n | --dry] [-d | --dots] [-b | --bins] [-u | --uninstall] [-f | --force]"
    echo
    echo "\tAt least one of -d or -b options are required"
    echo
    echo "\t-h|--help:        Shows this help message"
    echo "\t-n|--dry:         Doesn't do anything just shows you what commands would be executed"
    echo "\t-d|--dots:        Links all of $(dirname $CMD)/dot/* to your home dir [$HOME]"
    echo "\t-b|--bins:        Links all of $(dirname $CMD)/dot/bin/* into your local bin dir [$HOME/.local/bin]"
    echo "\t-u|--uninstall:   Unlinks/removes whatever was supposed to be linked using this script"
    echo "\t-f|--force:       Removes any non-link file which is in conflict with the execution of the script"
    exit ${1:-1}
}

exe () {
    if [ -n "$DRY_RUN" ]; then
        echo $'\e[38;5;160m''>> '$'\e[00m'"$*"
    else
        echo $'\e[38;5;160m''> '$'\e[00m'"$*"
        ( exec $* )
    fi
}

remove_if_exists () {
    if [ -e "$1" ]; then
        if [ -L "$1" ]; then
            exe unlink "$1";
        else
            if [ -n "$FORCE_DELETE" ]; then
                exe rm -rf "$1"
            else
                echo $'\e[38;5;160m'"use --force to force delete $1"$'\e[00m'
                exit 1
            fi
        fi
    fi
}

make_link () {
    remove_if_exists "$2"
    [ -z "$UNINSTALL" ] && exe ln -s "$1" "$2"
}

for opt in ${@}; do
    case "$opt" in
        -h|--help) usage 0;;
        -n|--dry) DRY_RUN=1;;
        -b|--bins) WITH_BINS=1;;
        -d|--dots) WITH_DOTS=1;;
        -f|--force) FORCE_DELETE=1;;
        -u|--uninstall) UNINSTALL=1;;
        *)  echo "[ERR] Invalid option: $opt"
            usage 2;;
    esac
done

[ -z "$WITH_DOTS" ] && [ -z "$WITH_BINS" ] && usage

EXEDIR="$(dirname $0)"
DOTDIR="$(realpath --relative-to="$HOME" $EXEDIR)/dot"

pushd "$HOME"
pushd "$DOTDIR"

DOTFILES=($(print *))
BINFILES=($(print bin/*(.)))
popd
echo "PWD:\t$PWD"

if [ -n "$WITH_DOTS" ]; then
    for f in $DOTFILES; do
        [ "$f" = 'bin' ] && continue
        make_link "$DOTDIR/$f" "$HOME/.$f"
    done
fi

if [ -n "$WITH_BINS" ]; then
    for bin in $BINFILES; do
        f="$(basename $bin)"
        make_link "../../$DOTDIR/bin/$f" "$HOME/.local/bin/$f"
    done
fi

exit 0
