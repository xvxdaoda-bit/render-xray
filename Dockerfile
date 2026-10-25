FROM alpine:3.20
RUN apk add --no-cache ca-certificates curl unzip tzdata \
  && mkdir -p /usr/local/bin /etc/xray \
  && curl -fsSL -o /tmp/xray.zip https://github.com/XTLS/Xray-core/releases/download/v1.8.23/Xray-linux-64.zip \
  && unzip -o /tmp/xray.zip -d /usr/local/bin \
  && chmod +x /usr/local/bin/xray \
  && rm /tmp/xray.zip
COPY config.json.template /etc/xray/config.json.template
COPY entrypoint.sh /entrypoint.sh
RUN chmod +x /entrypoint.sh
CMD ["/entrypoint.sh"]
