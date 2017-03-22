rm ~/.vimrc
ln -s ~/.vim/init.vim ~/.vimrc
git submodule update --init bundle/Vundle.vim
vim +PluginInstall +qall
