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
    podman-tui \
    python3-ramalama \
    qemu-kvm \
    restic \
    rclone \
    sysprof \
    tiptop \
    zsh

dnf5 install --enable-repo="copr:copr.fedorainfracloud.org:ublue-os:packages" -y \
    ublue-setup-services

# Adding repositories should be a LAST RESORT. Contributing to Terra or `ublue-os/packages` is much preferred
# over using random coprs. Please keep this in mind when adding external dependencies.
# If adding any dependency, make sure to always have it disabled by default and _only_ enable it on `dnf install`

dnf5 config-manager addrepo --set=baseurl="https://packages.microsoft.com/yumrepos/vscode" --id="vscode"
dnf5 config-manager setopt vscode.enabled=0
# FIXME: gpgcheck is broken for vscode due to it using `asc` for checking
# seems to be broken on newer rpm security policies.
dnf5 config-manager setopt vscode.gpgcheck=0
dnf5 install --nogpgcheck --enable-repo="vscode" -y \
    code
