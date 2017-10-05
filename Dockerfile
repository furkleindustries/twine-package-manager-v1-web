FROM nginx:1.13

EXPOSE 443

ARG TERM=xterm-256color

ARG DEBIAN_FRONTEND=noninteractive

RUN mkdir -p /etc/twine-package-manager/web/

WORKDIR /etc/twine-package-manager/web/

COPY . .

RUN \
    apt-get update && \
    apt-get install -y python3.7 \
        --no-install-recommends \
        --no-install-suggests && \
    scripts/installWebDependencies