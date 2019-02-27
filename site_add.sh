#!/bin/bash

chmod +x ./add/*.sh
./add/db.sh

read -e -p "Создать FTP пользователя? [y/n]: " prompt
if [[ $prompt == "y" || $prompt == "Y" || $prompt == "yes" || $prompt == "Yes" ]]
then
  ./add/ftp.sh
fi

read -e -p "Создать базу данных? [y/n]: " prompt
if [[ $prompt == "y" || $prompt == "Y" || $prompt == "yes" || $prompt == "Yes" ]]
then
  ./add/db.sh
fi