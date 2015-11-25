# hitch is a network proxy that terminates TLS/SSL connections and forwards the unencrypted traffic to some backend.
# It's designed to handle 10s of thousands of connections efficiently on multicore machines.
# https://hitch-tls.org/

FROM centos:latest

MAINTAINER Ismael Puerto <ipuertofreire@gmail.com>

ENV HITCH_PKG_NAME hitch-1.1.0

RUN yum -y update; yum install -y yum-plugin-remove-with-leaves automake gcc libev-devel openssl-devel make python-docutils openssl ; yum clean all
RUN curl -OLs https://github.com/varnish/hitch/archive/$HITCH_PKG_NAME.tar.gz
RUN tar -xf $HITCH_PKG_NAME.tar.gz
RUN cd hitch-$HITCH_PKG_NAME && sh ./bootstrap && ./configure && make && make install

RUN yum -y remove automake gcc openssl-devel python-docutils --remove-leaves ; yum clean all

ADD config/hitch.conf /etc/hitch.conf
ADD generate_ssl_and_start.sh /generate_ssl_and_start.sh

RUN chmod -v +x /generate_ssl_and_start.sh

RUN useradd hitch

EXPOSE 443

CMD ["/generate_ssl_and_start.sh"]
