FROM alpine:3.15.2

COPY files/id_rsa /etc/ssh/id_rsa
COPY files/id_rsa.pub /etc/ssh/id_rsa.pub

COPY files/run.sh scripts/run.sh
RUN chmod -R 755 /scripts

RUN apk add openssh-server
RUN echo "Match group sftp" >> /etc/ssh/sshd_config
RUN echo "ChrootDirectory /srv" >> /etc/ssh/sshd_config
RUN echo "ForceCommand internal-sftp" >> /etc/ssh/sshd_config

ENTRYPOINT ["/scripts/run.sh"]