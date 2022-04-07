#! /bin/sh

function wait_service_port() {
  local max_retry=$1
  local target="$2"
  shift 2
  until [ $max_retry -eq 0 ] || nc -zv -w 1 "$@"; do
    echo "[-] Wait for" $target "-" $max_retry
    let "max_retry=max_retry-1"
    sleep 5
  done
  if [ $max_retry -eq 0 ]; then
    exit 1
  fi
}

sed -i "s|{SERVER_NAME}|$SERVER_NAME|g" /etc/nginx/http.d/wordpress.conf

wait_service_port 30 "php-fpm" wordpress 9000
wait_service_port 30 "uvicorn" mkdocs 8000

nginx -g "daemon off;"
