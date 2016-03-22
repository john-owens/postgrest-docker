FROM centos

RUN yum install -y tar wget postgresql-devel

ENV POSTGREST_VERSION 0.3.1.0
ENV PLATFORM centos
RUN wget http://github.com/begriffs/postgrest/releases/download/v${POSTGREST_VERSION}/postgrest-${POSTGREST_VERSION}-${PLATFORM}.tar.xz
RUN tar --xz -xvf postgrest-${POSTGREST_VERSION}-${PLATFORM}.tar.xz
RUN mv postgrest /usr/local/bin/postgrest

EXPOSE 3000
ENTRYPOINT ["/usr/local/bin/postgrest"]

#docker run --name test-postgres -e POSTGRES_PASSWORD=postgres -d postgres
#docker run -P --name preston_dev --link test-postgres:postgres -d preston_c
