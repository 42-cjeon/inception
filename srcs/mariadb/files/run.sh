#! /bin/sh

if [ ! -d /run/mysqld ]; then
    mkdir -p /run/mysqld
    chown mysql:mysql /run/mysqld
fi

if [ ! -d /var/lib/mysql/mysql ]; then
    echo "[-] mariadb data directory not found.. initialize DB"
    mysql_install_db --user=mysql --ldata=/var/lib/mysql > /dev/null
    {
        echo "USE mysql;"
        echo "FLUSH PRIVILEGES ;"
        echo "DELETE FROM user WHERE user='';"
        echo "GRANT ALL ON *.* TO 'root'@'localhost' identified by '$MYSQL_ROOT_PASSWORD' WITH GRANT OPTION;"
        echo "DROP DATABASE IF EXISTS test ;"
        echo "CREATE DATABASE IF NOT EXISTS \`$MYSQL_DATABASE\` CHARACTER SET utf8 COLLATE utf8_general_ci;"
        echo "GRANT ALL ON \`$MYSQL_DATABASE\`.* to '$MYSQL_USER'@'%' IDENTIFIED BY '$MYSQL_PASSWORD';"
        echo "FLUSH PRIVILEGES ;"
    } | /usr/bin/mysqld --user=mysql --bootstrap
fi

exec /usr/bin/mysqld --user=mysql --console
