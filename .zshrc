DOTFILES_DIR="/Users/Shared/dotfiles"

source $DOTFILES_DIR/antigen/antigen.zsh

export ENV=development
export PROJECT_HOME=$HOME/Sites
export PATH="/Users/nathanbailey/bin:$PATH"
export PATH="$PATH:`yarn global bin`"
export PATH="$PATH:/usr/local/bin"

# Aliases
alias dc="docker-compose"
alias st="subl"
alias ls="pwd; ls -la -G"
alias dps="docker ps"
alias szs="source ~/.zshrc"
alias dl="docker logs -f"

# Load the oh-my-zsh's library.
antigen use oh-my-zsh

# Bundles from the default repo (robbyrussell's oh-my-zsh).
antigen bundle git
antigen bundle heroku
antigen bundle pip
antigen bundle lein
antigen bundle command-not-found
antigen bundle autojump
antigen bundle brew
antigen bundle common-aliases
antigen bundle compleat
antigen bundle git-extras
antigen bundle git-flow
antigen bundle npm
antigen bundle osx
antigen bundle web-search
antigen bundle z
antigen bundle zsh-users/zsh-syntax-highlighting
antigen bundle zsh-users/zsh-history-substring-search ./zsh-history-substring-search.zsh
antigen bundle mafredri/zsh-async
antigen bundle sindresorhus/pure

# Tell antigen that you're done.
antigen apply

# Setup zsh-autosuggestions
source $DOTFILES_DIR/zsh-autosuggestions/zsh-autosuggestions.zsh

# Unknown what this is
zle -N zle-line-init

# Shell colors, type `base16_` and use suggestions to set theme
BASE16_SHELL=$DOTFILES_DIR/base16-shell/
[ -n "$PS1" ] && [ -s $BASE16_SHELL/profile_helper.sh ] && eval "$($BASE16_SHELL/profile_helper.sh)"

export NVM_DIR="$HOME/.nvm"
[ -s "$NVM_DIR/nvm.sh" ] && \. "$NVM_DIR/nvm.sh"  # This loads nvm
[ -s "$NVM_DIR/bash_completion" ] && \. "$NVM_DIR/bash_completion"  # This loads nvm bash_completion
[[ -s "$HOME/.avn/bin/avn.sh" ]] && source "$HOME/.avn/bin/avn.sh" # load avn

alias eup="cd ~/Sites/drake && dc up -d && cd ~/Sites/barbosa && dc up -d && cd ~/Sites/mozauth-docker && dc up -d && cd ~/Sites"
alias edown="cd ~/Sites/drake && dc down && cd ~/Sites/barbosa && dc down && cd ~/Sites/mozauth-docker && dc down && cd ~/Sites"
