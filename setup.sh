#!/bin/bash
apt-get update
chmod +x ./ftp/install.sh
./ftp/install.sh
apt-get -y install apache2
systemctl enable apache2
systemctl start apache2
netstat -tulnp | grep apache2
mkdir /data
mkdir /data/default/www
mkdir /data/default/logs
rm /etc/logrotate.d/apache2
cp ./conf/apache2 /etc/logrotate.d/
apt-get -y install php
apt-get -y install php-mysql php-mbstring php-xml php-gd php-gettext
apt-get -y install mariadb-server mariadb-client
mysql_secure_installation
apt-get install -y phpmyadmin
ln -s /etc/phpmyadmin/apache.conf /etc/apache2/conf-available/phpmyadmin.conf
a2enconf phpmyadmin
echo "update user set plugin='' where User='root'; flush privileges;" | mysql -u root -p mysql
systemctl reload apache2