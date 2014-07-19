echo ':source ~/.vim/.sources/.settings.vimrc' > ~/.vimrc
git submodule update bundle/Vundle.vim
vim +PluginInstall +qall
