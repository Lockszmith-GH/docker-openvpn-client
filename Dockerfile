FROM alpine:3.5

VOLUME ["/vpn"]

RUN apk add --no-cache openvpn

ENTRYPOINT ["openvpn"]

COPY healthcheck.sh /usr/local/bin

HEALTHCHECK --interval=30m \
  CMD healthcheck

CMD ["--cd", "/vpn", "--config", "./vpn.conf", "--auth-nocache"]
