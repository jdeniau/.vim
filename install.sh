echo ':source ~/.vim/.sources/.settings.vimrc' > ~/.vimrc
git submodule update --init bundle/Vundle.vim
vim +PluginInstall +qall
