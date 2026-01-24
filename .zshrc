bindkey -v
export EDITOR=nvim

bindkey "^R" history-incremental-search-backward

alias config='/usr/bin/git --git-dir=$HOME/.cfg/ --work-tree=$HOME'

function zle-keymap-select () {

case $KEYMAP in

vicmd) echo -ne '\e[1 q';; # block

viins|main) echo -ne '\e[5 q';; # beam

esac

}

zle -N zle-keymap-select

zle-line-init() {

zle -K viins # initiate `vi insert` as keymap (can be removed if `bindkey -V` has been set elsewhere)

echo -ne "\e[5 q"

}

zle -N zle-line-init

echo -ne '\e[5 q' # Use beam shape cursor on startup.

preexec() { echo -ne '\e[5 q' ;} # Use beam shape cursor for each new prompt.

# Open notes
alias notes='nvim ~/Code/notes.md'
export PATH="$HOME/.local/bin:$PATH"
  export NVM_DIR="$HOME/.nvm"
  [ -s "/opt/homebrew/opt/nvm/nvm.sh" ] && \. "/opt/homebrew/opt/nvm/nvm.sh"  # This loads nvm
  [ -s "/opt/homebrew/opt/nvm/etc/bash_completion.d/nvm" ] && \. "/opt/homebrew/opt/nvm/etc/bash_completion.d/nvm"  # This loads nvm bash_completion

export PYENV_ROOT="$HOME/.pyenv"
[[ -d $PYENV_ROOT/bin ]] && export PATH="$PYENV_ROOT/bin:$PATH"
eval "$(pyenv init - zsh)"

