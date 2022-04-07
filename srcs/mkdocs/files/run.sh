#! /bin/sh

sed -i "s|{}|$SITE_NAME|g" /srv/links/mkdocs.yml

uvicorn --host=0.0.0.0 --app-dir=/scripts serve:app
