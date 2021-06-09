#!/bin/bash

pathvar='/etc/apache2/sites-available'

a2query -s

read -p 'Domain : ' domainvar

filepath="$pathvar/$domainvar.conf"

echo 'Deactivating conf'
a2dissite $domainvar > /dev/null 2>&1
echo 'Removing File'
rm $filepath
echo 'restarting Apache'
service apache2 reload
echo DONE!