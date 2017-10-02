FROM maven:3.5-jdk-8

WORKDIR /iri

RUN git clone -b v1.3.2 https://github.com/iotaledger/iri.git /iri/
RUN mvn clean package

COPY conf/* /iri/conf/
COPY /docker-entrypoint.sh /

ENV MEMORY 2G

WORKDIR /iri/data

VOLUME /iri/data
VOLUME /iri/conf

ENTRYPOINT ["/docker-entrypoint.sh"]

