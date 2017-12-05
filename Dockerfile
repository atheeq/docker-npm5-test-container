FROM node:boron-alpine

RUN mkdir /temp
COPY package.json /temp/package.json
RUN cd /temp && \
    npm install npm@5 && \
    rm -rf /usr/local/lib/node_modules && \
    mv node_modules /usr/local/lib/ && \
    cd ~ && \
    rm -rf /temp

RUN apk update
RUN apk add git
RUN apk --no-cache add ca-certificates wget
RUN wget -q -O /etc/apk/keys/sgerrand.rsa.pub https://raw.githubusercontent.com/sgerrand/alpine-pkg-glibc/master/sgerrand.rsa.pub
RUN wget https://github.com/sgerrand/alpine-pkg-glibc/releases/download/2.25-r0/glibc-2.25-r0.apk
RUN apk add glibc-2.25-r0.apk
RUN npm -v
RUN node -v