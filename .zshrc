source /usr/local/share/antigen/antigen.zsh

export ENV=development
export PROJECT_HOME=$HOME/Sites
export PATH="/Users/nabaile/bin:$PATH"
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
alias gc="git diff master HEAD --shortstat"
alias fixcam="sudo killall VDCAssistant"

# Ignore insecure directories for non-admin user
autoload -Uz compinit
if [ "$(whoami)" = "nabaile" ]; then
  compinit -i # Ignore insecure directories
else
  compinit
fi

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


# BEGIN REI STUFF

# Global Variables
export CODE_HOME=/Users/nabaile/code
# export REI_CODE_HOME=$CODE_HOME/rei.com
export REI_TOOLS_HOME=/Users/nabaile/tools
export JBOSS_HOME=$REI_TOOLS_HOME/jboss
export TOOLKIT_HOME=$REI_TOOLS_HOME/devops-toolkit

# Versions
export REI_JBOSS_VERSION=6.4.21
export REI_NODE_VERSION=10
export REI_GROOVY_VERSION=2.4.16
export REI_MAVEN_VERSION=3.6.1
export REI_JAVA_8_VERSION=8.0.222-amzn
export REI_JAVA_11_VERSION=11.0.2-open

# PATHS
export PATH=$HOME/bin:usr/local/bin:$PATH

# Add FEBS to path for REI.com monolith - setup script only adds FEBS for current session
# Commented out FEBS to PATH for local build of rei-cedar.
# export PATH=$REI_CODE_HOME/online/online-web/febs/bin:$PATH

# Add Alpine devops-toolkit to path.
export PATH=$TOOLKIT_HOME:$PATH
export PATH=$REI_TOOLS_HOME/crampon:$PATH
export PATH=$REI_TOOLS_HOME/chromedriver:$PATH

#THIS MUST BE AT THE END OF THE FILE FOR SDKMAN TO WORK!!!
export SDKMAN_DIR="/Users/nabaile/.sdkman"
[[ -s "/Users/nabaile/.sdkman/bin/sdkman-init.sh" ]] && source "/Users/nabaile/.sdkman/bin/sdkman-init.sh"

# Added by install-mac-toolchain.sh
. ~/code/developer-setup/mac/.reirc
