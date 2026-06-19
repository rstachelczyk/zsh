  # ____ ___  __  __ ____  _     _____ _____ ___ ___  _   _ 
#  / ___/ _ \|  \/  |  _ \| |   | ____|_   _|_ _/ _ \| \ | |
# | |  | | | | |\/| | |_) | |   |  _|   | |  | | | | |  \| |
# | |__| |_| | |  | |  __/| |___| |___  | |  | | |_| | |\  |
#  \____\___/|_|  |_|_|   |_____|_____| |_| |___\___/|_| \_|
 #
 
# =========================================================
# Completion
# =========================================================
zmodload zsh/complist  # Must be before compinit

autoload -Uz compinit
compinit -d "$XDG_CACHE_HOME/zsh/zcompdump"

_comp_options+=(globdots)  # Include hidden files

setopt MENU_COMPLETE      # Auto-select first completion match
setopt AUTO_LIST          # List choices on ambiguous completion
setopt COMPLETE_IN_WORD   # Complete from both ends of a word

# Completers: extensions → exact → fuzzy
zstyle ':completion:*' completer _extensions _complete _approximate

# Caching
zstyle ':completion:*' use-cache on
zstyle ':completion:*' cache-path "$XDG_CACHE_HOME/zsh/.zcompcache"

# Interactive menu
zstyle ':completion:*' menu select

# Case-insensitive + partial matching
zstyle ':completion:*' matcher-list '' 'm:{a-zA-Z}={A-Za-z}' 'r:|[._-]=* r:|=*' 'l:|=* r:|=*'

# Colors matching your LS_COLORS
zstyle ':completion:*:*:*:*:default' list-colors ${(s.:.)LS_COLORS}

# Grouping with headers
zstyle ':completion:*' group-name ''
zstyle ':completion:*:*:-command-:*:*' group-order aliases builtins functions commands
zstyle ':completion:*:*:*:*:descriptions' format '%F{blue}-- %d --%f'
zstyle ':completion:*:*:*:*:warnings'     format '%F{red}-- no matches found --%f'

# hjkl in menu
bindkey -M menuselect 'h' vi-backward-char
bindkey -M menuselect 'k' vi-up-line-or-history
bindkey -M menuselect 'j' vi-down-line-or-history
bindkey -M menuselect 'l' vi-forward-char

