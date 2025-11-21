function gcl --description "Clone a git repo into ~/code/<host>/<org>/<repo> [-- git clone options]"
    if test (count $argv) -eq 0
        echo "Usage: gcl [git-clone-options] <git-url> [git-clone-options]"
        return 1
    end

    set -l repo ""
    for arg in $argv
        if string match -rq '^(git@[^:]+:.*|https?://.*)' $arg
            set repo $arg
            break
        end
    end

    if test -z "$repo"
        echo "Error: no Git URL found in arguments."
        return 1
    end

    set -l clone_args (for arg in $argv; if test "$arg" != "$repo"; echo $arg; end; end)

    set -l host_path ""
    if string match -rq '^git@[^:]+:.*' $repo
        set host_path (string match -rg '^git@(.+?):(.+?)(?:\.git)?$' $repo | string join /)
    else if string match -rq '^https?://.*' $repo
        set host_path (string match -rg '^https?://([^/]+)/(.*?)(?:\.git)?$' $repo | string join /)
    else
        echo "Unrecognized repo format: $repo"
        return 1
    end

    set -l dest_dir ~/code/$host_path
    git clone $clone_args $repo $dest_dir
    cd $dest_dir
end
