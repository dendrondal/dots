#!/bin/bash
#Dal's Manjaro environment setup

#Essentials
sudo pacman -S git
git config --global credential.helper store

#IDE
sudo pacman -S visual-studio-code-bin

#Python Goodies
sudo pacman -S pyenv-git
sudo pacman -S python-pipx
pipx install poetry

#ZSH
sudo pacman -S oh-my-zsh-git
chsh -s $(which zsh)
cp -rf .zshrc ~/.zshrc
sudo pacman -S powerline
sudo git clone https://github.com/denysdovhan/spaceship-prompt.git "$ZSH_CUSTOM/themes/spaceship-prompt"
sudo ln -s "$ZSH_CUSTOM/themes/spaceship-prompt/spaceship.zsh-theme" "$ZSH_CUSTOM/themes/spaceship.zsh-theme"
sh -c "$(curl -fsSL https://raw.githubusercontent.com/robbyrussell/oh-my-zsh/master/tools/install.sh)"
sudo git clone https://github.com/zsh-users/zsh-autosuggestions.git $ZSH_CUSTOM/plugins/zsh-autosuggestions
sudo git clone https://github.com/zsh-users/zsh-syntax-highlighting.git $ZSH_CUSTOM/plugins/zsh-syntax-highlighting
dconf load /org/gnome/terminal/ < gnome_terminal_settings_backup.txtonts-git
