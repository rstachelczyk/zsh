# macOS / Homebrew (Apple Silicon)
if [[ -f /opt/homebrew/opt/fzf/shell/key-bindings.zsh ]]; then
  source /opt/homebrew/opt/fzf/shell/key-bindings.zsh
  source /opt/homebrew/opt/fzf/shell/completion.zsh
fi

# Arch
if [[ -f /usr/share/fzf/key-bindings.zsh ]]; then
  source /usr/share/fzf/key-bindings.zsh
  source /usr/share/fzf/completion.zsh
fi

# Ubuntu
if [[ -f /usr/share/doc/fzf/examples/key-bindings.zsh ]]; then
  source /usr/share/doc/fzf/examples/key-bindings.zsh
  source /usr/share/doc/fzf/examples/completion.zsh
fi

if command -v fd >/dev/null 2>&1; then
  export FZF_DEFAULT_COMMAND='fd --type f --hidden --strip-cwd-prefix --exclude .git'
elif command -v fdfind >/dev/null 2>&1; then
  # fd is fdfind on Ubuntu
  export FZF_DEFAULT_COMMAND='fdfind --type f --hidden --strip-cwd-prefix --exclude .git'
fi

# Ctrl T uses fd
export FZF_CTRL_T_COMMAND="$FZF_DEFAULT_COMMAND"

# Compact UI
export FZF_DEFAULT_OPTS="
  --height 40%
  --layout reverse
  --border
"

# Ctrl T use bat for preview window 
export _FZF_PREVIEW_CMD='bat --color=always --style=plain,numbers --line-range=:500 {}'
export FZF_CTRL_T_OPTS="--preview '$_FZF_PREVIEW_CMD'"

