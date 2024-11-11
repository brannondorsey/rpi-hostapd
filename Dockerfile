FROM debian:buster
# replace ^ with below for raspberry pi
#FROM resin/rpi-raspbian:jessie

LABEL maintainer="brannon@brannondorsey.com"
LABEL license="MIT"

RUN apt-get update --fix-missing && apt-get install -y \
    hostapd \
    dbus \
    net-tools \
    iptables \
    dnsmasq \
    net-tools \
    macchanger

# mitmproxy requires this env
ENV LANG en_US.UTF-8 

ADD mitmproxy/* /bin/
ADD hostapd.conf /etc/hostapd/hostapd.conf
ADD hostapd /etc/default/hostapd
ADD dnsmasq.conf /etc/dnsmasq.conf

ADD entrypoint.sh /root/entrypoint.sh
WORKDIR /root
ENTRYPOINT ["/root/entrypoint.sh"]
