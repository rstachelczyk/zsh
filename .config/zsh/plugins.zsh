# =========================================================
# Plugins
# =========================================================

ZPLUGINDIR="${ZDOTDIR:-$HOME/.config/zsh}/plugins"

_zplugin_load() {
  local plugin_path="${ZPLUGINDIR}/${2}"
  if [[ ! -d "$plugin_path" ]]; then
    mkdir -p "$ZPLUGINDIR"
    echo "Installing ${2}..."
    git clone --depth=1 "https://github.com/${1}/${2}" "$plugin_path" \
      || { echo "ERROR: failed to install ${2}" >&2; return 1; }
  fi
  source "${plugin_path}/${2}.plugin.zsh"
}

zplugin-update() {
  local dir
  for dir in "${ZPLUGINDIR}"/*/; do
    echo "Updating ${dir:t}..."
    git -C "$dir" pull --ff-only
  done
}

_zplugin_load zsh-users zsh-autosuggestions
_zplugin_load zsh-users zsh-history-substring-search
_zplugin_load zdharma-continuum fast-syntax-highlighting
_zplugin_load jeffreytse zsh-vi-mode

# +-------------+
# | ZSH VI MODE |
# +-------------+
ZVM_VI_INSERT_ESCAPE_BINDKEY=jj
ZVM_CURSOR_STYLE_NORMAL=block
ZVM_CURSOR_STYLE_INSERT=beam
ZVM_CURSOR_STYLE_VISUAL=block
ZVM_VI_EDITOR=nvim
ZVM_SYSTEM_CLIPBOARD_ENABLED=true

zvm_after_init() {
  # Ctrl + y to accept zsh ghost text completion
  bindkey '^Y' autosuggest-accept

  # hjkl in completion menu
  bindkey -M menuselect 'h' vi-backward-char
  bindkey -M menuselect 'k' vi-up-line-or-history
  bindkey -M menuselect 'j' vi-down-line-or-history
  bindkey -M menuselect 'l' vi-forward-char
}

# zsh-vi-mode resets keymaps on init, clobbering fzf's bindings.
# Re-source fzf keybindings after zvm finishes initializing.
zvm_after_init_commands+=('source $ZDOTDIR/fzf.zsh')
