" using $VIMINIT seems to make $MYVIMRC not get set correctly
let $MYVIMRC=$XDG_CONFIG_HOME.'/nvim/init.vim'
let $CONFPATH=$XDG_CONFIG_HOME.'/nvim'
set exrc


let mapleader = " "
let maplocalleader = "\\"
"
" set guifont
set guifont=BlexMono\ Nerd\ Font\ Mono:h10

" Plugins Initializaiton: {{{1
  call plug#begin(stdpath('data').'/plugged')

  " color scheme/theme
  "Plug 'morhetz/gruvbox'
  "Plug 'arcticicestudio/nord-vim'
  "Plug 'sainnhe/sonokai'
  "Plug 'ayu-theme/ayu-vim'
  Plug 'tomasiser/vim-code-dark'

  " Intellisense engine
  "Plug 'neoclide/coc.nvim', {'branch': 'release'}
  Plug 'neovim/nvim-lspconfig'
  Plug 'hrsh7th/cmp-nvim-lsp'
  Plug 'hrsh7th/cmp-nvim-lua'
  Plug 'hrsh7th/cmp-buffer'
  Plug 'hrsh7th/cmp-path'
  Plug 'hrsh7th/nvim-cmp'

  " for smoother scrolling with C-U/C-D
  " Plug 'psliwka/vim-smoothie'
  " Plug 'nvim-lua/completion-nvim'

  " for easy surround
  Plug 'tpope/vim-surround'

  " telescope
  Plug 'nvim-lua/popup.nvim'
  Plug 'nvim-lua/plenary.nvim'
  Plug 'nvim-telescope/telescope.nvim'

  " tree-sitting
  Plug 'nvim-treesitter/nvim-treesitter'

  Plug 'junegunn/fzf'

  " to show indent guides
  " Plug 'nathanaelkane/vim-indent-guides'

  " for autoclosing matching braces
  " Plug 'cohama/lexima.vim' 

  " asymptote syntax
  " Plug 'hura/vim-asymptote'

  " terminals
  Plug 'voldikss/vim-floaterm'

  Plug stdpath('data').'/plugins/win-hist'
  call plug#end()
  " Note: automatically enables syntax and filetype indent
" }}}1

" Terminal Colors: {{{1
  "Use 24-bit (true-color) mode in Vim/Neovim when outside tmux.
  if (empty($TMUX))
    if (has("nvim"))
      "For Neovim 0.1.3 and 0.1.4 < https://github.com/neovim/neovim/pull/2198 >
      let $NVIM_TUI_ENABLE_TRUE_COLOR=1
    endif

    if (has("termguicolors"))
      set termguicolors
    endif
  else
    " check if tmux supports truecolor
    let info=system("tmux info | grep Tc")
    "if and(stridx(info, "true")!=-1, has("termguicolors"))
    if (1)
      let $NVIM_TUI_ENABLE_TRUE_COLOR=1
      set termguicolors
    endif
  endif

  if has("gui_running")
    set guioptions-=m " disable menubar
    set guioptions-=T " disable toolbar
  endif
" }}}1

" Plugin Config: {{{1
"
  " telescope Plugin {{{2
  " nnoremap <leader>ff <cmd>lua require('telescope.builtin').find_files()<cr>
  " nnoremap <leader>fg <cmd>lua require('telescope.builtin').live_grep()<cr>
  " nnoremap <leader>fb <cmd>lua require('telescope.builtin').buffers()<cr>
  " nnoremap <leader>fh <cmd>lua require('telescope.builtin').help_tags()<cr>
  " }}}2

  " IndentLine Plugin: {{{2
    " let g:indent_guides_auto_colors = 0
    " let g:indent_guides_start_level=1
    " let g:indent_guides_guide_size=2
    " let g:indent_guides_enable_on_vim_startup = 0
    " nnoremap <space>i :IndentGuidesToggle<CR>

    " autocmd VimEnter,Colorscheme * :hi IndentGuidesEven ctermbg=0 guibg=#353B49
    " autocmd VimEnter,Colorscheme * :hi IndentGuidesOdd ctermbg=8 guibg=#3b4252
  " }}}2

  " Terminal Plugin: {{{2
    let g:floaterm_autoclose = 1
    let g:floaterm_height = 0.4
    let g:floaterm_wintype = 'split'
    nnoremap <silent> <leader>; :call OpenScratchTerm()<CR>
    nnoremap <silent> <leader>: :call OpenScratchTermDir(expand('%:p:h'))<CR>
    tnoremap <silent> <C-W>N <C-\><C-N>

  " }}}2
" }}}1

" load config from lua file
lua require('mylua/initrc')

" let ayucolor="mirage"
" colorscheme  ayu
