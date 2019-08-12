FROM ubuntu:18.04

RUN apt-get -y update

RUN apt-get -y upgrade

RUN apt-get install -y nginx

RUN apt-get install -y gdbserver

RUN apt-get install -y redis

RUN apt-get install -y libevent-dev

RUN apt-get install -y libv8-dev

RUN apt-get update && apt-get install -y libcurl4-openssl-dev

RUN apt-get install -y libpoco-dev

RUN apt-get update

RUN apt-get install -y libboost-all-dev

RUN apt-get install -y libcpprest-dev

RUN apt-get install -y unzip

RUN apt-get update --fix-missing

RUN apt-get install -y curl

RUN apt-get install -y git

RUN apt-get install -y autoconf automake libtool curl make g++ unzip

RUN git clone https://github.com/protocolbuffers/protobuf.git
RUN (cd protobuf && autoreconf --install && git checkout v3.6.1 && git submodule update --init --recursive && ./autogen.sh && ./configure && make && make install)

RUN ldconfig

RUN git clone https://github.com/neon-vortex/cassandra-library /tmp/cassandra-library

RUN cp /tmp/cassandra-library/linux/libcassandra.so /usr/local/lib/

RUN apt-get install -y openjdk-8-jdk

RUN echo "deb http://www.apache.org/dist/cassandra/debian 311x main" |  tee -a /etc/apt/sources.list.d/cassandra.sources.list
RUN curl https://www.apache.org/dist/cassandra/KEYS |  apt-key add -
RUN apt-get update
RUN DEBIAN_FRONTEND=noninteractive apt-get install -y -q cassandra

RUN apt-get install -y libuv1.dev

RUN apt-get install -y curl
RUN apt-get install -y nano

