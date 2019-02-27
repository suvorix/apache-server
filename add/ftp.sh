#!/bin/bash

echo "*******************************************"
echo "*       Создание FTP пользователя         *"
echo "*******************************************"

read -e -p "Папка: (например: /data/site.com)" dir
read -e -p "Имя пользователя: " name

useradd -d ${dir} -s /bin/bash -m ${name}
passwd ${name}
chown -R ${name}:${name} ${dir}
