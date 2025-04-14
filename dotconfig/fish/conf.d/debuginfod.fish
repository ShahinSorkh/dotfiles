if test -d /etc/debuginfod/
    set -Ux DEBUGINFOD_URLS (cat /etc/debuginfod/*.urls 2>/dev/null | tr '\n' ' ')
end
