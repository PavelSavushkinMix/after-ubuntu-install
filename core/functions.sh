#!/bin/bash

# Custom install packages function
install () {
    eval ${PACKAGING_TOOL} install -y "$@"
}

# Custom uninstall packages function
uninstall () {
    eval ${PACKAGING_TOOL} remove -y "$@"
}

# Custom update packages function
update () {
    eval ${PACKAGING_TOOL} update -y
}

# Custom upgrade packages function
upgrade () {
    eval ${PACKAGING_TOOL} upgrade -y
}
