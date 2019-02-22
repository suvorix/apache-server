#!/bin/bash
read -e -p "User name: " name
read -e -p "Server: " dname

echo "${name} - ${dname}"

echo "<VirtualHost *:80>"
echo "	ServerName ${dname}"

#echo "	ServerAlias www.${dname}"

echo "	DocumentRoot /data/${dname}/www"
echo "	<Directory /data/${dname}/www>"
echo "		Options FollowSymLinks"
echo "		AllowOverride All"
echo "		Require all granted"
echo "	</Directory>"
echo "	ErrorLog /data/${dname}/logs/error.log"
echo "	CustomLog /data/${dname}/logs/access.log common"
echo "</VirtualHost>"
echo "php_admin_value date.timezone 'Europe/Moscow'"
echo "php_admin_value max_execution_time 60"
echo "php_admin_value upload_max_filesize 30M"

#useradd -d /data/www/${dname} -s /bin/bash -m ${name}
#passwd ${name}

#chown -R ${name}:${name} /data/www/${dname}