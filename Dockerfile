FROM gliderlabs/alpine:3.4
MAINTAINER Peter Waller <p@pwaller.net>

RUN apk --update add --virtual build-dependencies --no-cache \
        build-base \
        ca-certificates \
        wget \
 && update-ca-certificates \
 && rm -rf /var/cache/apk/* \
 && cd / \
 && wget http://github.com/libfuse/libfuse/releases/download/fuse_2_9_5/fuse-2.9.5.tar.gz \
 && tar zxf fuse-2.9.5.tar.gz \
 && cd fuse-2.9.5 \
 && ./configure \
 && make -C util LDFLAGS="-all-static -Wl,-v -Wl,--strip-all" V=1 fusermount \
 && cp util/fusermount /usr/local/bin \
 && rm -rf /fuse-* \
 && apk del build-dependencies
