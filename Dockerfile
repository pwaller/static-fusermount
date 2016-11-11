FROM gliderlabs/alpine:3.4
MAINTAINER Peter Waller <p@pwaller.net>

## Install build dependencies
RUN apk add --no-cache \
        build-base \
 && rm -rf /var/cache/apk/*

ADD https://github.com/libfuse/libfuse/releases/download/fuse_2_9_5/fuse-2.9.5.tar.gz /

RUN tar zxf fuse-2.9.5.tar.gz
WORKDIR /fuse-2.9.5/

RUN ./configure
RUN make -C util LDFLAGS="-all-static -Wl,-v -Wl,--strip-all" V=1 fusermount
