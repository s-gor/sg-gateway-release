#!/usr/bin/env bash
set -Eeuo pipefail

RELEASE_TAG="v0.1.0-023.03"
RUN_FILE="SG-Gateway-0.1.0-023.03-FULL.run"
EXPECTED_SHA256="692bcd18e423cf6732f3f61f47688dccff95abab1dac9be5c70388dc19991981"
DOWNLOAD_URL="https://github.com/s-gor/sg-gateway-release/releases/download/v0.1.0-023.03/SG-Gateway-0.1.0-023.03-FULL.run"

[[ -f /opt/sg-gateway/VERSION ]] || { echo "[SG-Gateway] Existing installation not found. Use Clean Install."; exit 1; }

TMP="$(mktemp "/tmp/sg-gateway-update.XXXXXX.run")"
cleanup() { rm -f "$TMP"; }
trap cleanup EXIT INT TERM

echo "[SG-Gateway] Update 0.1.0-023.03: downloading verified release package..."
curl -4 -fL --retry 3 --retry-delay 2 "$DOWNLOAD_URL" -o "$TMP"

ACTUAL_SHA256="$(sha256sum "$TMP" | awk '{print $1}')"
if [[ "$ACTUAL_SHA256" != "$EXPECTED_SHA256" ]]; then
  echo "[SG-Gateway] ERROR: SHA-256 mismatch." >&2
  echo "[SG-Gateway] Expected: $EXPECTED_SHA256" >&2
  echo "[SG-Gateway] Actual:   $ACTUAL_SHA256" >&2
  exit 1
fi

echo "[SG-Gateway] SHA256 OK"
chmod 0755 "$TMP"
bash "$TMP" --verify-only
exec bash "$TMP"
