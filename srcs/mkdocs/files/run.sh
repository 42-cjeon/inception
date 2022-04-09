#! /bin/sh

sed -i "s|{SITE_URL}|$SITE_URL|g" /srv/links/mkdocs.yml

exec uvicorn --host=0.0.0.0 --app-dir=/scripts serve:app
