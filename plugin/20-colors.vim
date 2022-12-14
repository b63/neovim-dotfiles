
" disable syntax highlights for tex errors (often off and distracting)
let g:tex_no_error=1

function! SetupColorSchemeNord()
  "let g:gruvbox_contrast_dark='hard'
  "let g:gruvbox_italic=1
  "let g:gruvbox_underline=1

  let g:nord_cursor_line_number_background = 1
  let g:nord_bold_vertical_split_line = 0
  let g:nord_cursor_line_number_background = 1
  let g:nord_uniform_diff_background = 1
  let g:nord_italic = 1
  let g:nord_italic_comments = 1
  let g:nord_underline = 1

  "hi LineNr guifg=#78849D
  "hi SignColumn guibg=None
  "hi FoldColumn guibg=None
  "hi VertSplit guibg=None
  set background=dark
  set pumblend=15
  let s:transparent=0

  colorscheme nord

  hi LspDiagnosticsDefaultError ctermfg=1 guifg=#BF616A
  hi LspDiagnosticsDefaultWarning ctermfg=3 guifg=#EBCB8B
  hi LspDiagnosticsDefaultInformation ctermfg=8 guifg=#616E88
  hi LspDiagnosticsUnderlineError cterm=underline gui=underline ctermfg=1 guifg=#BF616A
  hi LspDiagnosticsUnderlineWarning cterm=underline gui=underline ctermfg=3 guifg=#EBCB8B
  hi LspDiagnosticsUnderlineInformation cterm=underline gui=underline ctermfg=8 guifg=#616E88

  hi LspReferenceRead cterm=underline gui=underline
  hi LspReferenceText cterm=underline gui=underline
  hi LspReferenceWrite cterm=underline gui=underline
endfunction

function! SetupColorSchemeSonokai()
  set background=dark
  set pumblend=15
  let s:transparent=0

  let g:sonokai_style = 'atlantis'
  let g:sonokai_enable_italic = 1

  colorscheme sonokai
endfunction

function! SetupColorSchemeAyu()
  let ayucolor="mirage"
  colorscheme ayu
endfunction

function! SetupColorSchemeVimCodeDark()
  colorscheme codedark
endfunction

call SetupColorSchemeVimCodeDark()


function! ToggleTranslucency()
  if s:transparent
    set background=dark
  else
    hi Normal ctermbg=NONE guibg=NONE<CR>
  endif
  let s:transparent=!s:transparent
endfunction

noremap <leader>B :call ToggleTranslucency()<CR>
