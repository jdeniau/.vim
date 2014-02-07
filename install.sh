echo ':source ~/.vim/.sources/.settings.vimrc' > ~/.vimrc
git submodule update
vim +BundleInstall +qall
