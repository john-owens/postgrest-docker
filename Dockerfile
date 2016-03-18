FROM alpine:3.2
MAINTAINER john.owens

USER root

RUN \
  echo ipv6 >> /etc/modules && \
  apk update && \
  apk upgrade && \
  apk add --update ca-certificates curl

WORKDIR /tmp

#  sed -i -e 's#:/bin/[^:].*$#:/sbin/nologin#' /etc/passwd && \
RUN \
  mkdir postgrest

ENV PREST_HOME /usr/local/postgrest
#ENV PATH "$PATH:$PREST_HOME"
WORKDIR /tmp/postgrest

  #tar xf postgrest-${version}-${platform}.tar.xz && \
RUN \
  version="0.3.1.0" && \
  platform="centos" && \
  url="https://github.com/begriffs/postgrest/releases/download/v${version}/postgrest-${version}-${platform}.tar.xz" && \
  curl -O -L "${url}" && \
  unxz -d postgrest-${version}-${platform}.tar.xz && \
  tar xf postgrest-${version}-${platform}.tar && \
  ls -al && \
  rm *.tar && \
  mkdir -p ${PREST_HOME} && \
  mv * ${PREST_HOME} && \
  chmod +x ${PREST_HOME}/postgrest && \
  ls ${PREST_HOME}/ -al

RUN echo $PATH

WORKDIR /root
