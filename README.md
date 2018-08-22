# Dotfile README

dotfiles to be included in `$HOME` or `$HOME/.ssh`, using:

`ln -sf <original> <link>`


```
ln -sf $PWD/bashrc $HOME/.bashrc
ln -sf $PWD/bash_aliases $HOME/.bash_aliases
ln -sf $PWD/bash_nedap $HOME/.bash_nedap
ln -sf $PWD/bash_git $HOME/.bash_git
ln -sf $PWD/git-completion.bash $HOME/.git-completions.bash
ln -sf $PWD/gitconfig $HOME/.gitconfig
ln -sf $PWD/ssh_config $HOME/.ssh/config
ln -sf $PWD/csshrc_cluster $HOME/.clusterssh/clusters
ln -sf $PWD/inputrc $HOME/.inputrc
```
