#!/bin/bash

# Custom install packages function
install () {
    eval sudo ${PACKAGING_TOOL} install -y "$@"
}

# Custom uninstall packages function
uninstall () {
    eval sudo ${PACKAGING_TOOL} remove -y "$@"
}

# Custom update packages function
update () {
    eval sudo ${PACKAGING_TOOL} update -y
}

# Custom upgrade packages function
upgrade () {
    eval sudo ${PACKAGING_TOOL} upgrade -y
}

# Custom chown function
changeOwner () {
    sudo chown -Rf "$USER":"$USER" "$1"
}

# Custom mkdir function
makeDir () {
    sudo mkdir "$1"
    changeOwner "$1"
}
