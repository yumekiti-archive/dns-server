FROM ubuntu:20.04

ENV TZ='Asia/Tokyo'

RUN apt update && apt upgrade -y

RUN apt-get -y install bind9 dnsutils rsyslog

COPY ./bind/* /mnt/bind/

RUN touch /etc/bind/db.192 && \
    touch /etc/bind/stocklist-rice.com.lan && \
    cat /mnt/bind/db.192 > /etc/bind/db.192 && \
    cat /mnt/bind/stocklist-rice.com.lan > /etc/bind/stocklist-rice.com.lan && \
    cat /mnt/bind/named.conf.options > /etc/bind/named.conf.options && \
    cat /mnt/bind/named.conf.default-zones > /etc/bind/named.conf.default-zones

RUN chmod 644 -R /etc/bind && \
    chown root:root /etc/bind/db.192 && \
    chmod 640 /etc/bind/rndc.key
#    chmod 755 /etc/bind

# WORKDIR /etc/bind9

# drw-r-Sr-- 1 root bind    4096 Apr 26 05:08 bind
# drwxr-sr-x 2 root bind    4096 Apr 26 05:15 bind
# drw-r-Sr-- 1 root bind    4096 Apr 26 05:18 bind
# drwxr-sr-- 1 root bind    4096 Apr 26 05:18 bind
# drwxr-s--x 1 root bind    4096 Apr 26 05:18 bind
# drwxr-sr-x 1 root bind    4096 Apr 26 05:18 bind
# drwxr-sr-x 1 root bind    4096 Apr 26 05:18 bind