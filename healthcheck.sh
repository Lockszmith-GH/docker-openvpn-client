#!/bin/sh

EXPECTED=$(cat /vpn/vpn.conf | sed -n 's/.*remote \(.*\)443.*/\1/p' | xargs)

ACTUAL=$(wget -qO- api.ipify.org | xargs)

if [ "$ACTUAL" == "$EXPECTED" ];then
  exit
else
  exit 1
fi
