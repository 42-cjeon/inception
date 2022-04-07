FROM alpine:3.15.2

COPY files/links /srv/links
COPY files/serve.py /scripts/serve.py

RUN apk add python3 py3-pip
RUN pip install mkdocs uvicorn starlette

WORKDIR /srv/links
RUN mkdocs build

EXPOSE 8000

ENTRYPOINT ["uvicorn", "--host=0.0.0.0", "--app-dir=/scripts", "serve:app"]
