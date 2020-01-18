#!/bin/bash
#Dal's Ubuntu environment setup
#Key tools:
sudo apt-get update
sudo apt-get install git
sudo apt-get install curl
sudo apt-get install xsel
sudo apt-get install wget
sudo apt-get install snapd
sudo apt-get install htop

#Python goodies
sudo snap install --classic code
curl https://pyenv.run | bash
curl https://bootstrap.pypa.io/get-pip.py -o get-pip.py
python get-pip.py
python3 -m pip install --user pipx
pipx install poetry

#ZSH goodies
sudo apt-git install zsh
chsh -s $(which zsh)
cp -rf .zshrc ~/.zshrc
sudo apt-get install fonts-powerline
git clone https://github.com/denysdovhan/spaceship-prompt.git "$ZSH_CUSTOM/themes/spaceship-prompt"
ln -s "$ZSH_CUSTOM/themes/spaceship-prompt/spaceship.zsh-theme" "$ZSH_CUSTOM/themes/spaceship.zsh-theme"
sh -c "$(curl -fsSL https://raw.githubusercontent.com/robbyrussell/oh-my-zsh/master/tools/install.sh)"
git clone https://github.com/zsh-users/zsh-autosuggestions.git $ZSH_CUSTOM/plugins/zsh-autosuggestions
git clone https://github.com/zsh-users/zsh-syntax-highlighting.git $ZSH_CUSTOM/plugins/zsh-syntax-highlighting
dconf load /org/gnome/terminal/ < gnome_terminal_settings_backup.txt