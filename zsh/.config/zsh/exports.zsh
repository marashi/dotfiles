#!/bin/sh

# XDG Paths
export XDG_CONFIG_HOME="$HOME/.config" #base directory relative to which user-specific configuration files should be store
export XDG_DATA_HOME="$HOME/.local/share"
export XDG_CACHE_HOME="$HOME/.cache"

# General
export VISUAL="nvim"
export EDITOR="$VISUAL"
export TERMINAL="alacritty"

# FZF
export FZF_DEFAULT_OPS="--extended"

# N - Node Version Manager
export N_PREFIX=$HOME/.n
export PATH=$N_PREFIX/bin:$PATH

eval "$(zoxide init zsh)"
eval "$(starship init zsh)"

