source ~/.zshrc.d/loadrc

export PATH="$PATH:/opt/atlassian/bin"

# history setup
HISTFILE=$HOME/.zhistory
SAVEHIST=1000
HISTSIZE=999
setopt share_history 
setopt hist_expire_dups_first
setopt hist_ignore_dups
setopt hist_verify

# completion using arrow keys (based on history)
bindkey '^[[A' history-search-backward
bindkey '^[[B' history-search-forward

# if [ "$TERM_PROGRAM" != "vscode" ]; then
  # source $HOME/.tmux.d/startup.sh 
#fi

source $HOME/.tmux.d/startup.sh

export NVM_DIR="$HOME/.nvm"
[ -s "$NVM_DIR/nvm.sh" ] && \. "$NVM_DIR/nvm.sh"  # This loads nvm
[ -s "$NVM_DIR/bash_completion" ] && \. "$NVM_DIR/bash_completion"  # This loads nvm bash_completion

autoload -U add-zsh-hook
load-nvmrc() {
  local node_version="$(nvm version)"
  local nvmrc_path="$(nvm_find_nvmrc)"

  if [ -n "$nvmrc_path" ]; then
    local nvmrc_node_version=$(nvm version "$(cat "${nvmrc_path}")")

    if [ "$nvmrc_node_version" = "N/A" ]; then
      nvm install
    elif [ "$nvmrc_node_version" != "$node_version" ]; then
      nvm use
    fi
  elif [ "$node_version" != "$(nvm version default)" ]; then
    echo "Reverting to nvm default version"
    nvm use default
  fi
}
add-zsh-hook chpwd load-nvmrc
load-nvmrc

fpath=(~/.zsh/completions $fpath)
autoload -Uz compinit && compinit

export GPG_TTY=$(tty)

export PATH="/Users/phall/.orbit/bin:$PATH"

# Exports required for KITT++
export KUBECONFIG=$(atlas kitt context:create --pid=$$)
export HELM_DRIVER=configmap
export SSH_AUTH_SOCK=/Users/phall/Library/Containers/com.maxgoedjen.Secretive.SecretAgent/Data/socket.ssh

