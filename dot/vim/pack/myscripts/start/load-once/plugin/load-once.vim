function! DontLoadTwice( globalIdentifier )
  let result = ''
  if exists( 'g:loaded_' . a:globalIdentifier )
    let result = 'finish'
  else
    let g:loaded_{a:globalIdentifier} = 1
  endif
  return result
endfunction
