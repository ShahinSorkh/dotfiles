function setenv_on_chpwd () {
    for ENVSCRIPT in "$OLDPWD/.setdownenv" "$PWD/.setupenv"
    do
        if [ -r "$ENVSCRIPT" ]
        then
            if [ -r "$HOME/.settokenenv" ] && ( grep -f "$HOME/.settokenenv" "$ENVSCRIPT" 2>&1 >/dev/null )
            then
                echo source "$ENVSCRIPT"
                source "$ENVSCRIPT"
            else
                [ -n "$ans" ] && unset ans
                vared -p "$ENVSCRIPT found. source it? " -r '[y/N]' -c ans
                [ "$ans" = "y" ] && source "$ENVSCRIPT"
            fi
        fi
    done
}

add-zsh-hook chpwd setenv_on_chpwd
