" General gui options {
  "set guioptions-=m " disable menubar
  "set guioptions-=T " disable toolbar
  " for nvim-qt
" GuiTabline 0
" GuiPopupmenu 0
" GuiScrollBar 0
" }

" GUI specific mappings {
" nnoremap <silent> <C-Tab> :tabn<cr>
" nnoremap <silent> <C-S-Tab> :tabp<cr>
" }
" if exists('g:GtkGuiLoaded')
"   let g:GuiInternalClipboard = 1
"   call rpcnotify(1, 'Gui', 'Option', 'Tabline', 1)
"   call rpcnotify(1, 'Gui', 'Option', 'Cmdline', 0)
"   call rpcnotify(1, 'Gui', 'Font', 'BlexMono Nerd Font Mono')
"   call rpcnotify(1, 'Gui', 'Option', 'Popupmenu', 0)
" endif
" 
" if exists('g:neovide')
"   let g:GuiInternalClipboard = 1
"   "set guifont=BlexMono_Nerd_Font_Mono,Noto_Color_Emoji:h10
"   let g:neovide_scale_factor = 0.58
" endif
" 
 " Enable Mouse
 set mouse=a
 
 " Set Editor Font
 if exists(':GuiFont')
     " Use GuiFont! to ignore font errors
     GuiFont Monaco:h12
 endif
 
 " Disable GUI Tabline
 if exists(':GuiTabline')
     GuiTabline 0
 endif
 
 " Disable GUI Popupmenu
 if exists(':GuiPopupmenu')
     GuiPopupmenu 0
 endif
 
 " Enable GUI ScrollBar
 if exists(':GuiScrollBar')
     GuiScrollBar 0
 endif
 
 
 " Right Click Context Menu (Copy-Cut-Paste)
 nnoremap <silent><RightMouse> :call GuiShowContextMenu()<CR>
 inoremap <silent><RightMouse> <Esc>:call GuiShowContextMenu()<CR>
 xnoremap <silent><RightMouse> :call GuiShowContextMenu()<CR>gv
 snoremap <silent><RightMouse> <C-G>:call GuiShowContextMenu()<CR>gv

" intro
