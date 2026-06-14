FROM quay.io/fedora/fedora-minimal@sha256:6acf51b19968079f81c9b980641e50837b0fb8063b2e8510477671161510544b

LABEL org.opencontainers.image.source="https://github.com/mscherer/stalwart-custom-container"
LABEL maintainer="mscherer@"
WORKDIR /srv/

RUN dnf install -y matrix-synapse+postgres --setopt=install_weak_deps=False && dnf clean all

COPY start.sh /usr/local/bin/start.sh

VOLUME /var/lib/synapse
VOLUME /etc/synapse

ENTRYPOINT ["/usr/local/bin/start.sh"]
