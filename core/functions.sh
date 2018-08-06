#!/bin/bash

# Custom install packages function
install () {
    eval ${PACKAGING_TOOL} install -y "$@"
}

# Custom uninstall packages function
uninstall () {
    eval ${PACKAGING_TOOL} remove -y "$@"
}
