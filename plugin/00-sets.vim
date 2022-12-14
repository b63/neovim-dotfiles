" variable to make sure some things only run once
if !exists("s:loaded_vimrc")
    let s:loaded_vimrc=0
endif

" General Config: {{{1
  " hide backup and swap files
  set backupdir=.,$XDG_DATA_HOME/nvim/backup
  set directory=.,$XDG_DATA_HOME/nvim/backup
  set noswapfile
  set undodir=$XDG_DATA_HOME/nvim/undodir
  set undofile

  set laststatus=2  " always display status line
  set cursorline    " higlight current line and column
  set showmatch     " show matching braces

  set backspace=indent,start
  " indent  allow backspacing over autoindent
  " eol     allow backspacing over line breaks (join lines)
  " start   allow backspacing over the start of insert; CTRL-W and CTRL-U
  "         stop once at the start of insert.

  set mouse=a          " enable mouse
  set display=lastline " display last line

  set hidden  " allow unwritten buffers to be hidden by default

  " keep cursor some offset from the edge of the screen
  set sidescrolloff=15
  set scrolloff=8

  " Folding: {{{2
    if !s:loaded_vimrc
      set foldmethod=syntax
      set foldlevel=3        " default fold level
      set foldcolumn=3       " show fold column with width 1
      set foldenable         " draw on the foldcolumn, if disable fold column remains blank
    endif
  " }}}2

" }}}1

" Formatting: {{{1
  " how vim represents characters internally
  set encoding=utf-8
  " default encoding in which to write files
  setglobal fileencoding=utf-8
  " what to set fileencdoing to when reading a file
  set fileencodings=utf-8,latin1,ucs-bom
  " enable filetype
  filetype on

  " use \n instead of shitty \r\n
  " and wtf apple, \r??
  set fileformats=unix " only load buffers in unix format
  set fileformat=unix
  " to convert from dos ff to unix
  " :e ++ff=dos (reads file in dos ff)
  " :setlocal ff=unix (converts to unix ff)
  " :w (save in unix ff)

  " show invisible characters
  set listchars=eol:¬,tab:>-,trail:·,extends:>,precedes:<
  set list

  " show line numbers
  set number relativenumber
  set ruler
  " denote the maximum line limit as line 100 by coloring column
  set colorcolumn=100

  " number of spaces that a <Tab> counts for
  if !s:loaded_vimrc
    set softtabstop=4
    set shiftwidth=4   " amount shifted by >> <<
    set expandtab      " insert spaces instead of tabs, use CTRL-V<Tab> for lit.
    set shiftround     " round indent to multiples of 'shiftwidth', eg. when using >> <<
    set autoindent     " copy indent from current line to next
    set cindent        " use cstyle indent
    set nowrap         " turn off line wrapping
  endif
" }}}

let s:loaded_vimrc=1
