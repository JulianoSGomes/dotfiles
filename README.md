# Getting started
```shell
$ git init --bare $HOME/.dotfiles
$ alias config='/usr/bin/git --git-dir=$HOME/.dotfiles/ --work-tree=$HOME'
$ config config --local status.showUntrackedFiles no
$ config remote add origin git@github.com:JulianoSGomes/dotfiles.git
$ config pull origin master
```
