FROM debian:11-slim

ENV DEBIAN_FRONTEND=noninteractive

RUN apt-get update && \
    apt-get install -y --no-install-recommends \
      asterisk \
      ca-certificates \
      bash \
      tini && \
    rm -rf /var/lib/apt/lists/*

COPY templates/ /opt/templates/
COPY entrypoint.sh /entrypoint.sh
RUN chmod +x /entrypoint.sh

ENTRYPOINT ["/usr/bin/tini", "--"]
CMD ["/entrypoint.sh"]

