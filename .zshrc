DOTFILES_DIR="/Users/natebailey/dotfiles"

source /usr/local/share/antigen/antigen.zsh
source /usr/local/share/zsh-autosuggestions/zsh-autosuggestions.zsh

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
alias gs="git status"
alias gd="git diff"
alias gf="git rebase -i HEAD~2"
alias gl="git lg"

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
antigen bundle popstas/zsh-command-time

# Tell antigen that you're done.
antigen apply

# Unknown what this is
zle -N zle-line-init

# Shell colors, type `base16_` and use suggestions to set theme
BASE16_SHELL=$DOTFILES_DIR/base16-shell/
[ -n "$PS1" ] && [ -s $BASE16_SHELL/profile_helper.sh ] && eval "$($BASE16_SHELL/profile_helper.sh)"

export NVM_DIR="$HOME/.nvm"
[ -s "$NVM_DIR/nvm.sh" ] && \. "$NVM_DIR/nvm.sh"  # This loads nvm
[ -s "$NVM_DIR/bash_completion" ] && \. "$NVM_DIR/bash_completion"  # This loads nvm bash_completion
[[ -s "$HOME/.avn/bin/avn.sh" ]] && source "$HOME/.avn/bin/avn.sh" # load avn

export PATH="$HOME/.bin:$PATH"

# Begin vim keybinding config
bindkey -v

function zle-line-init zle-keymap-select {
    VIM_PROMPT="%{$fg_bold[yellow]%} [% NORMAL]%  %{$reset_color%}"
    RPS1="${${KEYMAP/vicmd/$VIM_PROMPT}/(main|viins)/}$(git_custom_status) $EPS1"
    zle reset-prompt
}

zle -N zle-line-init
zle -N zle-keymap-select
export KEYTIMEOUT=1
# End vim keybinding config

# Allows the use of fzf to search through history
fh() {
  print -z $( ([ -n "$ZSH_NAME" ] && fc -l 1 || history) | fzf +s --tac | sed 's/ *[0-9]* *//')
}

# Receives a URL as a parameter to curl and pretty-prints the JSON response
function jsonify () {
  curl "$@" | python -m json.tool
}

export VAULT_TOKEN=$(cat $HOME/.vault-token)
