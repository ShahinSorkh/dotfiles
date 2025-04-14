#fish_add_path -g $HOME/.local/bin

set -xg fish_greeting
set -xg EDITOR nvim
set -xg VISUAL nvim

set --universal nvm_default_version lts/iron
set --universal nvm_default_packages yarn pnpm ts-node

if status is-interactive
    bass source $HOME/.cargo/env
end

# pnpm
set -gx PNPM_HOME "/home/shahin/.local/share/pnpm"
if not string match -q -- $PNPM_HOME $PATH
  set -gx PATH "$PNPM_HOME" $PATH
end
# pnpm end

# Created by `pipx` on 2024-06-16 19:22:14
set PATH $PATH /home/shahin/.local/bin
