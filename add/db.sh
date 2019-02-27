#!/bin/bash

echo "*******************************************"
echo "*          Создание базы данных           *"
echo "*******************************************"

read -e -p "Имя базы данных: " ndb
read -e -p "Имя пользователя базы данных: " udb
read -e -p "Пароль пользователя базы данных: " pdb

echo "Введите пароль от root пользователя"
echo "create user '${udb}'@'localhost' identified by '${pdb}'; create database ${ndb}; grant all on ${ndb}.* to '${udb}'@'localhost';" | mysql -u root -p mysql