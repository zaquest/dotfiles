base=$(dirname $0)
base=$(readlink -f $base)
zaquest=$(eval echo "~zaquest")

mkdir -p $HOME/.config
ln -sfT $zaquest/.config/nvim $HOME/.config/nvim
ln -sf $zaquest/.dircolors $HOME/.dircolors
ln -sf $zaquest/.inputrc $HOME/.inputrc

mkdir -p $HOME/.zsh
cp $base/_zsh/spectrum $HOME/.zsh
cp $base/_zsh/prompt_root_setup $HOME/.zsh
cp $base/_zshrc_root $HOME/.zshrc
