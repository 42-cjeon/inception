FROM alpine:3.15.2

RUN apk add redis

RUN sed -i "s|bind 127.0.0.1 -::1|#bind 127.0.0.1 -::1|g" /etc/redis.conf
RUN sed -i "s|protected-mode yes|protected-mode no|g" /etc/redis.conf

EXPOSE 6379

ENTRYPOINT ["redis-server", "/etc/redis.conf"]