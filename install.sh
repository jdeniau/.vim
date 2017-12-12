# Remove old vimrc file
if [ -f ~/.vimrc ]
then
    rm ~/.vimrc
fi

# Link vimrc file
## vim
ln -s ~/.vim/init.vim ~/.vimrc
## neovim 
mkdir -p ~/.config/nvim/
ln -s ~/.vim/init.vim ~/.config/nvim/init.vim

cd ~/.vim
git submodule update --init bundle/Vundle.vim
vim +PluginInstall +qall
cd -
