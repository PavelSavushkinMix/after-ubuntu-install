# Check root previleges
if [ "$EUID" -ne 0 ]; then
    sudo echo "Root password is cached.";
fi

# Read an variable with array of packages which should be installed.
if [[ -z ${PACKAGES_TO_INSTALL+z} && ! -d "${PATH_TO_PACKAGES_FOLDER}/own" ]]; then
    echo "PACKAGES_TO_INSTALL variable is not set or is empty. You should configure it in .env file."
    exit 1;
fi

# Check if any scripts exists
if [ ! -d "${PATH_TO_PACKAGES_FOLDER}" ]; then
    echo "The ${PATH_TO_PACKAGES_FOLDER} does not exist. Create a folder and configure installation script(s)."
    exit 1;
fi

# Check if downloads folder exists and create it is not
if [ ! -d "${DOWNLOADS_FOLDER}" ]; then
    makeDir "${DOWNLOADS_FOLDER}"
fi

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
