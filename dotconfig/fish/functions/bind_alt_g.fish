function bind_alt_g
  fish_commandline_append " &| rg -i ''"
  commandline -f end-of-line backward-char
end
