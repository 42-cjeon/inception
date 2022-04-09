#! /bin/sh

function wait_directory_up() {
  local max_retry=$1
  local target="$2"
  shift 2
  until [ -d "/srv/www" ]; do
    echo "[-] Wait for" $target "-" $max_retry
    let "max_retry=max_retry-1"
    sleep 5
  done
  if [ $max_retry -eq 0 ]; then
    exit 1
  fi
}

wait_directory_up 30 "wordpress"

adduser -D -H -s /bin/sh sftp
echo -e "$SFTP_PASSWORD\n$SFTP_PASSWORD" | passwd sftp
unset SFTP_PASSWORD

adduser -D -s /sbin/nologin tunnel
echo -e "$TUNNEL_PASSWORD\n$TUNNEL_PASSWORD" | passwd tunnel
unset TUNNEL_PASSWORD

chgrp -R sftp /srv/www
chmod -R 775 /srv/www

exec /usr/sbin/sshd -h /etc/ssh/id_rsa -D
