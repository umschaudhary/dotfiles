#!/bin/bash

CONFIG="$HOME/.config/"
AWESOME="${CONFIG}awesome/"

yes | sudo pip install virtualenv
yes | sudo pip install virtualenvwrapper
yes | sudo pacman -S tilix
yes | sudo pacman -S scrot
yes | sudo pacman -S sl

if [ ! -d "$AWESOME" ] 
then
    yes | sudo pacman -S awesome
    yes | sudo yay -S xorg-xbacklight
    echo "Directory $AWESOME DOES NOT exists." 
    echo "Copying $AWESOME"
    cp -r "$PWD/.config/awesome/" $CONFIG
fi



if [ ! -d  "$HOME/.local/share/fonts" ]
then
    mkdir -p ~/.local/share/fonts
    cd ~/.local/share/fonts && curl -fLo "Droid Sans Mono for Powerline Nerd Font Complete.otf" https://github.com/ryanoasis/nerd-fonts/raw/master/patched-fonts/DroidSansMono/complete/Droid%20Sans%20Mono%20Nerd%20Font%20Complete.otf
    wget https://github.com/powerline/powerline/raw/develop/font/PowerlineSymbols.otf
	wget https://github.com/powerline/powerline/raw/develop/font/10-powerline-symbols.conf
	mkdir ~/.fonts #if directory doesn't exist
	mv PowerlineSymbols.otf ~/.fonts/
	mkdir -p ~/.config/fontconfig/conf.d #if directory doesn't exists

    fc-cache -f -v
    mv 10-powerline-symbols.conf ~/.config/fontconfig/conf.d/
fi

if [ ! -d "${CONGIF}nvim/" ]
then
	yes | sudo pacman -S neovim
	yes | sudo pip install pylint-django
	yes | sudo pacman -S ctags
	yes | sudo pip install autopep8
	yes | sudo pacman -S yarn
	yes | sudo pacman -S ripgrep
	mkdir -p ${CONFIG}nvim/
	cat init.vim > ${CONFIG}nvim/init.vim
	curl -fLo ~/.local/share/nvim/site/autoload/plug.vim --create-dirs \https://raw.githubusercontent.com/junegunn/vim-plug/master/plug.vim
else
echo "exists"
fi

if [ ! -d "${CONFIG}alacritty/" ]
then
	yes | sudo pacman -S tmux
	yes | sudo pacman -S alacritty
	mkdir -p ~/.config/alacritty/
	cp alacritty.yml ${CONFIG}alacritty/alacritty.yml
else
cat alacritty.yml > ${CONFIG}alacritty/alacritty.yml
fi


if [ ! -d "${HOME}/.bash_aliases" ]
then
    cp .bash_aliases ${HOME}/.bash_aliases
else
    cat .bash_aliases > ${HOME}/.bash_aliases
fi


if [ ! -d "${HOME}/.oh-my-zsh" ]
then
	yes | sudo pacman -S zsh
	sh -c "$(curl -fsSL https://raw.github.com/ohmyzsh/ohmyzsh/master/tools/install.sh)"
	cat $PWD/.zshrc > $HOME/.zshrc
	echo "Installing Spaceship"

	git clone https://github.com/denysdovhan/spaceship-prompt.git "${HOME}/.oh-my-zsh/themes/spaceship-prompt"
	ln -s "${HOME}/.oh-my-zsh/themes/spaceship-prompt/spaceship.zsh-theme" "${HOME}/.oh-my-zsh/themes/spaceship.zsh-theme"

	git clone https://github.com/zsh-users/zsh-autosuggestions.git ${HOME}/.oh-my-zsh/plugins/zsh-autosuggestions
	git clone https://github.com/zsh-users/zsh-syntax-highlighting.git ${HOME}/.oh-my-zsh/plugins/zsh-syntax-highlighting
else
cat $PWD/.zshrc > $HOME/.zshrc
fi

chsh -s $(which zsh)
source ~/.zshrc

echo "install manually hack font from github"
figlet "... and we're back!" | lolcat
