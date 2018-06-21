# Remove old versions of docker
uninstall docker docker-engine docker.io
# Instrall a new one via official script
curl -fsSL get.docker.com -o get-docker.sh
sh get-docker.sh
rm -f get-docker.sh
