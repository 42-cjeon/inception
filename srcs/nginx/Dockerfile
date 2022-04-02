FROM alpine:3.15.2

RUN apk add nginx
COPY files/wordpress.conf /etc/nginx/http.d/wordpress.conf
COPY files/self-signed.crt /etc/nginx/ssl/self-signed.crt
COPY files/self-signed.key /etc/nginx/ssl/self-signed.key

RUN sed -i 's|ssl_protocols TLSv1.1 TLSv1.2 TLSv1.3;|ssl_protocols TLSv1.2 TLSv1.3;|g' /etc/nginx/nginx.conf

ENTRYPOINT ["nginx", "-g", "daemon off;"]
