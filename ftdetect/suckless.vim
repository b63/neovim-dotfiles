" Special config for dwm/st source files.
" au command is defined here so that 
"   - it runs after the general au commands for filetypes defined in $MYVIMRC
"   - re-sourcing $MYVIMRC and running :filetype detect will result
"     in these commands being executed

let s:filetypes = ['c', 'cpp', 'make']
function! s:CustomSetup()
  let ft = &l:filetype
  if index(s:filetypes, ft) != -1
    setl noexpandtab
    setl softtabstop=0
    setl shiftwidth=8
  endif
endfunction

au BufNewFile,BufRead */dwm/*,*/st/*,*/slstatus/* call s:CustomSetup()
