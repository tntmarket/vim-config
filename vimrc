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

Plug 'Valloric/YouCompleteMe', { 'do': 'python2 install.py' }

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

Plug 'lukerandall/haskellmode-vim', { 'for': 'haskell' }
Plug 'enomsg/vim-haskellConcealPlus', { 'for': 'haskell' }
Plug 'neovimhaskell/haskell-vim', { 'for': 'haskell' }
Plug 'eagletmt/neco-ghc', { 'for': 'haskell' }
Plug 'eagletmt/ghcmod-vim', { 'for': 'haskell' }

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

