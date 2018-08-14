#!/bin/bash

# Try to start install checked packages
for package in ${PACKAGES_TO_INSTALL[*]}
do
    printf "Installation of \"%s\"...\n" $package
    # Check if folder of package does exist
    if [ ! -d "${PATH_TO_PACKAGES_FOLDER}/${package}" ]; then
        printf "Scripts for \"%s\" not found. Abort.\n\n" $package
        continue;
    fi

    # Check if base installation file of package does exist
    if [ ! -f "${PATH_TO_PACKAGES_FOLDER}/${package}/${INSTALLATION_FILENAME}" ]; then
        printf "Installation script for \"%s\" not found (%s)\n\n" $package "${PATH_TO_PACKAGES_FOLDER}/${package}/${INSTALLATION_FILENAME}"
        continue;
    fi
    # Run main file installation of package
    source "${PATH_TO_PACKAGES_FOLDER}/${package}/${INSTALLATION_FILENAME}"
    printf "Installed: %s\n\n" $package
done
