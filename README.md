# Linux Setup
This repository tracks my Linux computing environment for super-quick setup on any Debian-based environment. It installs:

- wget & curl
- htop
- zsh
- oh my zsh
- Beautiful terminal pallettes
- .zshrc profile full of aliases, etc
- Pyenv
- VSCode

# Execution
Download, and run:

`chmod a+x ubuntu_setup.sh`

`sh ubuntu_setup.sh`

To make sure this worked sucessfully, try to open a new terminal and make sure it is a zsh shell. Also, run `pyenv global` to make sue your Python manaagement is working properly.

For i3 and other ricing stuff, just copy the .config to your home folder. I plan to add a polybar install script later, as it's quite involved.

## Vim stuff
For the .vimrc to work, you'll need to make sure you have a full version of vim. For Debian-based systems:

`sudo apt remove --assume-yes vim-tiny`
`sudo apt-get update`
`sudo apt install --assume-yes vim`

Also make sure you have vundle:

`git clone https://github.com/gmarik/Vundle.vim.git ~/.vim/bundle/Vundle.vim`

Now just copy the .vimrc vile to your home folder, and run `:PluginInstall` inside of vim.

For YouCompleteMe, remember to run `install.py` inside of /.vim/plugged.

# License
MIT License

Copyright (c) 2020 Dal Williams

Permission is hereby granted, free of charge, to any person obtaining a copy of this software and associated documentation files (the "Software"), to deal in the Software without restriction, including without limitation the rights to use, copy, modify, merge, publish, distribute, sublicense, and/or sell copies of the Software, and to permit persons to whom the Software is furnished to do so, subject to the following conditions:

The above copyright notice and this permission notice shall be included in all copies or substantial portions of the Software.

THE SOFTWARE IS PROVIDED "AS IS", WITHOUT WARRANTY OF ANY KIND, EXPRESS OR IMPLIED, INCLUDING BUT NOT LIMITED TO THE WARRANTIES OF MERCHANTABILITY, FITNESS FOR A PARTICULAR PURPOSE AND NONINFRINGEMENT. IN NO EVENT SHALL THE AUTHORS OR COPYRIGHT HOLDERS BE LIABLE FOR ANY CLAIM, DAMAGES OR OTHER LIABILITY, WHETHER IN AN ACTION OF CONTRACT, TORT OR OTHERWISE, ARISING FROM, OUT OF OR IN CONNECTION WITH THE SOFTWARE OR THE USE OR OTHER DEALINGS IN THE SOFTWARE.
