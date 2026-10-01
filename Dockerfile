FROM alpine:latest
RUN apk add --no-cache tor
COPY site /opt/site
COPY torrc /etc/tor/torrc
COPY start.sh /opt/start.sh
RUN chmod +x /opt/start.sh
CMD ["/opt/start.sh"]
