FROM alpine:latest

RUN apk add --no-cache \
    wget \
    varnish \
    tar

RUN wget -4 -c https://github.com/jonnenauha/prometheus_varnish_exporter/releases/download/1.6/prometheus_varnish_exporter-1.6.linux-386.tar.gz -O - | tar -xz prometheus_varnish_exporter-1.6.linux-386/prometheus_varnish_exporter --strip-components 1

FROM alpine:latest

COPY --from=0 prometheus_varnish_exporter /bin/
COPY --from=0 /usr/bin/varnishstat /bin/

CMD ["./bin/prometheus_varnish_exporter"]
