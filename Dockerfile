FROM alpine:latest
MAINTAINER RANDU Edouard <edouard.randu@gmail.com>

RUN apk --no-cache add minidlna

CP minidlna.conf /etc/minidlna.conf

EXPOSE 1900/udp
EXPOSE 8200

ENTRYPOINT [ "/usr/sbin/minidlnad", "-S" ]
