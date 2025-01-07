ARG BASE_IMAGE="quay.io/fedora/fedora"
ARG BASE_VERSION="41"

FROM ${BASE_IMAGE}:${BASE_VERSION}

LABEL org.opencontainers.image.source = "https://github.com/gbraad-devenv/countdown-test"

RUN dnf install -y systemd

COPY countdown.timer   /etc/systemd/system
COPY countdown.service /etc/systemd/system

RUN systemctl enable countdown.timer

ENTRYPOINT ["/sbin/init"]
