FROM alpine:3.15.2

RUN apk add nginx
COPY files/default.conf /etc/nginx/http.d/default.conf

ENTRYPOINT ["nginx", "-g", "daemon off;"]
