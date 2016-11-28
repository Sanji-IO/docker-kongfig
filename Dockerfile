FROM node:6-slim

WORKDIR /config

ENV KONGFIG_VERSION=1.2.21

ENV BETWEEN_CHECK_DELAY=2 \
    POST_START_DELAY=0 \
    CHECK_ATTEMPTS=60 \
    CONFIG= \
    DEBUG=false

COPY ./entrypoint.sh /usr/local/bin/entrypoint

RUN npm install kongfig@{$KONGFIG_VERSION} -g && \
    chmod a+x /usr/local/bin/entrypoint

ENTRYPOINT ["entrypoint"]
