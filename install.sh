if [ -f ~/.vimrc ]
then
    rm ~/.vimrc
fi
ln -s ~/.vim/init.vim ~/.vimrc
cd ~/.vim
git submodule update --init bundle/Vundle.vim
vim +PluginInstall +qall
cd -
