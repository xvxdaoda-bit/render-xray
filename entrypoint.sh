#!/bin/sh
set -eu
: "${UUID:?UUID env var is required}"
WS_PATH="${WS_PATH:-ws}"
PORT="${PORT:-8080}"
sed -e "s/__UUID__/${UUID}/g" \
    -e "s/__WS_PATH__/${WS_PATH}/g" \
    -e "s/__PORT__/${PORT}/g" \
    /etc/xray/config.json.template > /etc/xray/config.json
exec /usr/local/bin/xray run -config /etc/xray/config.json
