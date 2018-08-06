#!/bin/bash

# Try to start collect and install dependencies of packages
for package in ${PACKAGES_TO_INSTALL[*]}
do
    # Check if package folder and repo.sh file do exist
    if [[ ! -d "${PATH_TO_PACKAGES_FOLDER}/${package}" && ! -f "${PATH_TO_PACKAGES_FOLDER}/${package}/${REPO_FILENAME}" ]]; then
        continue;
    fi
    # Run repository file
    source "${PATH_TO_PACKAGES_FOLDER}/${package}/${REPO_FILENAME}"
    printf "Added repository for \"%s\"\n\n" $package
done

