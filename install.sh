#!/bin/bash

# Check root previleges
if [ "$EUID" -ne 0 ]
  then echo "Please, run as root."
  exit 1;
fi

# Read configuration
if [ ! -f ".env" ]; then
    echo "File .env does not exist. Please, make a copy of .env.example and configure it."
    exit 1;
fi
source .env

# Read an variable with array of packages which should be installed.
if [ -z ${PACKAGES_TO_INSTALL+z} ]; then
    echo "PACKAGES_TO_INSTALL variable is not set or is empty. You should configure it in .env file."
    exit 1;
fi

# Check if any scripts exists
if [ ! -d "${PATH_TO_PACKAGES_FOLDER}" ]; then
    echo "The ${PATH_TO_PACKAGES_FOLDER} does not exist. Create a folder and configure installation script(s)."
    exit 1;
fi

# Number of successful installations
SUCCESSFUL_PACKAGES=0

# Number of failed installations
FAILED_PACKAGES=0

# Number of tries instllation of packaging tool
tries=0;
while true
do
    # Check if packaging tool is installed
    if ! [ -x "$(command -v ${PACKAGING_TOOL})" ]; then
        # If installation of packaging tool is failed
        if [ "$tries" -eq 1 ]; then
            echo "Cannot install \"${PACKAGING_TOOL}\". Abort."
            exit 0;
        fi
    
        # Trying to install packaging tool
        echo "Error: \"${PACKAGING_TOOL}\" is not installed. Trying to install..."
        apt-get install -y ${PACKAGING_TOOL}
        ((tries++))
    else
        # If has not preinstalled show message about success installation
        if [ "$tries" -eq 1 ]; then
            echo "\"${PACKAGING_TOOL}\" installed successfuly."
            echo "---"
            echo ""
        fi
        break;
    fi
done

# Custom install packages function
install () {
    eval ${PACKAGING_TOOL} install -y "$@"
}

# Custom uninstall packages function
uninstall () {
    eval ${PACKAGING_TOOL} remove -y "$@"
}

# TODO add collect and add dependencies
apt-get update
apt-get upgrade -y

# Try to start install checked packages
for package in ${PACKAGES_TO_INSTALL[*]}
do
    printf "Installation of \"%s\"...\n" $package
    # Check if folder of package does exist
    if [ ! -d "${PATH_TO_PACKAGES_FOLDER}/${package}" ]; then
        printf "Scripts for \"%s\" not found. Abort.\n\n" $package
        ((FAILED_PACKAGES++))
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
    ((SUCCESSFUL_PACKAGES++))
done

# Write extra data of installation process
echo "---"
echo "Installation is done."
printf "Installed: %d\n" $SUCCESSFUL_PACKAGES
printf "Failed: %d\n" $FAILED_PACKAGES
echo $LOG > result.log
