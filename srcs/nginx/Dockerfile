FROM alpine:3.15.2

RUN apk add nginx
COPY files/default.conf /etc/nginx/http.d/default.conf
COPY files/self-signed.crt /etc/nginx/ssl/self-signed.crt
COPY files/self-signed.key /etc/nginx/ssl/self-signed.key

ENTRYPOINT ["nginx", "-g", "daemon off;"]
