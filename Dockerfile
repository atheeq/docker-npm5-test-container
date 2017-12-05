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
RUN apk add libelf git ca-certificates
RUN npm -v
RUN node -v