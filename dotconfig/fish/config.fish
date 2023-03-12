fish_add_path -g $HOME/.local/bin
fish_add_path -g $HOME/.emacs.d/bin
fish_add_path -g $HOME/.config/composer/vendor/bin
fish_add_path -g $HOME/go/bin
fish_add_path -g /usr/lib/jvm/default/bin

set -U fish_greeting
set -Ux EDITOR vim
set -Ux VISUAL vim

if status is-interactive
    # Commands to run in interactive sessions can go here
    bind \eg 'fish_commandline_append " &| rg"'
end
