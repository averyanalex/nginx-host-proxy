#!/bin/bash
LISTEN=""
for PORT in $PORTS
do
    LISTEN='            listen '
    LISTEN+=$PORT
    LISTEN+=';'
    echo "$LISTEN" >> /etc/nginx/nginx.conf
done

PROXY_PASS='            proxy_pass '
PROXY_PASS+=$HOST
PROXY_PASS+=':$server_port;'

echo "$PROXY_PASS" >> /etc/nginx/nginx.conf
echo '    }' >> /etc/nginx/nginx.conf
echo '}' >> /etc/nginx/nginx.conf

bash /docker-entrypoint.sh
