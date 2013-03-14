#!/bin/sh

SOURCE_DIR="/mnt/share"
SITES_DIR="/var/apache"
APACHE_CONF_DIR="/etc/apache/extra/sites"
APACHE_LOGS_DIR="/var/log/apache"
APACHE_PORT=7000

PROJECT="parking"

### APACHE ###

mkdir $SITES_DIR/$PROJECT
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

echo "Installation completed. Restart Apache to bring $PROJECT to life"

