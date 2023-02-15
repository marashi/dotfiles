#!/bin/sh

# General
alias reload='source ~/.zshrc'
alias ws="cd ~/workspace"
alias dot="cd ~/dotfiles"
alias path='echo -e ${PATH//:/\\n} | fzf'
alias ~="cd ~"
alias update="brew update; brew upgrade; zap update"

alias cat="bat --theme=ansi --style=numbers --color=always" # bat needs to be installed via brew
alias grep="grep --color=auto"
alias ll='exa --long --all --header --icons --git --group-directories-first'
alias cp="cp -i"
alias mv='mv -i'
alias rm='rm -i'

# TMUX
alias t="tmux"
alias ta="t a -t"
alias tls="t ls"
alias tn="t new -t"

# VIM
alias vim="nvim"
alias v="fd --type f --hidden --exclude .git | fzf-tmux -p --reverse --preview 'bat --theme=ansi --style=numbers --color=always --line-range :500 {}' -w 150 | xargs nvim"

# Git
alias g='git'
alias ga='git add'
alias gaa='git add --all'
alias gau='git add --update'
alias gb='git branch'
alias gba='git branch -a'
alias gbl='git blame -b -w'
alias gbnm='git branch --no-merged'
alias gbr='git branch --remote'
alias gc='git commit -v'
alias gc!='git commit -v --amend'
alias gcn='git commit -v --no-edit'
alias gcn!='git commit -v --no-edit --amend'
alias gca='git commit -v -a'
alias gca!='git commit -v -a --amend'
alias gcan!='git commit -v -a --no-edit --amend'
alias gcam='git commit -a -m'
alias gcb='git checkout -b'
alias gf='git fetch'
alias gl='git pull'
alias gm='git merge'
alias gp='git push'
alias gpd='git push --dry-run'
alias lg="lazygit"
alias gpr="get_gh_pr_number | xargs gh pr checkout"
alias gprw="get_gh_pr_number | xargs gh pr view -w"

# Docker
alias ldo="lazydocker"

# NGINX
alias ngx="nvim /usr/local/etc/nginx"
alias ngxr="sudo nginx -s stop; sudo nginx"

function get_gh_pr_number() {
  GH_FORCE_TTY=100% gh pr list | fzf --ansi --preview 'GH_FORCE_TTY=100% gh pr view {1}; gh pr diff {1} | delta --width=$(($(tput cols)/2-8))' --header-lines 3 | awk '{print $1}'
}

