#!/bin/zsh

base=$(dirname $0)
base=$(readlink -f $base)

ln -sf $base/_xprofile $HOME/.xprofile
ln -sf $base/_Xresources $HOME/.Xresources
ln -sf $base/_tmux.conf $HOME/.tmux.conf
ln -sfT $base/_zsh $HOME/.zsh
ln -sf $base/_zshrc $HOME/.zshrc
ln -sf $base/_dircolors $HOME/.dircolors
ln -sf $base/_gitconfig $HOME/.gitconfig
ln -sf $base/_gtkrc-2.0 $HOME/.gtkrc-2.0
ln -sf $base/_pathrc $HOME/.pathrc
mkdir -p $HOME/.config/nvim/bundle
ln -sf $base/neo.vim $HOME/.config/nvim/init.vim
if [[ ! -d "$HOME/.config/nvim/bundle/Vundle.vim" ]]; then
  git clone https://github.com/VundleVim/Vundle.vim.git $HOME/.config/nvim/bundle/Vundle.vim
fi
mkdir -p $HOME/.config/fontconfig
ln -sf $base/fonts.conf $HOME/.config/fontconfig/
mkdir -p $HOME/.themes
rm -rf $HOME/.themes/Awesome > /dev/null 2>&1
tar xjf $base/gtk2-awesome.tar.bz2 -C $HOME/.themes

bin=$HOME/.local/bin
mkdir -p $bin
ln -sf $base/bin/term $bin/term
ln -sf $base/bin/diff $bin/diff
