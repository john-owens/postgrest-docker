#NOT WORKING ATM
FROM alpine:3.2
MAINTAINER john.owens

USER root

RUN \
  echo ipv6 >> /etc/modules && \
  echo postgresql-dev >> /etc/modules && \
  apk update && \
  apk upgrade && \
  apk add --update ca-certificates curl
#  RUN yum install -y tar wget postgresql-devel
WORKDIR /tmp

#  sed -i -e 's#:/bin/[^:].*$#:/sbin/nologin#' /etc/passwd && \
RUN \
  mkdir postgrest

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
  mv postgrest /usr/local/bin/postgrest

  #chmod +x /usr/local/postgrest

CMD postgrest  --db-host localhost  --db-port 5432     \
               --db-name my_db      --db-user postgres \
               --db-pass foobar     --db-pool 200      \
               --anonymous postgres --port 3000        \
               --v1schema public
WORKDIR /root
EXPOSE 3000
