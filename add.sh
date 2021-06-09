#!/bin/bash

pathvar='/etc/apache2/sites-available'

read -p 'Domain : ' domainvar
read -p 'Port Tujuan : ' portvar

filepath="$pathvar/$domainvar.conf"
#echo $filepath
echo "<VirtualHost *:80>
ServerName $domainvar

ServerAdmin contact@adfazmedia.com

ErrorLog ${APACHE_LOG_DIR}/error.log
CustomLog ${APACHE_LOG_DIR}/access.log combined

ProxyPreserveHost On
ProxyPass / http://127.0.0.1:$portvar/
ProxyPassReverse / http://127.0.0.1:$portvar/
</VirtualHost>" >> $filepath

echo 'Activating conf'
a2ensite $domainvar > /dev/null 2>&1
echo 'restarting Apache'
service apache2 reload
echo DONE!
