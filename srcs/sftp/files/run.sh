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
chgrp -R sftp www

adduser -D -H -s /bin/sh sftp
echo -e "$SFTP_PASSWORD\n$SFTP_PASSWORD" | passwd sftp
unset SFTP_PASSWORD

/usr/sbin/sshd -h /etc/ssh/id_rsa -D
