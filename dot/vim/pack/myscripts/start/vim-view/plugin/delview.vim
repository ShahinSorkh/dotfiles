execute DontLoadTwice('delview')

command Delview call shso#general#DeleteView()
" Lower-case user commands: http://vim.wikia.com/wiki/Replace_a_builtin_command_using_cabbrev
cabbrev delview <c-r>=(getcmdtype() == ':' && getcmdpos() == 1 ? 'Delview' : 'delview')<cr>
