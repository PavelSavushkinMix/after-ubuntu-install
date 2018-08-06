#!/bin/bash

deb https://download.virtualbox.org/virtualbox/debian $(lsb_release -cs) contrib
wget -q https://www.virtualbox.org/download/oracle_vbox_2016.asc -O- | sudo apt-key add -
