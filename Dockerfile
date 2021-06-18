FROM centos

WORKDIR /bin

RUN yum upgrade -y && \
    yum install wget -y

RUN wget -c https://github.com/jonnenauha/prometheus_varnish_exporter/releases/download/1.6/prometheus_varnish_exporter-1.6.linux-386.tar.gz -O - | tar -xz prometheus_varnish_exporter-1.6.linux-386/prometheus_varnish_exporter --strip-components 1

ENTRYPOINT ["./prometheus_varnish_exporter"]