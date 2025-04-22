#fish_add_path -g $HOME/.local/bin

set -gx fish_greeting

set -gx EDITOR nvim
set -gx VISUAL nvim

set --universal nvm_default_version lts/iron
set --universal nvm_default_packages yarn pnpm ts-node

if status is-interactive
    if test -f $HOME/.profile
        bass source $HOME/.profile
    end
end

# pnpm
set -gx PNPM_HOME "/home/shahin/.local/share/pnpm"
if not string match -q -- $PNPM_HOME $PATH
  set -gx PATH "$PNPM_HOME" $PATH
end
# pnpm end
