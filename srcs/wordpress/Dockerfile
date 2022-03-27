FROM alpine:3.15.2

ADD https://wordpress.org/latest.tar.gz /var/www/html/wordpress.tar.gz
RUN cd /var/www/html && tar -xf wordpress.tar.gz && rm -f wordpress.tar.gz && cd -