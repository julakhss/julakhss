#!/bin/bash

wget https://raw.githubusercontent.com/julakhss/julakhss/main/JB6/menu.zip
unzip menu.zip
chmod +x menu/*
mv menu/* /usr/local/sbin
rm -rf menu
rm -rf menu.zip
