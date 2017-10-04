FROM nginx:1.13

EXPOSE 443

ARG TERM=xterm-256color

ARG DEBIAN_FRONTEND=noninteractive

RUN mkdir -p /etc/twinepm-server-heroku/web/

WORKDIR /etc/twinepm-server-heroku/web/

COPY . .

RUN \
    apt-get update && \
    apt-get install -y python3 --no-install-recommends && \
    scripts/installWebDependencies