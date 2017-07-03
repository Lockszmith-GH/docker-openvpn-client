#!/bin/sh

EXPECTED=$(cat /vpn/vpn.conf | sed -n 's/.*remote \(.*\)443.*/\1/p' | xargs)

ACTUAL=$(dig o-o.myaddr.l.google.com txt @ns1.google.com +short | xargs)

if [ "$ACTUAL" == "$EXPECTED" ];then
  exit
else
  exit 1
fi
