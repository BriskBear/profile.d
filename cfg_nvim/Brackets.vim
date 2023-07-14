" ================================= Insert Shortcuts ==================

  inoremap {<cr> {<cr>}<c-o><s-o>
  inoremap [<cr> [<cr>]<c-o><s-o>
  inoremap (<cr> (<cr>)<c-o>  
  inoremap ((<space> (  )<c-o>F 
  inoremap [[<space> [[  ]]<c-o>F 
  inoremap {{<space> {  }<c-o>F 
  inoremap <<<space> <  ><c-o>F 
  inoremap "" ""<esc>F"a
  inoremap '' ''<esc>F'a
  inoremap `` ``<esc>F`a
  inoremap ('( ('')<esc>F'a
  inoremap (( ()<esc>F(a
  inoremap [[ []<esc>F[a
  inoremap {{ {}<esc>F{a
  inoremap << <><esc>F<a
  inoremap <%= <%=<space><space>%><c-o>F 
  inoremap <%<space> <%<space><space>%><c-o>F 
  inoremap \" \"\"<esc>F"a
  inoremap (s <esc>lmh`>a)<c-o>`h(  
  inoremap {s <esc>lmh`>a}<c-o>`h{  
  inoremap [s <esc>lmh`>a]<c-o>`h[  
  inoremap "s <esc>lmh`>a"<c-o>`h"  
  inoremap 's <esc>lmh`>a'<c-o>`h'  
  inoremap `s <esc>lmh`>a`<c-o>`h`  
  nnoremap <Leader>" mh/"<CR>x?"<CR>x`hh
  nnoremap <Leader>' mh/'<CR>x?'<CR>x`hh
  nnoremap <Leader>` mh/`<CR>x?`<CR>x`hh
  nnoremap <Leader>( mh/)<CR>x?(<CR>x`hh
  nnoremap <Leader>{ mh/}<CR>x?{<CR>x`hh
  nnoremap <Leader>[ mh/]<CR>x?[<CR>x`hh
  nnoremap <Leader>< mh/><CR>x?<<CR>x`hh

" ================================= Visual Wrappers ==================

  vnoremap s' <esc>`>a'<c-o>`<'<esc>v`>l
  vnoremap s" <esc>`>a"<c-o>`<"<esc>v`>l
  vnoremap s` <esc>`>a`<c-o>`<`<esc>v`>l
  vnoremap s[ <esc>`>a]<c-o>`<[<esc>v`>l
  vnoremap s( <esc>`>a)<c-o>`<(<esc>v`>l
  vnoremap s{ <esc>`>a}<c-o>`<{<esc>v`>l

