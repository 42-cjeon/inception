#! /bin/sh

if [ ! -d '/srv/www/wordpress' ]; then
  cp -r /root/wordpress /srv/www/wordpress
  cp /root/wp-config.php /srv/www/wordpress/wp-config.php
  chown -R nobody:nobody /srv/www
fi

rm -rf /root/wordpress
rm -f /root/wp-config.php

php-fpm7 -F
