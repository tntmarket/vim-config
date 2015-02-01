filetype off

" General {{{
set nocompatible
set rtp+=~/.vim/bundle/Vundle.vim/
call vundle#rc()

Bundle 'gmarik/Vundle.vim'

Bundle 'vim-scripts/Conque-Shell'
Bundle 'Shougo/vimproc.vim'

Bundle 'scrooloose/syntastic'

Bundle 'tpope/vim-commentary'
Bundle 'godlygeek/tabular'
Bundle 'michaeljsmith/vim-indent-object'
Bundle 'terryma/vim-multiple-cursors'
Bundle 'Lokaltog/vim-easymotion'
   map <C-f> <Plug>(easymotion-s)

Bundle 'scrooloose/nerdtree'
Bundle 'jistr/vim-nerdtree-tabs'
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

Bundle 'vim-scripts/Gundo'
   noremap <silent> <F4> :GundoToggle<CR>

Bundle 'majutsushi/tagbar'
   noremap <silent> <F7> :TagbarToggle<CR>

Bundle 'Lokaltog/vim-powerline'
   let g:Powerline_symbols = 'fancy'
   set laststatus=2   " Always show the statusline

source $HOME/.vim/generic.vim
source $HOME/.vim/color.vim
source $HOME/.vim/git.vim
source $HOME/.vim/tmux.vim

