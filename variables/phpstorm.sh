#!/bin/bash

# Folder for installation PHPStorm
export INSTALL_PATH="$HOME/PHPStorm"

# Path to executable file of PHPStorm
export EXECUTABLE_PATH="$INSTALL_PATH/bin/phpstorm.sh"

# URL of actual version of PHPStorm
export PHPSTORM_URL=$(wget -O - "https://data.services.jetbrains.com/products/releases?code=PS&latest=true&type=release" 2> /dev/null | jq '.PS[] | .downloads | .linux | .link' | tr -d '"')

export TEMP_FOLDER_PHPSTORM="$HOME/.tmp_phpstorm"
