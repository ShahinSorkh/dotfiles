#fish_add_path -g $HOME/.local/bin

set -gx fish_greeting

set -gx EDITOR nvim
set -gx VISUAL nvim

if status is-interactive
    if test -f $HOME/.profile
        bass source $HOME/.profile
    end
end

if test -d $HOME/.bin
    fish_add_path $HOME/.bin
end


# bun
set --export BUN_INSTALL "$HOME/.bun"
set --export PATH $BUN_INSTALL/bin $PATH
