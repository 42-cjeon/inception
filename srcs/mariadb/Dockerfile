FROM alpine:3.15.2
RUN apk add --no-cache mariadb mariadb-client

COPY files/run.sh /scripts/run.sh
COPY files/mariadb-server.cnf /etc/my.cnf.d/mariadb-server.cnf

RUN chmod -R 755 /scripts

EXPOSE 3306

ENTRYPOINT ["/scripts/run.sh"]