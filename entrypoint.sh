#!/usr/bin/env bash
set -euo pipefail

: "${VIVAVOX_NUMBER:?Missing VIVAVOX_NUMBER}"
: "${VIVAVOX_PASSWORD:?Missing VIVAVOX_PASSWORD}"

echo "[entrypoint] Rendering pjsip.conf..."
sed \
  -e "s|__VIVAVOX_NUMBER__|${VIVAVOX_NUMBER}|g" \
  -e "s|__VIVAVOX_PASSWORD__|${VIVAVOX_PASSWORD}|g" \
  /opt/templates/pjsip.conf.tpl > /etc/asterisk/pjsip.conf

echo "[entrypoint] Installing extensions.conf..."
cp /opt/templates/extensions.conf /etc/asterisk/extensions.conf

# Log più verbosi (utile per debug su Render logs)
mkdir -p /var/log/asterisk
touch /var/log/asterisk/full

echo "[entrypoint] Starting Asterisk..."
exec asterisk -fvvvv
