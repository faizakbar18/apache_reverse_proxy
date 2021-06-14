#!/bin/bash

pathvar='/etc/apache2/sites-available'

read -p 'Domain : ' domainvar
read -p 'Port Tujuan : ' portvar

filepath="$pathvar/$domainvar.conf"
#echo $filepath
echo "<VirtualHost *:80>
		ProxyPreserveHost On

        ProxyPass / http://127.0.0.1:$portvar/
        ProxyPassReverse / http://127.0.0.1:$portvar/

        ServerName $domainvar
		ServerAlias $domainvar

        ErrorLog /var/log/apache2/$domainvar-error.log
        CustomLog /var/log/apache2/$domainvar-access.log combined
</VirtualHost>" >> $filepath

echo 'Activating conf'
a2ensite $domainvar > /dev/null 2>&1
echo 'restarting Apache'
service apache2 reload
echo DONE!
