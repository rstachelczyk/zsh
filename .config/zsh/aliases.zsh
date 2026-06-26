# +-----+
# | Zsh |
# +-----+

# alias d='dirs -v'
# Navigate to recent directories easier
# alias d="dirs -v"
# for index ({1..9}) alias "$index"="cd +${index}"; unset index
#
# Note: Zoxide just handles this functiolity but better

# +----+
# | ls |
# +----+

#alias ls="gls --group-directories-first --color=auto -GF"
#alias ll='ls -lah'
#alias lt='ls -latrh'
#alias la='ls -a'

# Better ls
alias ls='eza --icons --group-directories-first --color=auto'

# Detailed listing
alias ll='ls -lh --git'

# Detailed listing including hidden files
alias lsa='ls -lah --git'
alias la='lsa'

alias lt='lsa --sort=modified -r'

# Tree view
alias tree='ls --tree'


# Reuse ls completions for eza (avoids defining a separate completion function)
compdef eza=ls

# +----+
# | cp |
# +----+

alias cp='cp -iv'

# +----+
# | mv |
# +----+

alias mv='mv -iv'

# +----+
# | rm |
# +----+

alias rm='rm -iv'

# +------+
# | grep |
# +------+

#alias grep="grep --color=auto"
alias grep='rg --color=auto'

# +------------+
# | Core Utils |
# +------------+
alias diff='diff --color=auto'
alias df='df -h'

# +------+
# | nvim |
# +------+

alias vim="nvim"
alias vi="nvim"
alias oldvim="vim"

# +--------+
# | DOCKER |
# +--------+

alias dcu="docker compose up -d"
alias dcd="docker compose down"
alias dce="docker compose exec -it"
alias dcr="docker compose run --rm"
alias dlogs="docker compose logs -f"
dspec() {
  docker compose exec $1 bundle exec rspec $2
}
# Examples:
# dce vault bash
# dcr vault bundle
# dlogs
# dlogs vault
# dspec vault (runs all specs)
# dspec vault spec/xyz/abc/blah_spec.rb

# +------------+
# | Networking |
# +------------+

alias tcurl='curl -w "\nTime to connect (TCP Handshake): %{time_connect}s\nTime to start transfer (Including server execution time): %{time_starttransfer}s\nTotal time: %{time_total}s\n"'

# +------+
# | tmux |
# +------+

alias tmuxk='tmux kill-session -t'
alias tmuxa='tmux attach -t'
alias tmuxl='tmux list-sessions'

# +----------+
# | Personal |
# +----------+

# Folders
alias work="$HOME/code"
alias doc="$HOME/Documents"
alias dow="$HOME/Downloads"
alias dot="$HOME/dotfiles"
alias ic="$HOME/Library/Mobile\ Documents/iCloud~md~obsidian/Documents"

alias aliases="bat $HOME/dotfiles/zsh/.config/zsh/aliases.zsh"

