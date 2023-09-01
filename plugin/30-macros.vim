
"TODO: add mapping for moving text with ALT+movement keys
set timeout ttimeoutlen=20
" umap <Space> in normal mode because it's the leader
nnoremap <Space> <nop>


" reload buffer
nnoremap <leader>r :e! %<CR>
" remove higlight until next search
nnoremap <leader>h :noh<CR>
nnoremap <leader>qt :tabclose<CR>

" TODO: add copy to clipboard mapping
" copy and paste from x-org clipboard
" note: shadows CTRL-V and u,U,x,X to insert unicode
" inoremap <C-v> <C-r>=system("xclip -selection clipboard -o")<cr>
" inoremap <C-c> <esc>:read !xclip -selection clipboard  -o<cr>
vnoremap <C-y> "+y
nnoremap <C-y> v"+y

" toggle syntax with F7
noremap <silent> <F7> :call ToggleSyntax()<cr>

" lauch new terminal with ALT+Enter (to be consistent with the zsh binding
" in .zshrc)
"noremap <silent> <M-CR> :call system('nohup st -e tmux -f $XDG_CONFIG_HOME/tmux/tmux.conf new -c "'.$PWD.'" &; disown')<cr>
" Note: having weird bug where Mod4+h or Mod4+l closes the spawned terminal
"   removing the '&' solves it but then can't use vim

" diff contents of buffer with file on disk
nnoremap <silent> <localleader>d :call StartDiffFileOnDisk()<cr>

command! DosToUnix e! ++ff=dos | setl ff=unix


" Tabline Tab Config: {{{1
  " macros for jumping to tabs
  nnoremap <silent> <leader>1 :tabnext 1<cr>
  nnoremap <silent> <leader>2 :tabnext 2<cr>
  nnoremap <silent> <leader>3 :tabnext 3<cr>
  nnoremap <silent> <leader>4 :tabnext 4<cr>
  nnoremap <silent> <leader>5 :tabnext 5<cr>
  nnoremap <silent> <leader>6 :tabnext 6<cr>
  nnoremap <silent> <leader>7 :tabnext 7<cr>
  nnoremap <silent> <leader>8 :tabnext 8<cr>
  nnoremap <silent> <leader>9 :tabnext 9<cr>

  " macros for creating/navigating tabs
  nnoremap <silent> <C-Tab> :tabn<cr>
  nnoremap <silent> <C-S-Tab> :tabp<cr>
  nnoremap <silent> <leader>n :tabn<cr>
  nnoremap <silent> <leader>p :tabp<cr>

  nnoremap <silent> <leader>t :$tabnew<cr>
  nnoremap <silent> <leader>T :call OpenBufNewTab(bufnr('%'))<cr>
  nnoremap <silent> <C-Q> :tabclose<cr>
" }}}1 

" Diffmode: {{{1
  " accept/reject line in diffmode
  nnoremap <silent> <leader>a :if exists('&l:diff') && &l:diff \| diffget \| endif<cr>
  nnoremap <silent> <leader>r :if exists('&l:diff') && &l:diff \| diffput \| endif<cr>
" }}}1

" Movement Navigation Macros: {{{1
  command! NoWrap if &l:wrap<bar>set nowrap<bar>call s:ToggleWrapMappings()<bar>endif
  command! Wrap   if !&l:wrap<bar>set wrap<bar>call s:ToggleWrapMappings()<bar>endif

  " buffer
  nnoremap <silent> <leader>c :call DeleteSwap(bufnr())<cr>:redraw<cr>
  nnoremap <silent> <leader>E :call CloseEmptyBuffers()<cr>:redraw<cr>
  nnoremap <silent> <leader>qq :call DeleteBufAndSeek(bufnr(bufname()))<cr>
  " windows
  nnoremap <leader>w :Win<cr>
  noremap  <silent>  <leader>qw :q<cr>

  " <C-j> and <C-j> to scroll view up & dowm
  nnoremap <C-j> <C-e>
  nnoremap <C-k> <C-y>
  "inoremap <C-j> <esc><C-y>a
  "inoremap <C-k> <esc><C-e>a this is used for signature help with lsp

  "" move between buffers
  "" open next buffer in current window
  "nnoremap <C-N> :call SeekWindowBuffer(1)<cr>
  "" open previous buffer in current window
  "nnoremap <C-P> :call SeekWindowBuffer(-1)<cr>

  " quickly edit and source vimrc
  nnoremap <leader>ev :edit! $MYVIMRC<cr>
  nnoremap <leader>sv :w<cr>:source $MYVIMRC<cr>
  nnoremap <leader>Sv :w<cr>:source $MYVIMRC<cr>

  tnoremap <C-\> <C-\><C-N>
  tnoremap <C-W>h <C-\><C-N><C-W>h
  tnoremap <C-W>j <C-\><C-N><C-W>j
  tnoremap <C-W>k <C-\><C-N><C-W>k
  tnoremap <C-W>l <C-\><C-N><C-W>l

  "nnoremap <silent> <C-H> :execute 'silent !cd '.expand('%:p:h')<cr>:echomsg 'Changed directory: '.expand('%:p:h')<cr>

" }}}1

" Spelling: {{{1
  nnoremap <Leader>s a<C-X><C-S>
  inoremap <C-C> <C-X><C-S>
" }}}1
