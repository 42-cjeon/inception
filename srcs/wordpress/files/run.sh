#! /bin/sh

set -eux
if [ ! -d '/srv/www/wordpress' ]; then
  wp core download --path=/srv/www/wordpress
  wp core config --path=/srv/www/wordpress --dbhost=mariadb \
                 --dbname="$DB_NAME" --dbuser="$DB_USER" --dbpass="$DB_PASSWORD"
  wp core install --path=/srv/www/wordpress --url="$WP_URL" --title="$WP_TITLE" \
                  --admin_name="$WP_ADMIN_NAME" --admin_password="$WP_ADMIN_PASSWORD" \
                  --admin_email="$WP_ADMIN_EMAIL"
  wp plugin install --path=/srv/www/wordpress redis-cache --activate
  curl -L -o /srv/www/wordpress/adminer.php https://github.com/vrana/adminer/releases/download/v4.8.1/adminer-4.8.1-mysql-en.php
  sed -i "/Add any custom values between/ a define( 'WP_REDIS_HOST', 'redis' );" /srv/www/wordpress/wp-config.php
fi

unset DB_NAME
unset DB_USER
unset DB_PASSWORD
unset WP_URL
unset WP_TITLE
unset WP_ADMIN_NAME
unset WP_ADMIN_PASSWORD
unset WP_ADMIN_EMAIL

php-fpm7 -F
