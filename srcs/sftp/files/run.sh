#! /bin/sh

adduser -D -H -s /bin/sh sftp
chgrp -R sftp www
echo -e "$SFTP_PASSWORD\n$SFTP_PASSWORD" | passwd sftp
unset SFTP_PASSWORD

/usr/sbin/sshd -h /etc/ssh/id_rsa -D