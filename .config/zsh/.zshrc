# Add homebrew to PATH
eval "$(/opt/homebrew/bin/brew shellenv)"
eval "$(zoxide init zsh --cmd cd)"

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

# +-----+
# | FZF |
# +-----+

source $ZDOTDIR/fzf.zsh

# +---------+
# | PLUGINS |
# +---------+

source $ZDOTDIR/plugins.zsh

# +------------+
# | COMPLETION |
# +------------+

source $ZDOTDIR/completion.zsh

# +---------+
# | ALIASES |
# +---------+

source $ZDOTDIR/aliases.zsh

# +------------------------+
# | LOCAL MACHINE INSTALLS |
# +------------------------+

if [ -f $ZDOTDIR/local.zsh ]; then
  source $ZDOTDIR/local.zsh
fi

# +--------+
# | COLORS |
# +--------+

# Override colors
# eval "$(dircolors -b $ZDOTDIR/dircolors)"

# Enable for Linux:
#export LS_COLORS="Exfxcxdxbxegedabagacad"
export LS_COLORS="di=0;34:ex=0;33:ln=0;36"


