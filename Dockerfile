FROM ubuntu:20.04

ENV TZ='Asia/Tokyo'

RUN apt update && apt upgrade -y

RUN apt-get -y install bind9 dnsutils rsyslog net-tools iputils-ping

COPY ./bind/* /etc/bind/

RUN chmod 644 -R /etc/bind/ && \
    chown root:root /etc/bind/db.192 && \
    chmod 640 /etc/bind/rndc.key && \
    chmod 755 /etc/bind

# WORKDIR /etc/bind9

# drw-r-Sr-- 1 root bind    4096 Apr 26 05:08 bind
# drwxr-sr-x 2 root bind    4096 Apr 26 05:15 bind