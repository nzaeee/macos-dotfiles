
# init starship 
eval "$(starship init zsh)"

# init zoxide
eval "$(zoxide init zsh)"

# activate syntax highlighting
source $(brew --prefix)/share/zsh-syntax-highlighting/zsh-syntax-highlighting.zsh

# acces rust/cargo binaries
export PATH="$HOME/.cargo/bin:$PATH"


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
alias ls="eza"

# replace cd by zoxide
alias cd="z"

# misc
alias cls="clear"
alias cat="bat"

# pnpm
export PNPM_HOME="/Users/hugo/Library/pnpm"
case ":$PATH:" in
  *":$PNPM_HOME:"*) ;;
  *) export PATH="$PNPM_HOME:$PATH" ;;
esac
# pnpm end
