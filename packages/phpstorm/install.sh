#!/bin/bash

# Folder for installation PHPStorm
export INSTALL_PATH="$PROGRAMS_FOLDER/PHPStorm"

# Path to executable file of PHPStorm
export EXECUTABLE_PATH="$INSTALL_PATH/bin/phpstorm.sh"

# URL of actual version of PHPStorm
export PHPSTORM_URL=$(wget -O - "https://data.services.jetbrains.com/products/releases?code=PS&latest=true&type=release" 2> /dev/null | jq '.PS[] | .downloads | .linux | .link' | tr -d '"')

export TEMP_FOLDER_PHPSTORM="$HOME/.tmp_phpstorm"


# Installing the application
rm -Rf $INSTALL_PATH
rm -Rf $TEMP_FOLDER_PHPSTORM
mkdir -p $TEMP_FOLDER_PHPSTORM
wget -O - "$PHPSTORM_URL" | tar xzf - -C $TEMP_FOLDER_PHPSTORM
mv $TEMP_FOLDER_PHPSTORM/PhpStorm-* $INSTALL_PATH
rm -Rf $TEMP_FOLDER_PHPSTORM
