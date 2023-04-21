FROM --platform=$BUILDPLATFORM alpine:latest

RUN apk add --update --no-cache chrony

EXPOSE 123/udp

ENTRYPOINT [ "/usr/sbin/chronyd", "-d", "-s"]
