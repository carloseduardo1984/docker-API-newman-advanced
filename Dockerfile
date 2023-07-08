FROM ubuntu:latest

# ENV HTTP_PROXY="http://<ip-address>:<port>"
# ENV HTTPS_PROXY="https://<ip-address>:<port>"
# ENV NO_PROXY="*.<domain>,127.0.0.0/8"

ENV HTTP_PROXY="https://us1.proxysite.com/process.php?d=rcnYhjotlFFuJyJgwZzBTk87%2FtA%3D&b=7&f=norefer"
ENV HTTPS_PROXY="https://us1.proxysite.com/process.php?d=rcnYhjotlFFuJyJgwZzBTk87%2FtA%3D&b=7&f=norefer"
ENV NO_PROXY="https://us1.proxysite.com/process.php?d=rcnYhjotlFFuJyJgwZzBTk87%2FtA%3D&b=7&f=norefer"

# Core dependencies
RUN apt-get install -y git-core curl build-essential openssl libssl-dev \
 && git clone https://github.com/nodejs/node.git \
 && cd node \
 && ./configure \
 && make \
 && sudo make install
# Node

RUN npm install -g newman newman-reporter-html

WORKDIR /etc/newman

ENTRYPOINT ["newman"]
