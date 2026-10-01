#!/bin/sh
mkdir -p /var/lib/tor/hidden
chown -R tor:tor /var/lib/tor
chmod 700 /var/lib/tor/hidden
tor -f /etc/tor/torrc &
(
 for i in $(seq 1 60); do
  [ -f /var/lib/tor/hidden/hostname ] && cp /var/lib/tor/hidden/hostname /opt/site/onion.txt && echo "=== ONION: $(cat /var/lib/tor/hidden/hostname) ===" && exit 0
  sleep 1
 done
) &
exec darkhttpd /opt/site --port "${PORT:-8080}"
