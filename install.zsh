#!/usr/bin/zsh

EXEDIR="$(dirname $0)"
DOTDIR="$(realpath --relative-to="$HOME" $EXEDIR)/dot"

pushd "$HOME"
pushd "$DOTDIR"

DOTFILES=($(print *))
popd
echo "PWD:\t$PWD"

for f in $DOTFILES; do
    if [ -e "$HOME/$f" ]; then
        echo "- rm $f"
        if [ -f "$HOME/$f" ]; then rm -rf "$HOME/$f"; fi
        if [ -d "$HOME/$f" ]; then rm -rf "$HOME/$f"; fi
        if [ -L "$HOME/$f" ]; then unlink "$HOME/$f"; fi
    fi
    if [ -e "$HOME/.$f" ]; then
        echo "- rm .$f"
        if [ -f "$HOME/.$f" ]; then rm -rf "$HOME/.$f"; fi
        if [ -d "$HOME/.$f" ]; then rm -rf "$HOME/.$f"; fi
        if [ -L "$HOME/.$f" ]; then unlink "$HOME/.$f"; fi
    fi

    echo "+ ln -s $DOTDIR/$f .$f"
    ln -s $DOTDIR/$f .$f
done
