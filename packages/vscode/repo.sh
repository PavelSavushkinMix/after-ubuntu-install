#!/bin/bash

install curl

curl https://packages.microsoft.com/keys/microsoft.asc | gpg --dearmor > microsoft.gpg
sudo mv microsoft.gpg /etc/apt/trusted.gpg.d/microsoft.gpg
echo "deb [arch=$ARCH] https://packages.microsoft.com/repos/vscode stable main" > /etc/apt/sources.list.d/vscode.list
