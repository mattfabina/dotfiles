# If not running interactively, don't do anything
case $- in
    *i*) ;;
      *) return;;
esac

# append to the history file with larger than default sizes
shopt -s histappend
HISTSIZE=1000
HISTFILESIZE=2000

# update LINES and COLUMNS based on window size after each command
shopt -s checkwinsize

# make less more friendly for non-text input files, see lesspipe(1)
[ -x /usr/bin/lesspipe ] && eval "$(SHELL=/bin/sh lesspipe)"

# color aliases
if [ -x /usr/bin/dircolors ]; then
    test -r ~/.dircolors && eval "$(dircolors -b ~/.dircolors)" || eval "$(dircolors -b)"
    alias ls='ls --color=auto'
    alias grep='grep --color=auto'
    alias fgrep='grep --color=auto'
    alias egrep='egrep --color=auto'
fi

# convenient alert
alias alert='notify-send --urgency=low -i "$([ $? = 0 ] && echo terminal || echo error)" "$(history|tail -n1|sed -e '\''s/^\s*[0-9]\+\s*//;s/[;&|]\s*alert$//'\'')"'

# programmable completion
if ! shopt -oq posix; then
  if [ -f /usr/share/bash-completion/bash_completion ]; then
    . /usr/share/bash-completion/bash_completion
  elif [ -f /etc/bash_completion ]; then
    . /etc/bash_completion
  fi
fi

alias dotfiles='/usr/bin/git --git-dir=$HOME/.dotfiles/ --work-tree=$HOME'

alias c='clear && clear'
alias ll='ls -lhA --group-directories-first'
alias ..='cd ..'
alias open='xdg-open'

cd () {
  builtin cd "$@" && ll;
}

cdq () {
  builtin cd "$@"
}

mkcd () {
  mkdir "$1" && cd "$1";
}

pybootstrap() {
  virtualenv --python=python3.5 venv;
  source venv/bin/activate;
  pip install -r requirements/requirements.txt;
  deactivate;
  echo "source venv/bin/activate" >> .envrc;
  direnv allow .;
}

# vim-like prompt
set -o vi

eval "$(direnv hook bash)"
