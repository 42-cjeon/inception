FROM alpine:3.15.2

COPY files/links /srv/links
RUN apk add python3 py3-pip
RUN pip install mkdocs

EXPOSE 8000

ENTRYPOINT ["mkdocs", "serve", "-a", "0.0.0.0:8000", "-f", "srv/links/mkdocs.yml"]