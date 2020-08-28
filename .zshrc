source /usr/local/share/antigen/antigen.zsh

export ENV=development
export PROJECT_HOME=$HOME/Sites
export PATH="/Users/natebailey/bin:$PATH"
export PATH="$PATH:`yarn global bin`"
export PATH="$PATH:/usr/local/bin"

# Aliases
alias dc="docker-compose"
alias ls="pwd; ls -la -G"
alias dps="docker ps"
alias dcl="docker-compose logs -f --tail='100'"
alias szs="source ~/.zshrc"
alias dl="docker logs -f"
alias gs="git status"
alias gd="git diff"
alias gl="git lg"

# Bundles from the default repo (robbyrussell's oh-my-zsh).
antigen bundle z
antigen bundle zsh-users/zsh-autosuggestions
antigen bundle zsh-users/zsh-syntax-highlighting

# Tell antigen that you're done.
antigen apply

# Set Pure as the prompt
autoload -U promptinit; promptinit
prompt pure

# FZF config
export FZF_DEFAULT_COMMAND='ag -g ""'

# NVM config
export NVM_DIR="$HOME/.nvm"
[ -s "$NVM_DIR/nvm.sh" ] && \. "$NVM_DIR/nvm.sh"  # This loads nvm
[ -s "$NVM_DIR/bash_completion" ] && \. "$NVM_DIR/bash_completion"  # This loads nvm bash_completion

# PHP site config
export PATH="/usr/local/opt/mysql@5.7/bin:$PATH"
export PATH="$(composer global config --absolute bin-dir):$PATH"
