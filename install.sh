#! /bin/sh

TIME=`date +%s`

echo "backing up"
mv ~/.vim ~/.vim-$TIME
mv ~/.vimrc ~/.vimrc-$TIME
mv ~/.gvimrc ~/.gvimrc-$TIME

echo "cloning .vim"
git clone https://github.com/tntmarket/vim-config ~/.vim

echo "linking .vimrc and .gvimrc"
ln -s ~/.vim/vimrc ~/.vimrc
ln -s ~/.vim/gvimrc ~/.gvimrc

echo "installing vundle"
mkdir -p ~/.vim/bundle
git clone https://github.com/gmarik/Vundle.vim.git ~/.vim/bundle/Vundle.vim

echo "installing packages"
vim -T dumb -E +BundleInstall! +BundleClean! +VimProcInstall +qall
