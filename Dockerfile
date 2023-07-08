FROM ubuntu:latest

# ENV HTTP_PROXY="http://<ip-address>:<port>"
# ENV HTTPS_PROXY="https://<ip-address>:<port>"
# ENV NO_PROXY="*.<domain>,127.0.0.0/8"

# Core dependencies
RUN apt-get update && apt-get install -y \
  ca-certificates \
  curl

ARG NODE_VERSION=14.16.0
ARG NODE_PACKAGE=node-v$NODE_VERSION-linux-x64
ARG NODE_HOME=/opt/$NODE_PACKAGE

ENV NODE_PATH $NODE_HOME/lib/node_modules
ENV PATH $NODE_HOME/bin:$PATH

RUN curl https://nodejs.org/dist/v$NODE_VERSION/$NODE_PACKAGE.tar.gz | tar -xzC /opt/

# comes with npm
RUN npm install -g typescript
# Node

RUN npm install -g newman newman-reporter-html

WORKDIR /etc/newman

ENTRYPOINT ["newman"]
