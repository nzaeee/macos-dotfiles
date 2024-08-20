
# init starship 
eval "$(starship init zsh)"

# init zoxide
eval "$(zoxide init zsh)"

# activate syntax highlighting
source $(brew --prefix)/share/zsh-syntax-highlighting/zsh-syntax-highlighting.zsh

# disable underline
(( ${+ZSH_HIGHLIGHT_STYLES} )) || typeset -A ZSH_HIGHLIGHT_STYLES
ZSH_HIGHLIGHT_STYLES[path]=none
ZSH_HIGHLIGHT_STYLES[path_prefix]=none

# activate autosuggestions
source $(brew --prefix)/share/zsh-autosuggestions/zsh-autosuggestions.zsh

# Set up fzf key bindings and fuzzy completion
source <(fzf --zsh)

# aliases
# replace ls by eza
alias ls="eza"

# replace cd by zoxide
alias cd="z"

# misc
alias cls="clear"
alias cat="bat"
