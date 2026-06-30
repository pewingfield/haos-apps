#!/bin/bash
echo "========== LUBELOGGER STARTING $(date) =========="

# Wait for supervisor to finalize ingress token
sleep 2
SUPERVISOR_TOKEN="${SUPERVISOR_TOKEN}"

# Fetch token and retry until stable
INGRESS_ENTRY=""
PREV_ENTRY="none"
while [ "$INGRESS_ENTRY" != "$PREV_ENTRY" ]; do
    PREV_ENTRY="$INGRESS_ENTRY"
    sleep 2
    INGRESS_ENTRY=$(curl -s -H "Authorization: Bearer ${SUPERVISOR_TOKEN}" http://supervisor/addons/self/info | python3 -c "
import sys, json
from urllib.parse import urlparse
d = json.load(sys.stdin)
entry = d['data']['ingress_entry']
parsed = urlparse(entry)
print(parsed.path if parsed.scheme else entry)
")
done

echo "Stable ingress token: $INGRESS_ENTRY"

# Stop any running nginx instance
nginx -s stop 2>/dev/null || pkill nginx 2>/dev/null || true
sleep 1

cat > /etc/nginx/nginx.conf << EOF
user www-data;
worker_processes auto;
pid /run/nginx.pid;
events {
    worker_connections 768;
}
http {
    sendfile on;
    include /etc/nginx/mime.types;
    default_type application/octet-stream;
    server {
        listen 0.0.0.0:8080;
        location = / {
            return 301 ${INGRESS_ENTRY}/;
        }
        location ${INGRESS_ENTRY}/ {
            proxy_pass http://127.0.0.1:8081/;
            proxy_set_header Host \$host;
            proxy_set_header X-Real-IP \$remote_addr;
            proxy_set_header X-Ingress-Path ${INGRESS_ENTRY};
        }
        location / {
            proxy_pass http://127.0.0.1:8081/;
            proxy_set_header Host \$host;
            proxy_set_header X-Real-IP \$remote_addr;
            proxy_set_header X-Ingress-Path ${INGRESS_ENTRY};
            sub_filter '"/defaults/' '"${INGRESS_ENTRY}/defaults/';
            sub_filter "'/defaults/" "'${INGRESS_ENTRY}/defaults/";
            sub_filter_types application/json text/javascript;
            sub_filter_once off;
        }
    }
}
EOF

sleep 5

# Ensure data directory exists
mkdir -p /data/keys
export LUBELOGGER_USERDATA_DIRECTORY=/data/
export ASPNETCORE_URLS=http://+:8081

export ASPNETCORE_URLS=http://+:8081
export ASPNETCORE_HTTP_PORTS=8081
export ASPNETCORE_HTTPS_PORTS=""

# Start dotnet in background
dotnet /App/CarCareTracker.dll &

nginx -t 2>&1 || echo "NGINX CONFIG TEST FAILED"
echo "Starting nginx..."
nginx -g 'daemon off;' -e /dev/stderr 2>&1
