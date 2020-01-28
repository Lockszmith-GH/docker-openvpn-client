#!/bin/sh

EXPECTED=$(cat /vpn/vpn.conf | sed -n 's/remote \([[:digit:]]\+\.[[:digit:]]\+\.[[:digit:]]\+\.[[:digit:]]\+\).*/\1/p' | xargs)

ACTUAL=$(dig TXT o-o.myaddr.l.google.com @ns1.google.com +short | xargs)

echo "Expected '$EXPECTED' and found '$ACTUAL'"

[[ "$ACTUAL" == "$EXPECTED" ]]
