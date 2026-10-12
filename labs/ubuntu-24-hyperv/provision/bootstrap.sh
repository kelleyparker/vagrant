#!/usr/bin/env bash
# Minimal first-boot provisioning for the Ubuntu 24.04 lab VMs.
#
# Environment (set by the Vagrantfile):
#   VM_NAME      hostname for this VM
#   SSH_PUBKEY   host public key to authorize for the vagrant user (optional)
#   HOSTS_BLOCK  extra /etc/hosts lines (optional)
set -euo pipefail

VM_NAME="${VM_NAME:-}"
SSH_PUBKEY="${SSH_PUBKEY:-}"
HOSTS_BLOCK="${HOSTS_BLOCK:-}"
VAGRANT_HOME="/home/vagrant"

# --- Hostname -----------------------------------------------------------
if [ -n "$VM_NAME" ]; then
  hostnamectl set-hostname "$VM_NAME"
  # Keep sudo from complaining that it cannot resolve the hostname.
  if grep -qE '^127\.0\.1\.1\s' /etc/hosts; then
    sed -i -E "s/^127\.0\.1\.1\s.*/127.0.1.1 ${VM_NAME}/" /etc/hosts
  else
    echo "127.0.1.1 ${VM_NAME}" >> /etc/hosts
  fi
fi

# --- Extra /etc/hosts entries (idempotent) ------------------------------
if [ -n "$HOSTS_BLOCK" ]; then
  sed -i '/# BEGIN vagrant-lab/,/# END vagrant-lab/d' /etc/hosts
  {
    echo "# BEGIN vagrant-lab"
    printf '%s\n' "$HOSTS_BLOCK"
    echo "# END vagrant-lab"
  } >> /etc/hosts
fi

# --- Authorize the host's SSH key (idempotent) --------------------------
if [ -n "$SSH_PUBKEY" ]; then
  install -d -m 700 -o vagrant -g vagrant "$VAGRANT_HOME/.ssh"
  touch "$VAGRANT_HOME/.ssh/authorized_keys"
  grep -qxF "$SSH_PUBKEY" "$VAGRANT_HOME/.ssh/authorized_keys" \
    || echo "$SSH_PUBKEY" >> "$VAGRANT_HOME/.ssh/authorized_keys"
  chown vagrant:vagrant "$VAGRANT_HOME/.ssh/authorized_keys"
  chmod 600 "$VAGRANT_HOME/.ssh/authorized_keys"
else
  echo "bootstrap: no SSH_PUBKEY supplied, skipping key install"
fi

# --- Base packages ------------------------------------------------------
export DEBIAN_FRONTEND=noninteractive
apt-get update -y
apt-get install -y --no-install-recommends curl ca-certificates vim

echo "bootstrap: ${VM_NAME:-$(hostname)} done"
