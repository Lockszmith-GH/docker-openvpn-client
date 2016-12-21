FROM alpine

VOLUME ["/vpn"]

RUN apk add --no-cache openvpn

ENTRYPOINT ["openvpn"]

CMD ["--cd", "/vpn", "--config", "./vpn.conf", "--auth-nocache"]
