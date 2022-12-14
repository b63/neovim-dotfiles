
augroup vimrc_ft 
  au!
" Matlab: {{{1
au FileType matlab setl sw=2 sts=2
" }}}1

" Javscript: {{{1
au FileType javascript setl sw=4 sts=4
" }}}1

" HTML: {{{1
au FileType html setl sw=2 sts=2
" }}}1

" JSON: {{{1
au FileType json setl sw=2 sts=2
au FileType json setl foldmethod=syntax
" }}}1

" CSS: {{{1
au FileType vim setl sw=2 sts=2
au FileType vim setl foldmethod=marker
au FileType vim setl foldmarker={,}
au FileType vim setl foldlevel=2
" }}}1

" Vimscript: {{{1
au FileType vim setl sw=2 sts=2
au FileType vim setl foldmethod=marker
au FileType vim setl foldmarker={{{,}}}
au FileType vim setl foldlevel=0
" }}}1

" LaTeX: {{{1
au FileType tex setl sw=4 sts=4
au FileType tex setl foldmethod=indent
au FileType tex setl spell spelllang=en_us " enable spellcheck 
" compile with pdflatex
au FileType tex nnoremap <buffer> <LocalLeader>C :!pdflatex -shell-escape %<cr>

" provide custom compile command as comment in first line
" then running this macro will runn it
au FileType tex nnoremap <buffer> <LocalLeader>c :w<cr>:call RunFirstCommentLine('%')<cr>

" don't conceal tex-syntax
let g:tex_conceal=""
" synatax folding
let g:tex_fold_enabled=1
" }}}1

" Asymptote: {{{1
au FileType asy nnoremap <buffer> <LocalLeader>c :w<cr>:call RunFirstCommentLine('\/\/')<cr>
" }}}1

" C: {{{1
au FileType c setl sw=4 sts=4
" }}}1

" make: {{{1
au FileType make setl sw=4 sts=4
au FileType make setl noexpandtab
" }}}1

" Cpp: {{{1
au FileType c setl sw=4 sts=4
" }}}1
augroup END
