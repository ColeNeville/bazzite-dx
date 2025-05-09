#!/usr/bin/env bash
set -xeuo pipefail

systemctl enable podman.socket
systemctl enable ublue-system-setup.service
systemctl --global enable ublue-user-setup.service
