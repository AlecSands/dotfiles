# Dotfiles

Managed using the **bare repository** method.

### Quick Setup on a new machine:
1. `alias config='/usr/bin/git --git-dir=$HOME/.cfg/ --work-tree=$HOME'`
2. `git clone --bare git@github.com:AlecSands/dotfiles.git $HOME/.cfg`
3. `config config --local status.showUntrackedFiles no`
4. `config checkout`
