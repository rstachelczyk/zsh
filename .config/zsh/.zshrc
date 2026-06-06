# Add homebrew to PATH
eval "$(/opt/homebrew/bin/brew shellenv)"
eval "$(zoxide init zsh)"

# ---------- Starship ----------
export STARSHIP_CONFIG="$ZDOTDIR/starship.toml"
eval "$(starship init zsh)"

if command -v mise &> /dev/null; then
  eval "$(mise activate zsh)"
fi

# +---------+
# | HISTORY |
# +---------+
#
export HISTFILE="$XDG_STATE_HOME/zsh/history"       # History filepath
export HISTSIZE=10000            # Maximum events for internal history
export SAVEHIST=10000            # Maximum events in history file

setopt EXTENDED_HISTORY          # Write the history file in the ':start:elapsed;command' format.
setopt SHARE_HISTORY             # Share history between all sessions.
setopt HIST_EXPIRE_DUPS_FIRST    # Expire a duplicate event first when trimming history.
setopt HIST_IGNORE_DUPS          # Do not record an event that was just recorded again.
setopt HIST_IGNORE_ALL_DUPS      # Delete an old recorded event if a new event is a duplicate.
setopt HIST_FIND_NO_DUPS         # Do not display a previously found event.
setopt HIST_IGNORE_SPACE         # Do not record an event starting with a space.
setopt HIST_SAVE_NO_DUPS         # Do not write a duplicate event to the history file.
setopt HIST_VERIFY               # Do not execute immediately upon history expansion.

# +--------+
# | COLORS |
# +--------+

# Override colors
# eval "$(dircolors -b $ZDOTDIR/dircolors)"

# Enable for Linux:
#export LS_COLORS="Exfxcxdxbxegedabagacad"
export LS_COLORS="di=0;34:ex=0;33:ln=0;36"

# +-----------+
# | VI KEYMAP |
# +-----------+

# Vi mode
#bindkey -v
bindkey -M viins 'jj' vi-cmd-mode
#export KEYTIMEOUT=10

# Change cursor
VI_MODE_RESET_PROMPT_ON_MODE_CHANGE=true
VI_MODE_SET_CURSOR=true
#source "$DOTFILES/zsh/plugins/cursor_mode"

# Add Vi text-objects for brackets and quotes
autoload -Uz select-bracketed select-quoted
zle -N select-quoted
zle -N select-bracketed
for km in viopp visual; do
  bindkey -M $km -- '-' vi-up-line-or-history
  for c in {a,i}${(s..)^:-\'\"\`\|,./:;=+@}; do
    bindkey -M $km $c select-quoted
  done
  for c in {a,i}${(s..)^:-'()[]{}<>bB'}; do
    bindkey -M $km $c select-bracketed
  done
done

# Emulation of vim-surround
# autoload -Uz surround
# zle -N delete-surround surround
# zle -N add-surround surround
# zle -N change-surround surround
# bindkey -M vicmd cs change-surround
# bindkey -M vicmd ds delete-surround
# bindkey -M vicmd ys add-surround
# bindkey -M visual S add-surround

# if mode indicator wasn't setup by theme, define default, we'll leave INSERT_MODE_INDICATOR empty by default
#if [[ -z "$MODE_INDICATOR" ]]; then
#  MODE_INDICATOR='%B%F{red}<%b<<%f'
#fi

#function vi_mode_prompt_info() {
#  echo "${${VI_KEYMAP/vicmd/$MODE_INDICATOR}/(main|viins)/$INSERT_MODE_INDICATOR}"
#}

# define right prompt, if it wasn't defined by a theme
#if [[ -z "$RPS1" && -z "$RPROMPT" ]]; then
#  RPS1='$(vi_mode_prompt_info)'
#fi

# +------------+
# | COMPLETION |
# +------------+

source $ZDOTDIR/completion.zsh
# autoload -Uz $DOTFILES/zsh/plugins/kubectl-completion/zsh-kubectl-completion

# Git Branch Autocomplete
autoload -Uz compinit && compinit

source /opt/homebrew/share/zsh-syntax-highlighting/zsh-syntax-highlighting.zsh

# +---------+
# | ALIASES |
# +---------+

source $ZDOTDIR/aliases.zsh

# +------------------------+
# | LOCAL MACHINE INSTALLS |
# +------------------------+

source $ZDOTDIR/local.zsh

