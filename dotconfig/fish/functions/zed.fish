function zed --wraps=WAYLAND_DISPLAY=\'\'\ zed\ --foreground --description alias\ zed=WAYLAND_DISPLAY=\'\'\ zed\ --foreground
  WAYLAND_DISPLAY='' zed --foreground $argv; 
end
