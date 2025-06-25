source $(brew --prefix)/share/antigen/antigen.zsh

# Load the oh-my-zsh's library.
antigen use oh-my-zsh

# load plugins
antigen bundle git
#antigen bundle node
#antigen bundle npm
antigen bundle zsh-users/zsh-autosuggestions
antigen bundle zdharma-continuum/fast-syntax-highlighting
#antigen bundle djui/alias-tips

# Load the theme.
# antigen theme robbyrussell
# antigen theme agnoster

# Tell Antigen that you're done
antigen apply
 
eval "$(starship init zsh)"
