# SG-Gateway Releases

Official public release channel for SG-Gateway.

This repository contains **release artifacts and public bootstrap scripts only**. The SG-Gateway development repository is private and is not published here.

## Current release

**SG-Gateway 23.03** — `v0.1.0-023.03`

Release assets:
- `SG-Gateway-0.1.0-023.03-FULL.run`
- `SG-Gateway-0.1.0-023.03-FULL-SHA256.txt`
- `SG-Gateway-0.1.0-023.03-FULL-TRANSFER.zip`

Source provenance: private build SHA `b1acf346bdc2252b983858a652006d478fc1300c`.

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

`758753019a10570de1da3bb0d1d5e6d5350125adbe9fa7bbc211972a6d867e87`

The bootstrap verifies this checksum and runs the package's internal `--verify-only` check before installation.
