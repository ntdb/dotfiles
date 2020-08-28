# ZSH cleanup
chmod -R 755 /usr/local/share/zsh

# Antigen
mkdir /usr/local/share/antigen
curl -L git.io/antigen > /usr/local/share/antigen/antigen.zsh

# Vundle
git clone https://github.com/VundleVim/Vundle.vim.git ~/.vim/bundle/Vundle.vim

# Brew Cask
brew cask install iterm2 alfred docker 1password rectangle spotify sublime-merge slack rocket aware bartender firefox google-chrome selfcontrol sublime-text

# NVM
curl -o- https://raw.githubusercontent.com/nvm-sh/nvm/v0.35.3/install.sh | bash

# Brew
brew install composer neovim yarn the_silver_searcher

# Prompt
npm install -g pure-prompt

# Config files
cp ./.gitconfig ~/.gitconfig
cp ./.zshrc ~/.zshrc
cp ./.vimrc ~/.vimrc
mkdir ~/.config/nvim
cp ./.nvimrc ~/.config/nvim/init.vim
