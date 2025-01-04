# Add deno completions to search path
if [[ ":$FPATH:" != *":/Users/hugo/.zsh/completions:"* ]]; then export FPATH="/Users/hugo/.zsh/completions:$FPATH"; fi

# init starship 
eval "$(starship init zsh)"

# init zoxide
eval "$(zoxide init zsh)"

# activate syntax highlighting
source $(brew --prefix)/share/zsh-syntax-highlighting/zsh-syntax-highlighting.zsh

# acces rust/cargo binaries
export PATH="$HOME/.cargo/bin:$PATH"

# ignore duplicates in history
setopt HIST_IGNORE_ALL_DUPS

# disable underline
(( ${+ZSH_HIGHLIGHT_STYLES} )) || typeset -A ZSH_HIGHLIGHT_STYLES
ZSH_HIGHLIGHT_STYLES[path]=none
ZSH_HIGHLIGHT_STYLES[path_prefix]=none

# activate autosuggestions
source $(brew --prefix)/share/zsh-autosuggestions/zsh-autosuggestions.zsh

# Set up fzf key bindings and fuzzy completion
source <(fzf --zsh)

# open tmux by default
if command -v tmux &> /dev/null; then
  tmux attach || tmux
fi

# aliases
# replace ls by eza
alias ls="eza -a"

# replace cd by zoxide
alias cd="z"

# view history using fzf
alias h="history 1 | fzf"

# misc
alias cls="clear"
alias cat="bat"

# let's be family friendly
alias f="fuck"

# alias for when sketchybar crashes
alias sb="brew services restart sketchybar"

# git 
alias g="git"
alias lg="lazygit"

# pnpm
export PNPM_HOME="/Users/hugo/Library/pnpm"
case ":$PATH:" in
  *":$PNPM_HOME:"*) ;;
  *) export PATH="$PNPM_HOME:$PATH" ;;
esac
# pnpm end
. "/Users/hugo/.deno/env"
# Initialize zsh completions (added by deno install script)
autoload -Uz compinit
compinit
export PATH=$PATH:/Users/hugo/.spicetify

eval $(thefuck --alias)
