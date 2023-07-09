set -U ANDROID_HOME /opt/android-sdk

fish_add_path -g $HOME/.local/bin
fish_add_path -g $HOME/.emacs.d/bin
fish_add_path -g $HOME/.config/composer/vendor/bin
fish_add_path -g $HOME/go/bin
fish_add_path -g $HOME/.local/share/solana/install/active_release/bin
fish_add_path -g $HOME/.detaspace/bin
fish_add_path -g $HOME/.npm-packages/bin
fish_add_path -g $HOME/opt/VSCode/bin
fish_add_path -g /usr/lib/jvm/default/bin

set -U fish_greeting
set -U EDITOR vim
set -U VISUAL vim

if status is-interactive
    # Commands to run in interactive sessions can go here
end
