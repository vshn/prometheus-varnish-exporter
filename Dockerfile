FROM centos:latest

RUN yum upgrade -y && \
    yum install wget -y

RUN wget -c https://github.com/jonnenauha/prometheus_varnish_exporter/releases/download/1.6/prometheus_varnish_exporter-1.6.linux-386.tar.gz -O - | tar -xz prometheus_varnish_exporter-1.6.linux-386/prometheus_varnish_exporter --strip-components 1

FROM alpine:latest

COPY --from=0 prometheus_varnish_exporter /bin/

CMD ["./bin/prometheus_varnish_exporter"]
