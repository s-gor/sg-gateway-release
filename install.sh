#!/usr/bin/env bash
set -Eeuo pipefail

RELEASE_TAG="v0.1.0-023.03"
RUN_FILE="SG-Gateway-0.1.0-023.03-FULL.run"
EXPECTED_SHA256="1ad66cad99b85dafda4f8998391f215c7294643605f0dedfce2213eac2f4e5f1"
DOWNLOAD_URL="https://github.com/s-gor/sg-gateway-release/releases/download/v0.1.0-023.03/SG-Gateway-0.1.0-023.03-FULL.run"

TMP="$(mktemp "/tmp/sg-gateway-install.XXXXXX.run")"
cleanup() { rm -f "$TMP"; }
trap cleanup EXIT INT TERM

echo "[SG-Gateway] Clean Install 0.1.0-023.03: downloading verified release package..."
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
