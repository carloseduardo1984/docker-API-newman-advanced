FROM ubuntu:latest

# ENV HTTP_PROXY="http://<ip-address>:<port>"
# ENV HTTPS_PROXY="https://<ip-address>:<port>"
# ENV NO_PROXY="*.<domain>,127.0.0.0/8"

ENV HTTP_PROXY="https://us1.proxysite.com/process.php?d=rcnYhjotlFFuJyJgwZzBTk87%2FtA%3D&b=7&f=norefer"
ENV HTTPS_PROXY="https://us1.proxysite.com/process.php?d=rcnYhjotlFFuJyJgwZzBTk87%2FtA%3D&b=7&f=norefer"
ENV NO_PROXY="https://us1.proxysite.com/process.php?d=rcnYhjotlFFuJyJgwZzBTk87%2FtA%3D&b=7&f=norefer"

# Core dependencies
RUN apt-get update && apt-get install -y curl sudo

# Node
# Uncomment your target version
# RUN curl -fsSL https://deb.nodesource.com/setup_10.x | sudo -E bash -
# RUN curl -fsSL https://deb.nodesource.com/setup_12.x | sudo -E bash -
# RUN curl -fsSL https://deb.nodesource.com/setup_14.x | sudo -E bash -
RUN curl -fsSL https://deb.nodesource.com/setup_16.x | sudo -E bash -
RUN sudo apt-get install -y nodejs
RUN echo "NODE Version:" && node -v

RUN npm install -g newman newman-reporter-html

WORKDIR /etc/newman

ENTRYPOINT ["newman"]
