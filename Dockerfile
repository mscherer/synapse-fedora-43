FROM quay.io/fedora/fedora-minimal:43

LABEL org.opencontainers.image.source="https://github.com/mscherer/stalwart-custom-container"
LABEL maintainer="mscherer@"
WORKDIR /srv/

RUN dnf install -y matrix-synapse+postgres matrix-synapse+systemd --setopt=install_weak_deps=False && dnf clean all

COPY start.sh /usr/local/bin/start.sh

VOLUME /var/lib/synapse
VOLUME /etc/synapse

ENTRYPOINT ["/usr/local/bin/start.sh"]
