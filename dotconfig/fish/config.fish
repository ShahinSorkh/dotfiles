fish_add_path -g $HOME/.local/bin
fish_add_path -g $HOME/.emacs.d/bin
fish_add_path -g $HOME/.config/composer/vendor/bin
fish_add_path -g $HOME/go/bin
fish_add_path -g /usr/lib/jvm/default/bin
set -Ux EDITOR vim
set -Ux VISUAL 'emacsclient --alternate-editor= -nw'

if status is-interactive
    # Commands to run in interactive sessions can go here
end
