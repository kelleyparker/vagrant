#!/usr/bin/env bash
# Install VirtualBox and Vagrant on Ubuntu/Debian.
# Vagrant comes from the HashiCorp apt repository, so `apt upgrade` keeps it current.
set -euo pipefail

if ! command -v apt-get >/dev/null; then
  echo "This script supports Ubuntu/Debian only." >&2
  exit 1
fi

as_root() {
  if [ "$(id -u)" -eq 0 ]; then "$@"; else sudo "$@"; fi
}

as_root apt-get update
as_root apt-get install -y wget gpg lsb-release ca-certificates virtualbox

# HashiCorp apt repository
wget -qO- https://apt.releases.hashicorp.com/gpg \
  | as_root gpg --dearmor --yes -o /usr/share/keyrings/hashicorp-archive-keyring.gpg

codename="$(. /etc/os-release && echo "${UBUNTU_CODENAME:-${VERSION_CODENAME:-$(lsb_release -cs)}}")"
echo "deb [arch=$(dpkg --print-architecture) signed-by=/usr/share/keyrings/hashicorp-archive-keyring.gpg] https://apt.releases.hashicorp.com ${codename} main" \
  | as_root tee /etc/apt/sources.list.d/hashicorp.list >/dev/null

as_root apt-get update
as_root apt-get install -y vagrant

vagrant --version
VBoxManage --version
