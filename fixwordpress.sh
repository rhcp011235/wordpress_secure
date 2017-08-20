#!/bin/bash
#
# Simple bash to fix up wordpress on apache
#
# By: john.b.hale@gmail.com

# Get the current User Name
USER=`env|grep USER|cut -d= -f2`


echo "[+] Setting www-data and file/dir perms[+]"
echo "[=] Sudo Enabled [=]"
sudo chown www-data:www-data  -R * $1              
sudo find $1 -type d -exec chmod 755 {} \; 
sudo find $1 -type f -exec chmod 644 {} \;  

echo "[+] Setting the username to have access and setting wp-content to www-data [+]"
sudo chown $USER:$USER  -R $1 # Let your useraccount be owner
sudo chown www-data:www-data $1/wp-content # Let apache be owner of wp-content
echo "[+] Setting the Uploads dir world read/write [+]";
sudo chmod 777 $1/wp-content/uploads/
echo "[=] Done [=]"
