FROM alpine:3.15.2

RUN apk add nginx bind-tools
COPY files/wordpress.conf /etc/nginx/http.d/wordpress.conf
COPY files/default.conf /etc/nginx/http.d/default.conf
COPY files/phpfpm.conf /etc/nginx/snippets/phpfpm.conf
COPY files/self-signed.crt /etc/nginx/ssl/self-signed.crt
COPY files/self-signed.key /etc/nginx/ssl/self-signed.key

COPY files/run.sh /scripts/run.sh
RUN chmod -R 755 /scripts

RUN sed -i 's|ssl_protocols TLSv1.1 TLSv1.2 TLSv1.3;|ssl_protocols TLSv1.2 TLSv1.3;|g' /etc/nginx/nginx.conf

ENTRYPOINT ["/scripts/run.sh"]
