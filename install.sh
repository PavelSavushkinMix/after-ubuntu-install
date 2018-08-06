#!/bin/bash

# Read configuration
if [ ! -f ".env" ]; then
    echo "File .env does not exist. Please, make a copy of .env.example and configure it."
    exit 1;
fi
source .env

# Import variables from file
source "${PATH_TO_CORE_FOLDER}/variables.sh"
# Import functions
source "${PATH_TO_CORE_FOLDER}/functions.sh"
# Validate the entry data
source "${PATH_TO_CORE_FOLDER}/entryValidation.sh"

# Base updating repositories
eval ${PACKAGING_TOOL} update
# Base upgrading of the system
eval ${PACKAGING_TOOL} upgrade -y

# Collect and update all repositories before update them with packaging tool
source "${PATH_TO_CORE_FOLDER}/updateRepositories.sh"

# Update the packages after adding new repositories
eval ${PACKAGING_TOOL} update

# Install packages
source "${PATH_TO_CORE_FOLDER}/packagesInstallation.sh"

# Start own scripts
source "${PATH_TO_PACKAGES_FOLDER}/own/${INSTALLATION_FILENAME}"

# Write extra data of installation process
echo "---"
echo "Installation is done."
printf "Installed: %d\n" $SUCCESSFUL_PACKAGES
printf "Failed: %d\n" $FAILED_PACKAGES
