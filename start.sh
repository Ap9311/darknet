#!/bin/sh
mkdir -p /var/lib/tor/hidden
[ -f /opt/keys/private_key ] && cp /opt/keys/private_key /var/lib/tor/hidden/
[ -f /opt/keys/hostname ] && cp /opt/keys/hostname /var/lib/tor/hidden/
chown -R 0:0 /var/lib/tor
chmod 700 /var/lib/tor/hidden
tor -f /etc/tor/torrc &
sleep 5
cp /var/lib/tor/hidden/hostname /opt/site/onion.txt
echo "=== ONION: $(cat /opt/site/onion.txt) ==="
exec darkhttpd /opt/site --port "${PORT:-8080}"
