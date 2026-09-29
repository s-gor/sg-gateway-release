# SG-Gateway Releases

Official public release channel for SG-Gateway.

This repository contains **release artifacts and public bootstrap scripts only**.  
The SG-Gateway development source code is maintained separately and is not published here.

## Public files

- `install.sh` — Clean Install bootstrap
- `update.sh` — Update bootstrap
- `uninstall.sh` — Full Uninstall bootstrap
- `SHA256SUMS` — checksums for published release artifacts

Release packages will be published through **GitHub Releases**.

## Current status

The new release channel is being prepared for SG-Gateway 23.03.  
Until the first release asset is published, the bootstrap scripts intentionally stop without changing the server.

## Integrity

Every published SG-Gateway package will have a SHA-256 checksum. Bootstrap scripts must verify the checksum before executing a downloaded package.

---

SG-Gateway release distribution repository.
