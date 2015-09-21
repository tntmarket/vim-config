set vb t_vb=

" Set extra options when running in GUI mode
" if has('gui_running')
   set guioptions=ait
   set guifont=Inconsolata-dz\ for\ Powerline\ Medium\ 10
   set guitablabel=%M\ %t
" endif
set t_Co=256

set guicursor=n-v-c:block-Cursor
set guicursor+=n-v-c:blinkon0

noremap <silent> <F11> :call system("wmctrl -ir " . v:windowid . " -b toggle,fullscreen")<CR>

