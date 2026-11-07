# Native shell integration (fzf >= 0.48) works the same way regardless of how
# fzf was installed (Homebrew on macOS, pacman on Arch, apt on Ubuntu), so no
# need to branch on hardcoded per-OS/per-arch script paths anymore.
if command -v fzf >/dev/null 2>&1; then
  source <(fzf --zsh)
fi

if command -v fd >/dev/null 2>&1; then
  export FZF_DEFAULT_COMMAND='fd --type f --hidden --strip-cwd-prefix --exclude .git'
elif command -v fdfind >/dev/null 2>&1; then
  # fd is fdfind on Ubuntu (apt package name collision)
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
if command -v bat >/dev/null 2>&1; then
  export _FZF_PREVIEW_CMD='bat --color=always --style=plain,numbers --line-range=:500 {}'
elif command -v batcat >/dev/null 2>&1; then
  # bat is batcat on Ubuntu (apt package name collision)
  export _FZF_PREVIEW_CMD='batcat --color=always --style=plain,numbers --line-range=:500 {}'
fi
export FZF_CTRL_T_OPTS="--preview '$_FZF_PREVIEW_CMD'"

