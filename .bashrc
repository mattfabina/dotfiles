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

alias open='xdg-open'
alias c='clear && clear'
alias ll='ls -lhA --group-directories-first'
alias ..='cd ..'
alias ...='cd .. && cd ..'
alias ....='cd .. && cd .. && cd ..'
alias .....='cd .. && cd .. && cd .. && cd ..'
alias ......='cd .. && cd .. && cd .. && cd .. && cd ..'
alias cll='c && ll'
alias cgs='c && git status'
alias cgd='c && git diff'
alias cgl='c && git log'
alias xclip="tr -d '\n' | xclip -selection clipboard"
alias rsync='rsync --human-readable --info=progress2'

# 'seegap'
alias cgap='c && git add -p'

# 'sigsip'
alias cgcp='c && git checkout -p'

cd () {
  builtin cd "$@" && ll;
}

cdq () {
  builtin cd "$@";
}

mkcd () {
  mkdir "$1" && cd "$1";
}

pcat () {
  cat "$1" | pygmentize | perl -e 'print "\e[38;5;247m".++$i."\e[0m $_" for <>';
}

alias cpcat='c && pcat'

cgrep () {
  c && grep \
      --binary-files=without-match \
      --recursive \
      --line-number \
      --exclude-dir=.git \
      "$1";
}

# vim-like prompt
set -o vi

eval "$(direnv hook bash)"

PS1="${debian_chroot:+($debian_chroot)}\[\033[01;33m\]\h:\w\$ \[\033[0m\]"

# disable built-in virtualenv pre-prompt
VIRTUAL_ENV_DISABLE_PROMPT=1

# enable custom virtualenv pre-prompt
show_virtual_env() {
  if [ -n "$VIRTUAL_ENV" ]; then
    echo "($(basename $VIRTUAL_ENV)) "
  fi
}
export -f show_virtual_env
PS1='$(show_virtual_env)'$PS1

export VISUAL=vim
export EDITOR="$VISUAL"
export OPENBLAS_NUM_THREADS=1
export JOBLIB_START_METHOD='forkserver'
