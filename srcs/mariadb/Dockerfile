FROM alpine:3.15.2
RUN apk add --no-cache mariadb mariadb-client

COPY files/run.sh /scripts/run.sh

RUN chmod -R 755 /scripts

EXPOSE 3306

ENTRYPOINT ["/scripts/run.sh"]