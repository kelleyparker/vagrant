#!/bin/bash
# Bootstrap script for the Ubuntu 24.04 lab VMs. Runs as root via Vagrant.
# Environment (set by the Vagrantfile):
#   VM_NAME      hostname of this VM
#   SSH_PUBKEY   host public key to add to the vagrant user (optional)
#   HOSTS_BLOCK  extra lines for /etc/hosts (optional)
set -euo pipefail
export DEBIAN_FRONTEND=noninteractive

echo "[bootstrap] ${VM_NAME:-vm}: updating packages"
apt-get update -y
apt-get install -y --no-install-recommends curl wget vim git htop net-tools dnsutils ca-certificates

# Authorize the host's SSH key for the vagrant user (idempotent).
if [[ -n "${SSH_PUBKEY:-}" ]]; then
  home=/home/vagrant
  install -d -m 700 -o vagrant -g vagrant "$home/.ssh"
  touch "$home/.ssh/authorized_keys"
  grep -qxF "$SSH_PUBKEY" "$home/.ssh/authorized_keys" || echo "$SSH_PUBKEY" >> "$home/.ssh/authorized_keys"
  chown vagrant:vagrant "$home/.ssh/authorized_keys"
  chmod 600 "$home/.ssh/authorized_keys"
fi

# Optional static /etc/hosts entries, replaced on every run.
if [[ -n "${HOSTS_BLOCK:-}" ]]; then
  sed -i '/# BEGIN vagrant-lab/,/# END vagrant-lab/d' /etc/hosts
  { echo "# BEGIN vagrant-lab"; echo "$HOSTS_BLOCK"; echo "# END vagrant-lab"; } >> /etc/hosts
fi

echo "[bootstrap] ${VM_NAME:-vm}: done"
