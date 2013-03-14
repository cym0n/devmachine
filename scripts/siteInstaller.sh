#!/bin/sh

SOURCE_DIR="/mnt/share"
SITES_DIR="/var/apache"
APACHE_CONF_DIR="/etc/apache/extra/sites"
APACHE_LOGS_DIR="/var/log/apache"
APACHE_PORT=7000

PROJECT="comicpress"
PACKAGE="wordpress-3.5.1.zip"
PACKAGE_ROOT_DIR="wordpress"

echo "$PACKAGE" | grep -iq "*gz$"

if  echo $PACKAGE | grep -iq gz ; then TAR_COMMAND="tar xzvf";
elif  echo $PACKAGE | grep -iq bzip ; then TAR_COMMAND="tar xjvf";
elif  echo $PACKAGE | grep -iq zip ; then TAR_COMMAND="unzip";
fi

### APACHE ###

#PACKAGE INSTALLATION
echo "$TAR_COMMAND $SOURCE_DIR/$PACKAGE"
$TAR_COMMAND $SOURCE_DIR/$PACKAGE
mv $PACKAGE_ROOT_DIR $SITES_DIR/$PROJECT
chown -R www:www $SITES_DIR/$PROJECT 

#APACHE CONFIGURATION
cat > $APACHE_CONF_DIR/$PROJECT.conf << CONFIG
<VirtualHost *:$APACHE_PORT>
	ServerName $PROJECT.zion
	DocumentRoot $SITES_DIR/$PROJECT/
	CustomLog $APACHE_LOGS_DIR/$PROJECT-access.log common
	ErrorLog $APACHE_LOGS_DIR/$PROJECT-error.log
	<Directory "$SITES_DIR/$PROJECT/">
		AllowOverride All
		Options ExecCGI FollowSymLinks
		Allow from all
		Order Allow,Deny
	</Directory>
</VirtualHost>
CONFIG

#HOST CONFIGURATION
echo "127.0.0.1   $PROJECT.zion" >> /etc/hosts

### MYSQL ###

echo "CREATE USER '$PROJECT'@'localhost' IDENTIFIED BY '$PROJECT'" > query.sql
mysql -u root < query.sql
echo "CREATE DATABASE $PROJECT" > query.sql
mysql -u root < query.sql
echo "GRANT ALL ON $PROJECT.* TO $PROJECT; FLUSH PRIVILEGES" > query.sql
mysql -u root < query.sql
rm query.sql

echo "Installation completed. Restart Apache to bring $PROJECT to life"

