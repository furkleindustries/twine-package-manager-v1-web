FROM nginx:1.13

EXPOSE 443

ARG TERM=xterm-256color

ARG DEBIAN_FRONTEND=noninteractive

RUN mkdir -p /etc/twine-package-manager/web/

WORKDIR /etc/twine-package-manager/web/

COPY . .

RUN \
    apt-get update && \
    apt-get install -y \
        --no-install-recommends \
        --no-install-suggests \
        ca-certificates \
        libffi-dev \
        wget \
        zlib1g-dev && \
    cd /tmp/ && \
    wget https://www.python.org/ftp/python/3.7.0/Python-3.7.0a1.tar.xz && \
    tar xvf Python-3.7.0a1.tar.xz && \
    cd Python-3.7.0a1/ && \
    ./configure && \
    make && \
    make install && \
    /etc/twine-package-manager/web/scripts/installWebDependencies