" # A way to delete 'mkview'
function! shso#general#DeleteView()
	let path = fnamemodify(bufname('%'), ':p')
	" vim's odd =~ escaping for /
	let path = substitute(path, '=', '==', 'g')
	if empty($HOME)
	else
		let path = substitute(path, '^' . $HOME, '\~', '')
	endif
	let path = substitute(path, '/', '=+', 'g') . '='
	" view directory
	let path = &viewdir . '/' . path
	call delete(path)
	echo 'Deleted: ' . path
endfunction
