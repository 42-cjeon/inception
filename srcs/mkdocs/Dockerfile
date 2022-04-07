FROM alpine:3.15.2

COPY files/links /srv/links
COPY files/serve.py /scripts/serve.py

COPY files/run.sh /scripts/run.sh
RUN chmod -R 755 /scripts

RUN apk add python3 py3-pip
RUN pip install mkdocs uvicorn starlette

WORKDIR /srv/links
RUN mkdocs build

EXPOSE 8000

ENTRYPOINT ["/scripts/run.sh"]
