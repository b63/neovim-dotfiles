
" auxillary Functions
" -----------------

" RunFirstCommentLine: Run command in first comment line of file
function! RunFirstCommentLine(comment_char) " {{{1
  let getcmd = 'sed -E "s/\s*' . a:comment_char . '\s*(.*)$/\1/g" | tr -d "\n"'
  echomsg getcmd
  let cmd = system(getcmd, getline(1))
  let fullcmd = '!bash -c "cd \"' . (expand('%:p:h')) . '\" && ' . cmd . '"'
  exec fullcmd
endfunction " }}}1

" ToggleSyntax: turn syntax highlighting on/off
function! ToggleSyntax() " {{{1
  if exists("g:syntax_on")
    syntax off
  else
    syntax enable
  endif
endfunction " }}}1

" MyTabLabel: custom tab label string
function! MyTabLabel(n) " {{{1
  let buflist = tabpagebuflist(a:n)
  let winnr = tabpagewinnr(a:n)
  let fnamesplit = split(bufname(buflist[winnr - 1]), '/')
  let fname=''
  if len(fnamesplit) > 0
      let fname = fnamesplit[-1]
  endif

  return (a:n)." ".fname." "
endfunction " }}}1

" MyTabLine: custom tabline string
function! MyTabLine() " {{{1
  let s = ''
  for i in range(tabpagenr('$'))
    " select the highlighting
    if i + 1 == tabpagenr()
      let s .= '%#Search#'
    else
      let s .= '%#TabLine#'
    endif

    " set the tab page number (for mouse clicks)
    let s .= '%' . (i + 1) . 'T'

    " the label is made by MyTabLabel()
    let s .= ' %{MyTabLabel(' . (i + 1) . ')} '
  endfor

  " after the last tab fill with TabLineFill and reset tab page nr
  let s .= '%#TabLineFill#%T'

  return s
endfunction "}}}1

" OpenBufTab: Open current buffer in new tab
function! OpenBufNewTab(bn) " {{{1
  tabnew
  execute "buffer " . a:bn
endfunction " }}}1

" CloseEmptyBuffers: Close all empty buffers
function! CloseEmptyBuffers() " {{{1
    let last_buffer = bufnr('$')
    let n = 1
    let closed=0
    while n <= last_buffer
        if buflisted(n) && bufname(n) == ''
            silent exec 'bdelete! ' . n
            let closed=closed+1
        endif
        let n = n+1
    endwhile
    echomsg "deleted " . closed . " empty buffers"
endfunction " }}}1

" DeleteSwap: Delete swapfile of current buffer
function! DeleteSwap(bn)  " {{{1
    let swname = swapname(a:bn)
    if swname != ''
      let head = substitute(swname, '\.sw.$', '', '')
      let ends = ['.swo', '.swp']
      let deleted = []
      for fp in ends
        let swpfile = head . fp
        if !empty(glob(swpfile))
          exec 'silent !rm -f ' . swpfile
          call add(deleted, swpfile)
        endif
      endfor

      redraw
      if !empty(deleted)
        echomsg "Deleted swap file(s) " . join(deleted, ', ')
      else
        echomsg 'No swap on disk'
      endif
    else
      echomsg 'No swap found'
    endif
endfunction " }}}1

" DiffFileOnDisk: Open buffer in new tab and in split window
"   read in content of file from disk. The two buffers are
"   in set in diff-mode. If the current buffer does not
"   have a associated file on disk, then nothing is done.
"   Sets the tab local variable '_difffod' to differentiate
"   the opened tab page from other tab pages.
function! DiffFileOnDisk() " {{{1
  let fn = expand('%')
  if !empty(fn)
    " capture local options/vars
    let ft=&l:ft
    let bn=bufnr()
    " temporarily set buftype to disable W12
    setl buftype=nowrite

    -tabnew
    exec 'buffer '.bn
    setl buftype=

    diffthis
    vsplit
    enew
    exec '%!cat '.fn
    let t:_difffod=bufnr()

    " set local options
    let &l:ft=ft
    setl buftype=nofile
    setl bufhidden=hide
    setl noswapfile
    "setl ro
    diffthis

    exec "wincmd p"
  endif
endfunction " }}}1

" CleanUpDiffFileOnDisk: Cleans up after DiffFileOnDisk
function! CleanUpDiffFileOnDisk() " {{{1
  if exists('t:_difffod') && bufexists(t:_difffod)
    diffoff
    if tabpagewinnr(tabpagenr(), '$') == 1
      exec 'bd! '.t:_difffod
    else
      exec 'bd! '.t:_difffod
      tabclose
    endif
  endif
endfunction " }}}1

" StartDiffFileOnDisk: calls DiffFileOnDisk or CleanUpDiffFileOnDisk
"   depending of the existence of tab page local variable 't:_difffod'
function! StartDiffFileOnDisk() " {{{1
  if exists('t:_difffod')
    call CleanUpDiffFileOnDisk()
  else
    call DiffFileOnDisk()
  endif
endfunction " }}}1

" ToggleWrapMappings: toggles switching of commands like $ to g$
function! s:ToggleWrapMappings() " {{{1
  if &l:wrap
    " movements refer to visual lines instead of logical lines 
    " down
    nnoremap j gj
    nnoremap gj j
    " up
    nnoremap k gk
    nnoremap gk k
    " beginning of line
    nnoremap ^ g^
    nnoremap g^ ^
    " end of line
    nnoremap $ g$
    nnoremap g$ $
    " insert at end of line
    nnoremap A g$a
    nnoremap gA A
    " insert at beginning of line
    nnoremap I g^i
    nnoremap gI I
  else
    nunmap j
    nunmap gj
    nunmap k
    nunmap gk
    nunmap ^
    nunmap g^
    nunmap $
    nunmap g$
    nunmap A
    nunmap gA
    nunmap I
    nunmap gI
  endif
endfunction " }}}1

" DeleteBufAndSeek: delete current buffer and seek to previous one
function! DeleteBufAndSeek(current) " {{{1
  execute "normal \<C-P>"
  if bufnr(bufname()) != a:current
    execute ":bd " . a:current
  else
    execute "normal \<C-N>"
    if bufnr(bufname()) != a:current
      execute ":bd " . a:current
    endif
  endif
endfunction "}}}1


" Requires Floaterm Plugin
" OpenScratchTerm: open a terminal with name 'scratch' {{{1
function! OpenScratchTerm()
  if floaterm#terminal#get_bufnr('scratch') < 0
    execute 'FloatermNew --title=scratch --name=scratch'
  else
    execute 'FloatermToggle scratch'
    let winnr = floaterm#window#find()
    echomsg winnr
    if winnr <= 0
      execute "normal \<C-W>l"
    endif
  endif
endfunction
" }}}1

" OpenScratchTermDir: open a terminal with name 'scratch' {{{1
function! OpenScratchTermDir(dir)
  if floaterm#terminal#get_bufnr('scratch') < 0
    execute 'FloatermNew --title=scratch --name=scratch --cwd='.a:dir.''
  else
    execute 'FloatermToggle --cwd='.a:dir.' scratch'
    let winnr = floaterm#window#find()
    echomsg winnr
    if winnr <= 0
      execute "normal \<C-W>l"
    endif
  endif
endfunction
" }}}1
"
