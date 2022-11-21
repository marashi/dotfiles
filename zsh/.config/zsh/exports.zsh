#!/bin/sh

# XDG Paths
export XDG_CONFIG_HOME="$HOME/.config" #base directory relative to which user-specific configuration files should be store
export XDG_DATA_HOME="$HOME/.local/share"
export XDG_CACHE_HOME="$HOME/.cache"

# General
export VISUAL="nvim"
export EDITOR="$VISUAL"
export TERMINAL="alacritty"

export FZF_DEFAULT_OPS="--extended"

eval "$(zoxide init zsh)"
eval "$(starship init zsh)"

