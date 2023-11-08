fish_add_path -g /usr/lib/jvm/default/bin
fish_add_path -g $HOME/.local/bin
fish_add_path -g $HOME/.emacs.d/bin
fish_add_path -g $HOME/.config/composer/vendor/bin
fish_add_path -g $HOME/go/bin
fish_add_path -g $HOME/.local/share/solana/install/active_release/bin
fish_add_path -g $HOME/.detaspace/bin
fish_add_path -g $HOME/.npm-packages/bin
fish_add_path -g $HOME/opt/VSCode/bin
if command -v gem >/dev/null
    fish_add_path -g (gem environment user_gemhome)/bin || true
end

set -xg fish_greeting
set -xg EDITOR e
set -xg VISUAL e

if status is-interactive
    bass source $HOME/.cargo/env
    load_nvm >/dev/stderr
end

# bun
set --export BUN_INSTALL "$HOME/.bun"
set --export PATH $BUN_INSTALL/bin $PATH

# pnpm
set -gx PNPM_HOME "/var/home/shahin/.local/share/pnpm"
if not string match -q -- $PNPM_HOME $PATH
  set -gx PATH "$PNPM_HOME" $PATH
end
# pnpm end