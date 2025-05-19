#!/usr/bin/bash
set -xeuo pipefail

mkdir -p /usr/share/gamescope-session-plus/
curl -Lo /usr/share/gamescope-session-plus/bootstrap_steam.tar.gz https://large-package-sources.nobaraproject.org/bootstrap_steam.tar.gz
dnf5 install --enable-repo="copr:copr.fedorainfracloud.org:bazzite-org:bazzite" -y \
    gamescope-session-plus \
    gamescope-session-steam

dnf5 install -y \
    android-tools \
    bcc \
    bpftop \
    bpftrace \
    flatpak-builder \
    ccache \
    nicstat \
    numactl \
    podman-machine \
    podman-docker \
    podman-tui \
    qemu-kvm \
    restic \
    rclone \
    sysprof \
    tiptop

dnf5 install --enable-repo="copr:copr.fedorainfracloud.org:ublue-os:packages" -y \
    ublue-setup-services

# Adding repositories should be a LAST RESORT. Contributing to Terra or `ublue-os/packages` is much preferred
# over using random coprs. Please keep this in mind when adding external dependencies.
# If adding any dependency, make sure to always have it disabled by default and _only_ enable it on `dnf install`
