#! /bin/sh

TIME=`date +%s`

# backup
mv ~/.vim ~/.vim-$TIME
mv ~/.vimrc ~/.vimrc-$TIME
mv ~/.gvimrc ~/.gvimrc-$TIME

git clone https://github.com/tntmarket/vim-config ~/.vim

# install vundle
mkdir -p ~/.vim/bundle
git clone https://github.com/gmarik/Vundle.vim.git ~/.vim/bundle/Vundle.vim

# install packages
vim -T dumb +BundleInstall! +BundleClean! +qall

# make vimproc
cd ~/.vim/bundle/vimproc.vim/
make

ln -s ~/.vim/vimrc ~/.vimrc
ln -s ~/.vim/gvimrc ~/.gvimrc
