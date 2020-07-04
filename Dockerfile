FROM arm64v8/node:10.18.1-alpine3.11
# FROM arm64v8/node:12.18.1-alpine3.11

WORKDIR /opt

ENV DOCKERIZE_VERSION v0.6.1
ENV ARCH linux-armhf
ENV GROWI_VERSION v4.0.7
# ENV GROWI_VERSION v3.6.3

# USER root
RUN apk --no-cache --virtual .del add curl git python make g++ wget openssl

# Installation growi
RUN git clone https://github.com/weseek/growi growi

WORKDIR /opt/growi

RUN git checkout -b ${GROWI_VERSION} refs/tags/${GROWI_VERSION}

# install node_modules
RUN yarn --network-timeout 6000000

# build Growi
RUN npm run build:prod

# Download dockerize
RUN wget https://github.com/jwilder/dockerize/releases/download/${DOCKERIZE_VERSION}/dockerize-${ARCH}-${DOCKERIZE_VERSION}.tar.gz \
    && tar -C /usr/local/bin -xzvf dockerize-${ARCH}-${DOCKERIZE_VERSION}.tar.gz \
    && rm dockerize-${ARCH}-${DOCKERIZE_VERSION}.tar.gz

RUN apk del .del
