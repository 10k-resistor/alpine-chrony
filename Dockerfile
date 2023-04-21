FROM alpine:latest

RUN apk update
RUN apk add --no-cache chrony

EXPOSE 123/udp

ENTRYPOINT [ "/usr/sbin/chronyd", "-d", "-s"]
