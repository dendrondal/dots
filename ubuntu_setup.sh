#!/bin/bash

################################################
#Dal's Debian environment setup
################################################

#Key tools:
sudo apt-get update
sudo apt-get install git
git config --global credential.helper store
sudo apt install -y curl xsel wget htop software-properties-common apt-transport-https 

# Terminal Emulator
curl -L https://sw.kovidgoyal.net/kitty/installer.sh | sh /dev/stdin
# Create a symbolic link to add kitty to PATH (assuming ~/.local/bin is in
# your PATH)
ln -s ~/.local/kitty.app/bin/kitty ~/.local/bin/
# Place the kitty.desktop file somewhere it can be found by the OS
cp ~/.local/kitty.app/share/applications/kitty.desktop ~/.local/share/applications
# Update the path to the kitty icon in the kitty.desktop file
sed -i "s|Icon=kitty|Icon=/home/$USER/.local/kitty.app/share/icons/hicolor/256x256/apps/kitty.png|g" ~/.local/share/applications/kitty.desktop

#Neovim (with vimrc for redundancy)
sudo apt-get install neovim
mkdir ~/.config/nvim/init.vim
cp -rf .config/nvim/init.vim ~/.config/nvim/init.vim
cp -rf .vimrc ~/.vimrc

#ZSH goodies
sudo apt-get install zsh
cp -rf .zshrc ~/.zshrc
sudo apt-get install -y fonts-powerline fonts-firacode
sh -c "$(curl -fsSL https://raw.githubusercontent.com/robbyrussell/oh-my-zsh/master/tools/install.sh)"
git clone --depth=1 https://github.com/romkatv/powerlevel10k.git ${ZSH_CUSTOM:-$HOME/.oh-my-zsh/custom}/themes/powerlevel10k
sudo git clone https://github.com/zsh-users/zsh-autosuggestions.git $ZSH_CUSTOM/plugins/zsh-autosuggestions
sudo git clone https://github.com/zsh-users/zsh-syntax-highlighting.git $ZSH_CUSTOM/plugins/zsh-syntax-highlighting
chsh -s $(which zsh)

#Python goodies
sudo apt update
sudo apt-get install -y build-essential libssl-dev zlib1g-dev libbz2-dev \
libreadline-dev libsqlite3-dev llvm libncurses5-dev libncursesw5-dev \
xz-utils tk-dev libffi-dev liblzma-dev python-openssl 
curl https://pyenv.run | zsh
python3 -m pip install --user pipx
python3 -m pipx ensurepath
pipx install poetry

