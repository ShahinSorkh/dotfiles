#!/usr/bin/zsh

EXEDIR="$(dirname $0)"
DOTDIR="$(realpath --relative-to="$HOME" $EXEDIR)/dot"

pushd "$HOME"
pushd "$DOTDIR"

DOTFILES=($(print *))
pushd "$HOME"
echo "PWD:\t$PWD"

for f in $DOTFILES; do
    if [ -e "$HOME/$f" ]; then
        echo "rm $HOME/$f"
        if [ -f "$HOME/$f" ]; then rm -rf "$HOME/$f"; fi
        if [ -d "$HOME/$f" ]; then rm -rf "$HOME/$f"; fi
        if [ -L "$HOME/$f" ]; then unlink "$HOME/$f"; fi
    fi
    if [ -e "$HOME/.$f" ]; then
        echo "rm $HOME/.$f"
        if [ -f "$HOME/.$f" ]; then rm -rf "$HOME/.$f"; fi
        if [ -d "$HOME/.$f" ]; then rm -rf "$HOME/.$f"; fi
        if [ -L "$HOME/.$f" ]; then unlink "$HOME/.$f"; fi
    fi

    if [ "$f" = "moc_config" ]; then
        mkdir -p $HOME/.moc
        if [ -e "$HOME/.moc/config" ]; then
            echo "rm $HOME/.moc/config"
            if [ -f "$HOME/.moc/config" ]; then rm -rf "$HOME/.moc/config"; fi
            if [ -d "$HOME/.moc/config" ]; then rm -rf "$HOME/.moc/config"; fi
            if [ -L "$HOME/.moc/config" ]; then unlink "$HOME/.moc/config"; fi
        fi

        echo "ln -s ../$DOTDIR/$f .moc/config"
        ln -s ../$DOTDIR/$f .moc/config
    else
        echo "ln -s $DOTDIR/$f .$f"
        ln -s $DOTDIR/$f .$f
    fi
done
