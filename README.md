# Docker OpenVPN Client

Forked from [manbearwiz/docker-openvpn-client](https://github.com/manbearwiz/docker-openvpn-client)<br/>
&nbsp;&nbsp;which forked from [ekristen/docker-openvpn-client](https://github.com/ekristen/docker-openvpn-client)<br/>
&nbsp;&nbsp;&nbsp;&nbsp;which is based on original idea borrowed from [dperson/openvpn-client](https://github.com/dperson/openvpn-client)


## Starting the VPN

1. You should add the generated openvpn client config to a directory, you can call it client.ovpn
2. You should add the password for the private key in the `client.ovpn` to `client.pwd`
3. Run the following, I recommend adding `--auth-nocache`

```shell
docker run -d --name vpn-client \
  --cap-add=NET_ADMIN \
  --device /dev/net/tun \
  -v /path/with/vpn/configs:/vpn \
  ekristen/openvpn-client --config /vpn/client.conf --askpass /vpn/client.pwd --auth-nocache
```

## Using the VPN

### Confirm it is working

To test that the VPN is working as intended, you can run the following command to get the public IP address that will be used by containers using the VPN network. This command uses the [library/busybox image](https://hub.docker.com/_/busybox/) to fetch the public IP from the [ipify service](www.ipify.org) and print it to STDOUT.

```shell
docker run --rm --net=container:vpn-client busybox wget -qO- api.ipify.org
```

### Route container traffic

Use `--net=container:<container-id>` -- routes available by the VPN client will be made available to the container.

```shell
docker run -it --rm \
  --net=container:vpn-client
  ubuntu /bin/bash
```

### Using with Compose

```yml
version: '2'
services:
  my-service:
    image: "ubuntu"
    network_mode: "service:vpn-client"
```
