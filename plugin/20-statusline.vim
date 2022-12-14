" Status Line Configuration 
" -----------------------------

" to view all groups run :so $VIMRUNTIME/syntax/hitest.vim
" higlight: %#<highlight group here>#
set statusline =                         "empty it first
set statusline +=%#Search#
" TODO: put more useful info here
set statusline +=%y                      "file type 

set statusline +=%#DiffDelete#
set statusline +=%r                      "ready only
set statusline +=%#PmenuSbar#
set statusline +=\ %n\                   "buffer number
set statusline +=%*
set statusline +=\ %<%f                  "full path
"set statusline +=%#StatusLine#
set statusline +=%m                      "modified flag
set statusline +=%=                      "filler
set statusline +=%#StatusLineNC#
set statusline +=\ %b\ 0x%04B\          "character under cursor
set statusline +=%*
set statusline +=\ [%{&fileencoding?&fileencoding:&encoding}] " file encoding
set statusline +=[%{&ff}]\            "file format (unix, dos, mac)
" % of total line, current line,column-vitual col
set statusline +=%#PmenuSbar#
set statusline +=\ [%2p%%][%l,%c%2V]
set statusline +=\ 



" Tab-line Configuration
" --------------------------
set tabline=%!MyTabLine()
