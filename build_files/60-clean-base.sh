#!/usr/bin/env bash
set -xeuo pipefail

# Remove opensc if it was installed as a dependency or by other means
dnf5 remove -y opensc
