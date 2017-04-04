#!/bin/sh
if [ "$(uname)" == 'Darwin' ]; then
	init_mac()

elif [ "$(expr substr $(uname -s) 1 5)" == 'Linux' ]; then
	init_ubuntu()
else
	echo "Your platform is not supported."
	exit 1
fi

init_mac(){
  brew update
  brew install fish jq fzf python3 go nodebrew
  curl https://sh.rustup.rs -sSf | sh
  echo `which fish` >> /etc/shells
  mkdir ~/go
  chsh fish
  curl -Lo ~/.config/fish/functions/fisher.fish --create-dirs git.io/fisher
  fisher install z docker-completion
  cp ./config.fish $HOME/.config/fish/
  cp ./functions/ $HOME/.config/fish/
}

# ubuntu
init_ubuntu(){
  sudo apt install fish jq python3 golang
  git clone --depth 1 https://github.com/junegunn/fzf.git ~/.fzf
  $HOME/.fzf/install
  mkdir $HOME/.go
  curl https://sh.rustup.rs -sSf | sh
  chsh fish
  curl -Lo ~/.config/fish/functions/fisher.fish --create-dirs git.io/fisher
  fisher install z docker-completion
  cp ./config.fish $HOME/.config/fish/
  cp ./functions/ $HOME/.config/fish/
}
