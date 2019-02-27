#!/bin/bash

echo "*******************************************"
echo "*          Создание базы данных           *"
echo "*******************************************"

read -e -p "Имя базы данных: " ndb
read -e -p "Имя пользователя базы данных: " udb
read -e -p "Пароль пользователя базы данных: " pdb

echo "create user '${udb}'@'localhost' identified by '${pdb}';" | mysql -u root -p mysql
echo "create database ${ndb};" | mysql -u root -p mysql
echo "grant all on ${ndb}.* to '${udb}'@'localhost'" | mysql -u root -p mysql