## Alpine Chrony
#### A small docker container based on alpinelinux running chrony. A NTP server.


### How to start this container with docker cli
```
docker run -d                                                       \
            --name chrony                                           \
            -p 123:123/udp                                          \
            --cap-add SYS_NICE                                      \
            --cap-add SYS_TIME                                      \
            --cap-add SYS_RESOURCE                                  \
            -v <path_to_chrony.conf>:/etc/chrony/chrony.conf:ro     \
            10kresistor/alpine-chrony
```


### docker-compose.yaml
```
version: '3.3'
services:
    alpine-chrony:
        image: 10kresistor/alpine-chrony
        container_name: chrony
        ports:
            - '123:123/udp'
        volumes:
            - '<path_to_chrony.conf>:/etc/chrony/chrony.conf:ro'
```


### How to build it
`git pull https://github.com/10k-resistor/alpine-chrony.git`
`docker build --tag 10kresistor/alpine-chrony .`

### Configuration
[https://wiki.archlinux.org/title/Chrony](https://wiki.archlinux.org/title/Chrony)

### Docker Hub
[https://hub.docker.com/r/10kresistor/alpine-chrony](https://hub.docker.com/r/10kresistor/alpine-chrony)


### Logs
Chrony runs in un-detached mode in this image, which means that it does not send its logs to a file in the container, but to stdout. To view chrony logs, use `docker logs chrony`.

### Testing
ntpdate can be used to query the running container for the time:
#### If you have mapped port 123 to the host:
`ntpdate -q localhost`
#### From another container on the same Docker network:
`ntpdate -q <chrony_ip>`
