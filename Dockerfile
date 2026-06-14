FROM quay.io/fedora/fedora-minimal@sha256:1e49d1043c41408df854cc0389d5e9f22eff2689490dfe6ddc5cac8cd4fea843

LABEL org.opencontainers.image.source="https://github.com/mscherer/stalwart-custom-container"
LABEL maintainer="mscherer@"
WORKDIR /srv/

RUN dnf install -y matrix-synapse+postgres --setopt=install_weak_deps=False && dnf clean all

COPY start.sh /usr/local/bin/start.sh

VOLUME /var/lib/synapse
VOLUME /etc/synapse

ENTRYPOINT ["/usr/local/bin/start.sh"]
