#! /bin/sh

if [ ! -d '/srv/www/wordpress' ]; then
  cp -r /root/wordpress /srv/www/wordpress
fi

rm -rf /root/wordpress

php-fpm7 -F
