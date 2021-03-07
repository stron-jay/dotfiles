# If not running interactively, don't do anything
[[ $- != *i* ]] && return

export XDG_CACHE_HOME="$HOME/.cache"
export XDG_CONFIG_HOME="$HOME/.config"
export XDG_DATA_HOME="$HOME/.local/share"
export XAUTHORITY="$XDG_RUNTIME_DIR/Xauthority"
export XINITRC="$XDG_CONFIG_HOME/X11/xinitrc"

export LESSHISTFILE=/dev/null
unset HISTFILE

export EDITOR=vim
export TERMINAL=alacritty
export BROWSER=firefox

alias cat='cat -s'
alias docker='sudo docker'
alias i3lock='i3lock --color 000000'
alias kubectl='sudo kubectl'
alias ls='ls --color=auto'
alias la='ls -AhF'
alias ll='ls -lAhF'
alias grep='grep --color=auto'
alias pac='sudo pacman --noconfirm --color=always'
alias ssn='shutdown now'
alias tree="tree -CashI 'node_modules|.git' --du --filelimit 100"
alias xc='xsel -ib'
alias xp='xsel -ob'
# git gud
alias gac='git add . && git commit -m'
alias gcl='git clone'
alias gco='git checkout'
alias gl='git log --graph --date=short'
alias gp='git push'
alias gpl='git pull'
alias gs='git status'

PS1='\w '

