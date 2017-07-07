#!/bin/sh

EXPECTED=$(cat /vpn/vpn.conf | sed -n 's/.*remote \(.*\)443.*/\1/p' | xargs)

ACTUAL=$(dig o-o.myaddr.l.google.com txt @8.8.8.8 +short | xargs)

echo "Expected '$EXPECTED' and found '$ACTUAL'"

[[ "$ACTUAL" == "$EXPECTED" ]]
