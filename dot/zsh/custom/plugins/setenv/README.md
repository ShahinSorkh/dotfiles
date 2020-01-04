# setenv

A simple plugin to source `.setupenv` and `.setdownenv` when navigating
directories on terminal.

## Install

```sh
mkdir -p "${ZSH:-$HOME/.oh-my-zsh}/custom/plugins/setenv"
curl -SsfL -o "${ZSH:-$HOME/.oh-my-zsh}/custom/plugins/setenv/setenv.plugin.zsh" \
    https://github.com/ShahinSorkh/dotfiles/raw/master/dot/zsh/custom/plugins/setenv/setenv.plugin.zsh
${EDITOR:-vi} "$HOME/.zshrc"
# add 'setenv' to plugins array
```

## Usage

![usage](usage.gif)
