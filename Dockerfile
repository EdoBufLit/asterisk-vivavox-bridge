FROM debian:11-slim

ENV DEBIAN_FRONTEND=noninteractive

RUN apt-get update && \
    apt-get install -y --no-install-recommends \
      asterisk \
      asterisk-pjsip \
      ca-certificates \
      bash \
      tini && \
    rm -rf /var/lib/apt/lists/*

# Copia template config + entrypoint
COPY templates/ /opt/templates/
COPY entrypoint.sh /entrypoint.sh
RUN chmod +x /entrypoint.sh

# (Opzionale) se vuoi forzare un file audio tuo
# COPY sounds/hello-world.wav /var/lib/asterisk/sounds/en/hello-world.wav

ENTRYPOINT ["/usr/bin/tini", "--"]
CMD ["/entrypoint.sh"]
