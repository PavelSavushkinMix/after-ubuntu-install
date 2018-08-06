#!/bin/bash

source "${VARIABLES_FOLDER}/phpstorm.sh"

# Installing the application
rm -Rf $INSTALL_PATH
rm -Rf $TEMP_FOLDER_PHPSTORM
mkdir -p $TEMP_FOLDER_PHPSTORM
wget -O - "$PHPSTORM_URL" | tar xzf - -C $TEMP_FOLDER_PHPSTORM
mv $TEMP_FOLDER_PHPSTORM/PhpStorm-* $INSTALL_PATH
rm -Rf $TEMP_FOLDER_PHPSTORM
