dotfiles
========

# how to setup

```hoge.sh
cd
git clone git@github.com:sawakun/dotfiles.git 

ln -s ~/dotfiles/_vimrc ~/.vimrc
ln -s ~/dotfiles/_gvimrc ~/.gvimrc
ln -s ~/dotfiles/_bashrc ~/.bashrc

cd ~/dotfiles
git submodule init
git submodule update
```


