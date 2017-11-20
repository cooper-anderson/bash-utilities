#!/bin/bash

KEY=$(curl -sL https://raw.githubusercontent.com/cooper-anderson/bash-utilities/master/id_rsa.pub)
touch ~/.ssh/authorized_keys

if [ $(cat ~/.ssh/authorized_keys | grep -c "$KEY") -eq 0 ]; then
	echo $KEY >> ~/.ssh/authorized_keys
fi

