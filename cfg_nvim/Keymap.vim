
" ================================= Braces & Brackets =================

  exe "source " expand(prefix) . "Brackets.vim"

" ================================= Comments ==========================

   nnoremap <Leader># mrI# <esc>`r
   nnoremap <Leader><A-#> mr^d2l`r
   vnoremap # <c-v>mh0I# <esc>`h
   vnoremap / <c-v>mh0I// <esc>`h
   vnoremap <a-/> :s/\/\/ //<CR>
   vnoremap ' <c-v>mh0I' <esc>`h
   vnoremap <a-'> :s/\' //<CR>
   vnoremap <Leader>" <c-v>mh0I" <esc>`h
   vnoremap <a-"> :s/\" //<CR>

" ================================= Completion ========================

  inoremap </ </<c-x><c-o>
  inoremap "<Space>=== " ==================================<c-o>mn===================================<CR>

" ================================= EasyAlign =========================

  xmap ga <Plug>(EasyAlign)
  nmap ga <Plug>(EasyAlign)
  vmap <M-A> gaip*<c-X>

" ================================= Insert Movement ===================

  inoremap <c-h> <c-o>h
  inoremap <c-j> <c-o>j
  inoremap <c-k> <c-o>k
  inoremap <c-l> <esc>la

" ================================= select all ========================

  inoremap <a-a> <esc>mpggvg
  nnoremap <A-a> mpggVG
  vnoremap <A-a> mpggVG

" ================================= Tabs / unTabs =====================

  nnoremap <Leader><Tab> mp^<c-v>'ii  <esc>`p
  nnoremap <Leader><A-Tab> mp<home><c-v>'ihx`p 
  nnoremap <A-Tab> vip<c-v>lx
  vnoremap <A-Tab> <c-v>lxv
  nnoremap <Tab> mpvip<c-v>I  <esc>`p
  vnoremap <Tab> <c-v>I<Tab><esc>


" ================================ Shebang ============================

  nnoremap 3r mhggI#!/usr/bin/env ruby<CR><Space>frozen_string_literal: true<CR><Backspace><Backspace><CR><ESC><C-S>a
  nnoremap 3b mhggI#!/bin/bash<esc>`h:w<CR>:e<CR>o<CR>
  nnoremap 3v mhggI#!/usr/local/bin/v<esc>`h:w<CR>:e<CR>o<CR>

" ================================ Utility ============================

  nnoremap ~ :r!
  inoremap kj <esc>l
  inoremap KJ <esc>l
  inoremap fn<Space> fn<Space><c-o>mn()<Space>{<CR><c-o>mf<CR>}<esc>02x`fa<Tab>
  vnoremap kj <esc>l
  vnoremap KJ <esc>l
  nnoremap X :bd!1<CR>
  nnoremap D gg$dT:C<Space><esc>:r!date -u +\%s<CR>kJ:w<CR>
  nnoremap <c-l> :lua vim.lsp.buf.formatting_sync()<CR>
  nnoremap <c-s> :w<CR>:e<CR>
  nnoremap <c-x> :conf q<CR>
  nnoremap <Leader>r :source $MYVIMRC<CR>
  nnoremap <Leader><C-r> :NERDTreeRefreshRoot<CR>
  nnoremap <Leader>R :set nu relativenumber!<CR>
  nnoremap <Leader>q :qa!<CR>
  nnoremap <Leader>% :! ./%<CR>
  nnoremap <Leader>ls :r!project_find<CR>
  nnoremap <Leader>t :tabnew 
  nnoremap <Leader>n :new 
  nnoremap <A-r> :resize 
  nnoremap <A-t> :tabfind 
  nnoremap <A-f> :sfind 
  nnoremap <Leader>col :exe "tabfind " expand(color_file)<CR>
  nnoremap <Leader>key :exe "tabfind " expand(prefix) . "Keymap.vim"<CR>
  nnoremap <Leader>init :exe "tabfind " expand(prefix) . "init.vim"<CR>
  nnoremap <Leader>yml ggO--- #<esc>:r!edate<CR>kJGo...<esc>kA
  nnoremap <Leader>s :w<CR>
  nnoremap <Leader>S :w 

" ================================= Whitespace Toggle =================

  nnoremap <A-p> :set list!<CR>
  vnoremap <A-p> :set list!<CR>

