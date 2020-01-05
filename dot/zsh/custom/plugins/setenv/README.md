# setenv

A simple zsh plugin to source `.setupenv` and `.setdownenv` when navigating
directories on terminal.

## Install

### With [OhMyZsh](https://github.com/ohmyzsh/ohmyzsh)

```sh
mkdir -p "${ZSH:-$HOME/.oh-my-zsh}/custom/plugins/setenv"
curl -SsfL -o "${ZSH:-$HOME/.oh-my-zsh}/custom/plugins/setenv/setenv.plugin.zsh" \
    https://github.com/ShahinSorkh/dotfiles/raw/master/dot/zsh/custom/plugins/setenv/setenv.plugin.zsh
${EDITOR:-vi} "$HOME/.zshrc"
# add 'setenv' to plugins array
```

### Manual

```sh
export SETENV_HOME="/path/to/preffered/installation/directory"
mkdir -p $SETENV_HOME
curl -SsfL -o "$SETENV_HOME/setenv.plugin.zsh" \
    https://github.com/ShahinSorkh/dotfiles/raw/master/dot/zsh/custom/plugins/setenv/setenv.plugin.zsh
echo "[ -r \"$SETENV_HOME/setenv.plugin.zsh\" ] && source \"$SETENV_HOME/setenv.plugin.zsh\"" >>"$HOME/.zshrc"
```

## Usage

![usage](usage.gif)
