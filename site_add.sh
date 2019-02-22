#!/bin/bash
read -e -p "UserName: " name
read -e -p "ServerName: " sname
read -e -p "ServerAlias: " salias

mkdir /data/${sname}
mkdir /data/${sname}/www
mkdir /data/${sname}/logs
echo "<VirtualHost *:80>" > /etc/apache2/sites-available/${sname}.conf
echo "	ServerName ${sname}" >> /etc/apache2/sites-available/${sname}.conf
if [[ ${salias} != "" ]]
then
    echo "	ServerAlias ${salias}" >> /etc/apache2/sites-available/${sname}.conf
fi
echo "	DocumentRoot /data/${sname}/www" >> /etc/apache2/sites-available/${sname}.conf
echo "	<Directory /data/${sname}/www>" >> /etc/apache2/sites-available/${sname}.conf
echo "		Options FollowSymLinks" >> /etc/apache2/sites-available/${sname}.conf
echo "		AllowOverride All" >> /etc/apache2/sites-available/${sname}.conf
echo "		Require all granted" >> /etc/apache2/sites-available/${sname}.conf
echo "	</Directory>" >> /etc/apache2/sites-available/${sname}.conf
echo "	ErrorLog /data/${sname}/logs/error.log" >> /etc/apache2/sites-available/${sname}.conf
echo "	CustomLog /data/${sname}/logs/access.log common" >> /etc/apache2/sites-available/${sname}.conf
echo "</VirtualHost>" >> /etc/apache2/sites-available/${sname}.conf
echo "php_admin_value date.timezone 'Europe/Moscow'" >> /etc/apache2/sites-available/${sname}.conf
echo "php_admin_value max_execution_time 60" >> /etc/apache2/sites-available/${sname}.conf
echo "php_admin_value upload_max_filesize 30M" >> /etc/apache2/sites-available/${sname}.conf
sudo a2ensite ${sname}
sudo a2enmod rewrite
useradd -d /data/${sname} -s /bin/bash -m ${name}
passwd ${name}
chown -R ${name}:${name} /data/${sname}