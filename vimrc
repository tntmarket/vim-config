filetype off

set nocompatible
call plug#begin('~/.vim/plugged')

Plug 'Shougo/vimproc.vim', { 'do': 'make' }

Plug 'scrooloose/syntastic'

Plug 'tpope/vim-commentary'
   autocmd FileType matlab set commentstring=%\ %s

Plug 'junegunn/vim-easy-align'
   vmap <Enter> <Plug>(EasyAlign)
   nmap ga <Plug>(EasyAlign)
   let g:easy_align_delimiters = {'$': { 'pattern': '\$' } }

Plug 'michaeljsmith/vim-indent-object'
Plug 'terryma/vim-multiple-cursors'

Plug 'Lokaltog/vim-easymotion'
   map <C-f> <Plug>(easymotion-s)

Plug 'scrooloose/nerdtree'
   " Close nerdtree after a file is selected
   let NERDTreeQuitOnOpen = 1

   function! IsNERDTreeOpen()
     return exists("t:NERDTreeBufName") && (bufwinnr(t:NERDTreeBufName) != -1)
   endfunction

   function! ToggleFindNerd()
     if IsNERDTreeOpen()
       exec ':NERDTreeToggle'
     else
       exec ':NERDTreeFind'
     endif
   endfunction
   noremap <silent> <F3> :call ToggleFindNerd()<CR>

Plug 'vim-scripts/Gundo'
   noremap <silent> <F4> :GundoToggle<CR>

Plug 'junegunn/fzf', { 'dir': '~/.fzf', 'do': 'yes \| ./install' }

Plug 'majutsushi/tagbar'
   noremap <silent> <F7> :TagbarToggle<CR>
   let g:tagbar_type_haskell = {
       \ 'ctagsbin'  : 'hasktags',
       \ 'ctagsargs' : '-x -c -o-',
       \ 'kinds'     : [
           \  'm:modules:0:1',
           \  'd:data: 0:1',
           \  'd_gadt: data gadt:0:1',
           \  't:type names:0:1',
           \  'nt:new types:0:1',
           \  'c:classes:0:1',
           \  'cons:constructors:1:1',
           \  'c_gadt:constructor gadt:1:1',
           \  'c_a:constructor accessors:1:1',
           \  'ft:function types:1:1',
           \  'fi:function implementations:0:1',
           \  'o:others:0:1'
       \ ],
       \ 'sro'        : '.',
       \ 'kind2scope' : {
           \ 'm' : 'module',
           \ 'c' : 'class',
           \ 'd' : 'data',
           \ 't' : 'type'
       \ },
       \ 'scope2kind' : {
           \ 'module' : 'm',
           \ 'class'  : 'c',
           \ 'data'   : 'd',
           \ 'type'   : 't'
       \ }
   \ }


Plug 'Valloric/YouCompleteMe', { 'do': 'python install.py --clang-completer --tern-completer' }
   let g:ycm_server_python_interpreter = "/usr/bin/python3"

Plug 'bling/vim-airline'
   let g:airline_left_sep = ''
   let g:airline_left_alt_sep = ''
   let g:airline_right_sep = ''
   let g:airline_right_alt_sep = ''
   set laststatus=2

Plug 'altercation/vim-colors-solarized'

Plug 'tpope/vim-fugitive'
Plug 'int3/vim-extradite'
Plug 'vim-scripts/gitignore'

Plug 'enomsg/vim-haskellConcealPlus', { 'for': 'haskell' }
Plug 'neovimhaskell/haskell-vim', { 'for': 'haskell' }
Plug 'eagletmt/ghcmod-vim', { 'for': 'haskell' }
Plug 'eagletmt/neco-ghc', { 'for': 'haskell' }
Plug 'mpickering/hlint-refactor-vim', { 'for': 'haskell' }
Plug 'Twinside/vim-hoogle', { 'for': 'haskell' }

Plug 'ElmCast/elm-vim', { 'for': 'elm' }
   let g:elm_syntastic_show_warnings = 1
   let g:elm_format_autosave = 1

Plug 'jgdavey/tslime.vim'
Plug 'christoomey/vim-tmux-navigator'

call plug#end()
filetype plugin indent on

source $HOME/.vim/generic.vim
source $HOME/.vim/color.vim
source $HOME/.vim/git.vim
source $HOME/.vim/tmux.vim
source $HOME/.vim/haskell.vim
" source $HOME/.home.vim

