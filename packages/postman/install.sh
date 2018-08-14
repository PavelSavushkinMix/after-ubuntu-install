#!/bin/bash

wget https://dl.pstmn.io/download/latest/linux64 -O "${DOWNLOADS_FOLDER}/postman.tar.gz"
sudo tar -xzf "${DOWNLOADS_FOLDER}/postman.tar.gz" -C "${PROGRAMS_FOLDER}"
rm "${DOWNLOADS_FOLDER}/postman.tar.gz"
