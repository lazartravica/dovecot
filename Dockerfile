FROM alpine

RUN apk add --update \
     dovecot \
     bash \
 && rm -rf /var/cache/apk/*

COPY conf /etc/dovecot

COPY start.sh /start.sh

CMD ["/start.sh"]
