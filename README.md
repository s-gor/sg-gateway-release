# SG-Gateway Releases

Official public release channel for SG-Gateway.

This repository contains **release artifacts and public bootstrap scripts only**. The SG-Gateway development repository is private and is not published here.

## Current release

**SG-Gateway 23.03** — `v0.1.0-023.03`

Release assets:
- `SG-Gateway-0.1.0-023.03-FULL.run`
- `SG-Gateway-0.1.0-023.03-FULL-SHA256.txt`
- `SG-Gateway-0.1.0-023.03-FULL-TRANSFER.zip`

Source provenance: private build SHA `592cb41bdd1bdb8994af66fc3a07efee5da1ab36`.

The public package contains a protected Python runtime payload rather than readable application Python source. Runtime files and the release package are SHA-256 verified before installation.

## Clean Install

```bash
curl -4 -fsSL https://raw.githubusercontent.com/s-gor/sg-gateway-release/main/install.sh | sudo bash
```

## Update

```bash
curl -4 -fsSL https://raw.githubusercontent.com/s-gor/sg-gateway-release/main/update.sh | sudo bash
```

## Full Uninstall

```bash
curl -4 -fsSL https://raw.githubusercontent.com/s-gor/sg-gateway-release/main/uninstall.sh | sudo bash
```

## Integrity

SHA-256 for `SG-Gateway-0.1.0-023.03-FULL.run`:

`2991a011ea943f8db3528475eb71b600b5c643f0a14f89d3d3854482b0d14d38`

The bootstrap verifies this checksum and runs the package's internal `--verify-only` check before installation.
