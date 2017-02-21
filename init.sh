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
  brew install fish jq peco python3 go
  curl https://sh.rustup.rs -sSf | sh
  echo `which fish` >> /etc/shells
  chsh fish
  curl -Lo ~/.config/fish/functions/fisher.fish --create-dirs git.io/fisher
  fisher install z docker-completion
  cp ./config.fish $HOME/.config/fish/
  cp ./functions/ $HOME/.config/fish/
}

# ubuntu
init_ubuntu(){
  sudo apt install fish jq peco python3 golang
  mkdir $HOME/.go
  curl https://sh.rustup.rs -sSf | sh
  chsh fish
  curl -Lo ~/.config/fish/functions/fisher.fish --create-dirs git.io/fisher
  fisher install z docker-completion
  cp ./config.fish $HOME/.config/fish/
  cp ./functions/ $HOME/.config/fish/
}
