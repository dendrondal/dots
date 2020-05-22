#!/bin/bash
#Dal's Ubuntu environment setup
#Key tools:
sudo apt-get update
sudo apt-get install git
git config --global credential.helper store
sudo apt install -y curl xsel wget htop software-properties-common apt-transport-https 

#Python goodies
wget -q https://packages.microsoft.com/keys/microsoft.asc -O- | sudo apt-key add -
sudo add-apt-repository "deb [arch=amd64] https://packages.microsoft.com/repos/vscode stable main"
sudo apt update
sudo apt install -y code
sudo apt-get install -y build-essential libssl-dev zlib1g-dev libbz2-dev \
libreadline-dev libsqlite3-dev llvm libncurses5-dev libncursesw5-dev \
xz-utils tk-dev libffi-dev liblzma-dev python-openssl 
curl https://pyenv.run | bash


#ZSH goodies
sudo apt-get install zsh
cp -rf .zshrc ~/.zshrc
sudo apt-get install -y fonts-powerline
sudo git clone https://github.com/denysdovhan/spaceship-prompt.git "$ZSH_CUSTOM/themes/spaceship-prompt"
sudo ln -s "$ZSH_CUSTOM/themes/spaceship-prompt/spaceship.zsh-theme" "$ZSH_CUSTOM/themes/spaceship.zsh-theme"
sh -c "$(curl -fsSL https://raw.githubusercontent.com/robbyrussell/oh-my-zsh/master/tools/install.sh)"
sudo git clone https://github.com/zsh-users/zsh-autosuggestions.git $ZSH_CUSTOM/plugins/zsh-autosuggestions
sudo git clone https://github.com/zsh-users/zsh-syntax-highlighting.git $ZSH_CUSTOM/plugins/zsh-syntax-highlighting
dconf load /org/gnome/terminal/ < gnome_terminal_settings_backup.txt
chsh -s $(which zsh)