FROM alpine:latest

WORKDIR /bin

RUN apk upgrade && \
    apk add --no-cache \
    wget \
    tar \
    'varnish==6.6.0-r0'

RUN wget -4 -c https://github.com/jonnenauha/prometheus_varnish_exporter/releases/download/1.6/prometheus_varnish_exporter-1.6.linux-386.tar.gz -O - | tar -xz prometheus_varnish_exporter-1.6.linux-386/prometheus_varnish_exporter --strip-components 1

CMD ["./prometheus_varnish_exporter"]
