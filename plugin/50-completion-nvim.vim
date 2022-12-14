" Set completeopt to have a better completion experience
set completeopt=menuone,noinsert,noselect,preview

" Avoid showing message extra message when using completion
set shortmess+=c

" Use <Tab> and <S-Tab> to navigate through popup menu
" inoremap <expr> <Tab>   pumvisible() ? "\<C-N>" : "\<Tab>"
" inoremap <expr> <S-Tab> pumvisible() ? "\<C-P>" : "\<S-Tab>"
" 
" imap <expr> <C-N> pumvisible() ? "\<Tab>" : "\<C-X><C-O>"
" imap <expr> <C-P> pumvisible() ? "\<S-Tab>" : "\<C-X><C-O>"

lua << EOF

EOF

let g:completion_confirm_key = "\<C-y>"
let g:completion_matching_strategy_list = ['exact', 'substring', 'fuzzy', 'all']

lua require('mylua/cmp')
