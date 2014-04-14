echo ':source ~/.vim/.sources/.settings.vimrc' > ~/.vimrc
git submodule update bundle/vundle
vim +BundleInstall +qall
