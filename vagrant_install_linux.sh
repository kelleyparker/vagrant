#!/bin/bash
# Installs VirtualBox (distro package) and Vagrant (HashiCorp apt repo)
# on Debian/Ubuntu.  Usage: ./vagrant_install_linux.sh
set -euo pipefail

if ! command -v apt-get >/dev/null; then
  echo "This script supports Debian/Ubuntu (apt) only." >&2
  exit 1
fi

if [[ $EUID -ne 0 ]] && ! command -v sudo >/dev/null; then
  echo "Run as root or install sudo." >&2
  exit 1
fi

dir="$(cd "$(dirname "${BASH_SOURCE[0]}")" && pwd)"

echo "Installing VirtualBox..."
sudo apt-get update
sudo apt-get install -y virtualbox

echo "Installing Vagrant..."
"$dir/ubuntu_vagrant_install.sh"

echo "Installed: $(VBoxManage --version) / $(vagrant --version)"
