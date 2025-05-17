FROM node:alpine AS setup

USER root

RUN apk update && \
    apk add --no-cache git && \
    npm install -g npm npm-check-updates

FROM setup AS main

ARG NODE_DIR=/home/node/app

RUN mkdir -p $NODE_DIR && \
    chown node:node $NODE_DIR

WORKDIR $NODE_DIR

USER node

CMD ["npm", "run", "start"]
