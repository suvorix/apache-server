#!/bin/bash
read -e -p "UserName: " name
read -e -p "ServerName: " sname
read -e -p "ServerAlias: " salias

echo "<VirtualHost *:80>"
echo "	ServerName ${sname}"
if [[ ${salias} != "" ]]
then
    echo "	ServerAlias ${salias}"
fi
echo "	DocumentRoot /data/${sname}/www"
echo "	<Directory /data/${sname}/www>"
echo "		Options FollowSymLinks"
echo "		AllowOverride All"
echo "		Require all granted"
echo "	</Directory>"
echo "	ErrorLog /data/${sname}/logs/error.log"
echo "	CustomLog /data/${sname}/logs/access.log common"
echo "</VirtualHost>"
echo "php_admin_value date.timezone 'Europe/Moscow'"
echo "php_admin_value max_execution_time 60"
echo "php_admin_value upload_max_filesize 30M"

#useradd -d /data/www/${sname} -s /bin/bash -m ${name}
#passwd ${name}

#chown -R ${name}:${name} /data/www/${sname}