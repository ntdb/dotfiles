mkdir /usr/local/share/antigen
curl -L git.io/antigen > /usr/local/share/antigen/antigen.zsh
git clone https://github.com/VundleVim/Vundle.vim.git ~/.vim/bundle/Vundle.vim
brew install neovim iterm2 yarn
npm install -g spaceship-prompt
cp ./.gitconfig ~/.gitconfig
cp ./.zshrc ~/.zshrc
cp ./.vimrc ~/.vimrc
cp ./.nvimrc ~/.config/nvim/init.vim
