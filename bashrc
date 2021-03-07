# If not running interactively, don't do anything
[[ $- != *i* ]] && return

export XDG_CACHE_HOME="$HOME/.cache"
export XDG_CONFIG_HOME="$HOME/.config"
export XDG_DATA_HOME="$HOME/.local/share"
export XAUTHORITY="$XDG_RUNTIME_DIR/Xauthority"
export XINITRC="$XDG_CONFIG_HOME/X11/xinitrc"

export LESSHISTFILE=/dev/null
unset HISTFILE

export EDITOR=nvim
export TERMINAL=alacritty
export BROWSER=firefox

alias cat='cat -s'
alias docker='sudo docker'
alias grep='grep --color=auto'
alias i3lock='i3lock --color 000000'
alias kubectl='sudo kubectl'
alias la='ls -AhF'
alias ll='ls -lAhF'
alias ls='ls --color=auto'
alias ma='cmatrix -abC blue -u 5 && clear'
alias mvnit='mvn clean spring-boot:run'
alias pac='sudo pacman --noconfirm --color=always'
alias ssn='shutdown now'
alias tree="tree -CashI 'node_modules|.git' --du --filelimit 100"
alias xc='xsel -ib'
alias xp='xsel -ob'
# git gud
alias gac='git add . && git commit -m'
alias gb='git branch -av'
alias gcl='git clone'
alias gco='git checkout'
alias gl='git log --graph --date=short'
alias gp='git push'
alias gpl='git pull'
alias grmc='git rm --cached'
alias gs='git status'
# Playtime!
alias jtest='javac JavaPlay.java -d build/ && java -cp build/ JavaPlay'
alias cpptest='g++ cpplay.cpp -o build/cpplay && ./build/cpplay'
alias tstest='tsc && node build/ts_play.js'

PS1='\w '

