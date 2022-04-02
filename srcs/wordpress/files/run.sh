#! /bin/sh

set -eux
if [ ! -d '/srv/www/wordpress' ]; then
  wp core download --path=/srv/www/wordpress
  wp core config --path=/srv/www/wordpress --dbhost=mariadb \
                 --dbname="$DB_NAME" --dbuser="$DB_USER" --dbpass="$DB_PASSWORD"
  wp core install --path=/srv/www/wordpress --url="$WP_URL" --title="$WP_TITLE" \
                  --admin_name="$WP_ADMIN_NAME" --admin_password="$WP_ADMIN_PASSWORD" \
                  --admin_email="$WP_ADMIN_EMAIL"
  chown -R nobody:nobody /srv/www
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
