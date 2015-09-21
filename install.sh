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

echo "installing vim-plug"
curl -fLo ~/.vim/autoload/plug.vim --create-dirs \
   https://raw.githubusercontent.com/junegunn/vim-plug/master/plug.vim

echo "installing packages"
vim -T dumb +PlugInstall! +PlugClean! +qall -
