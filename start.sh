#!/bin/bash

# Substitute configuration
for VARIABLE in `env | cut -f1 -d=`; do
  sed -i "s={{ $VARIABLE }}=${!VARIABLE}=g" /etc/dovecot/*.conf
  sed -i "s={{ $VARIABLE }}=${!VARIABLE}=g" /etc/dovecot/*.ext
done

# Fix permissions
chown -R mail:mail /var/mail

# Run dovecot
exec /usr/sbin/dovecot -c /etc/dovecot/dovecot.conf -F