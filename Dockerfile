FROM alpine:latest
RUN apk add --no-cache tor darkhttpd
COPY site /opt/site
COPY keys /opt/keys
COPY torrc /etc/tor/torrc
COPY start.sh /opt/start.sh
RUN chmod +x /opt/start.sh
CMD ["/opt/start.sh"]
