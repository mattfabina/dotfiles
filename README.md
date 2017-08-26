# Dotfiles

Dot and configuration files repository inspired by
[this](https://news.ycombinator.com/item?id=11071754) HackerNews comment.

## Setup

* `git init --bare $HOME/.dotfiles`
* `alias dotfiles='/usr/bin/git --git-dir=$HOME/.dotfiles/ --work-tree=$HOME`
* `dotfiles config status.showUntrackedFiles no`

Using HTTPS:

* `dotfiles remote add origin https://github.com/mattfabina/dotfiles.git`
* `dotfiles pull origin master`

Using SSH:

* `dotfiles remote add origin git@github.com:mattfabina/dotfiles.git`
* `dotfiles pull origin master`

When pulling you may have to merge/discard some conflicting files.

## Integrated tools

* [Vundle](https://github.com/VundleVim/Vundle.vim)\*
* [direnv](https://direnv.net/)

\* .vimrc assumes vundle is installed at ~/.vim/bundle/vundle/
