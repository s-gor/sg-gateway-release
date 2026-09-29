#!/usr/bin/env bash
set -Eeuo pipefail

UNINSTALLER="/opt/sg-gateway/deploy/full-uninstall-ubuntu.sh"
[[ -f "$UNINSTALLER" ]] || { echo "[SG-Gateway] Installed uninstaller not found: $UNINSTALLER" >&2; exit 1; }
exec bash "$UNINSTALLER"
