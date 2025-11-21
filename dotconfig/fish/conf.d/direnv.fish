if command -v direnv >/dev/null
    set -g direnv_fish_mode disable_arrow

    direnv hook fish | source
end

