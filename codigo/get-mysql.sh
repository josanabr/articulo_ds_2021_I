

#Código adaptado de https://gist.github.com/Mins/4602864
#Incluye comentario de: b23prodtm 

#!/bin/bash

sudo apt update

sudo apt install -y mysql-server

[ ! -e /usr/bin/expect ] && apt-get update && apt-get -y install expect

#// Not required in actual script
MYSQL_ROOT_PASSWORD=Inngenia.545

SECURE_MYSQL=$(expect -c "
set timeout 10
spawn mysql_secure_installation
expect \"Enter current password for root (enter for none):\"
send \"$MYSQL\r\"
expect \"Change the root password?\"
send \"n\r\"
expect \"Remove anonymous users?\"
send \"y\r\"
expect \"Disallow root login remotely?\"
send \"y\r\"
expect \"Remove test database and access to it?\"
send \"y\r\"
expect \"Reload privilege tables now?\"
send \"y\r\"
expect eof
")

echo "$SECURE_MYSQL"

apt-get -y purge expect
