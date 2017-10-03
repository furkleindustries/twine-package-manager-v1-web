FROM nginx:1.13

ARG TERM=xterm-256color

ARG DEBIAN_FRONTEND=noninteractive

RUN mkdir /etc/twinepm-server-heroku/web/

WORKDIR /etc/twinepm-server-heroku/web/

COPY . .

RUN \
    apt-get update && \
    apt-get install -y python3 && \
    scripts/installWebDependencies