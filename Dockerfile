ARG ALPINE_VERSION='3.21.2'

FROM "alpine:${ALPINE_VERSION}"

ARG GZIP_VERSION='1.13'
ARG GZIP_DOWNLOADS_URL='https://ftp.gnu.org/gnu/gzip'

RUN apk add --no-cache --virtual .build-deps build-base curl

RUN cd "/tmp" \
  && curl "${GZIP_DOWNLOADS_URL}/gzip-${GZIP_VERSION}.tar.gz" -o "gzip-${GZIP_VERSION}.tar.gz" \
  && tar -xvzf "gzip-${GZIP_VERSION}.tar.gz" \
  && cd "gzip-${GZIP_VERSION}" \
  && test -f configure || ./bootstrap \
  && ./configure \
  && make \
  && make install \
  && cd / \
  && rm -fr "/tmp/gzip-${GZIP_VERSION}*"

RUN apk del .build-deps

COPY entrypoint.sh /entrypoint.sh
ENTRYPOINT [ "/entrypoint.sh" ]
