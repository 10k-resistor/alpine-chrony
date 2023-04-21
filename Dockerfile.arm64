FROM --platform=$BUILDPLATFORM alpine:latest

RUN apk add --arch aarch64 --update --no-cache chrony

EXPOSE 123/udp

ENTRYPOINT [ "/usr/sbin/chronyd", "-d", "-s"]
