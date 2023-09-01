"
"let g:netrw_keepdir = 0
"let g:netrw_winsize = 30
"let g:netrw_banner = 0 " hide help banner the top, use I to toggle
"" hide dot files on load
"let g:netrw_list_hide = '\(^\|\s\*\)\.\S\+'
"let g:netrw_localcopydircmd = 'cp -r'
"hi! link netrwMarkFile Search
"
"" mapping to open and close netrw
"nnoremap <leader>dd  :Lexplore %:p:h<CR>
"nnoremap <leader>dh  :Lexplore<CR>
"
"function! QuitNetrw()
"  for i in range(1, bufnr("$"))
"    if bufexists(i)
"      if getbufvar(i, '&filetype') == "netrw"
"        silent exe 'bwipeout ' . i
"      endif
"    endif
"  endfor
"endfunction
"
"" mappings inside netrw buffer
"function! NetrwMapping()
"  " ''go back' in history
"  nmap <buffer> H u
"  " 'goback' in directory
"  nmap <buffer> h -^
"  nmap <buffer> l <CR>
"
"  " show dot files
"  nnoremap <silent> <buffer> . :if g:netrw_hide == 0 \| let g:netrw_hide=1 \| else \| let g:netrw_hide=0 \| endif \| e .<CR>
"  " close preview window
"  nmap <buffer> P <C-w>z
"
"  " open a file and close netrw
"  nnoremap <buffer> L <CR>:Lexplore<CR>
"
"  nnoremap <buffer> fl :echo join(netrw#Expose("netrwmarkfilelist"), "\n")<CR>
"  nnoremap <buffer> fq :echo 'Target:' . netrw#Expose("netrwmftgt")<CR>
"  nnoremap <buffer> <C-P> :execute 'cd "'.expand('%:h').'"'<CR>
"  nnoremap <buffer> <C-N> :echo 'Disabled inside netrw buffer.'<CR>
"  "nmap <silent> <buffer> % :call NetrwCreateFile()<CR>
"endfunction
"
"augroup netrw_mapping
"  autocmd!
"  autocmd filetype netrw call NetrwMapping()
"  autocmd filetype netrw setl statusline=%#Search#%y%#PmenuSbar#\ %n\ %*
"augroup END
"
"" quit netrw
"nnoremap <leader>dc :call QuitNetrw()<CR>
"
""autocmd bufenter * if (winnr("$") == 1 && exists("b:NERDTree") && b:NERDTree.isTabTree()) | q | endif
"
"" reference: https://vonheikemen.github.io/devlog/tools/using-netrw-vim-builtin-file-explorer/
