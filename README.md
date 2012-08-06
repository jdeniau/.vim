.vim
====

my vim configuration

You just have to put this in your **~/.vimrc**
```vi
:source ~/.vim/.sources/.settings.vimrc
```

I use vim-script [taglist](https://github.com/vim-scripts/taglist.vim.git), so I have to generate my project taglist using this command : 
```sh
#!/bin/bash
cd ~/path-to-my-projects-home/
exec ctags-exuberant -f ~/.vim/tags \
-h \".php,.twig,.html,.yml\" -R \
--exclude=\"\.svn\" \
--exclude=\"\.git\" \
--exclude=\"\.gitignore\" \
--totals=yes \
--links=no \
--tag-relative=yes \
--PHP-kinds=+cfiv \
--regex-PHP='/abstract class ([^ ]*)/\1/c/' \
--regex-PHP='/interface ([^ ]*)/\1/c/' \
--regex-PHP='/(public |static |abstract |protected |private )+(final\s+)?function ([^ (]*)/\3/f/'
--extra=+f
--langdef=twig
--langmap=twig:.html.twig.xml.yml
```
