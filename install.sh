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
vim +PlugInstall +qall
cd -
