PATH_TO_DOCKER_INSTALLATION_SCRIPT="${DOWNLOADS_FOLDER}/get-docker.sh";
# Remove old versions of docker
uninstall docker docker-engine docker.io
# Instrall a new one via official script
curl -fsSL get.docker.com -o ${PATH_TO_DOCKER_INSTALLATION_SCRIPT}
sh ${PATH_TO_DOCKER_INSTALLATION_SCRIPT}
rm -f ${PATH_TO_DOCKER_INSTALLATION_SCRIPT}
