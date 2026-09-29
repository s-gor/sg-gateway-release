#!/usr/bin/env bash
set -euo pipefail

BASE_URL="https://raw.githubusercontent.com/s-gor/sg-gateway-release/main"
ARTIFACT="releases/SG-Gateway-TEST.run"
TMP="$(mktemp)"
trap 'rm -f "$TMP"' EXIT

echo "[SG-Gateway] Downloading TEST release..."
curl -4 -fsSL "$BASE_URL/$ARTIFACT" -o "$TMP"

EXPECTED="$(curl -4 -fsSL "$BASE_URL/SHA256SUMS" | awk '$2=="'"$ARTIFACT"'" {print $1}')"
[ -n "$EXPECTED" ] || { echo "[SG-Gateway] ERROR: checksum not found"; exit 1; }

ACTUAL="$(sha256sum "$TMP" | awk '{print $1}')"
[ "$ACTUAL" = "$EXPECTED" ] || { echo "[SG-Gateway] ERROR: checksum mismatch"; exit 1; }

echo "[SG-Gateway] SHA256 OK"
chmod +x "$TMP"
exec "$TMP"
