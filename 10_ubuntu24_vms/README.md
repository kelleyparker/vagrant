# 10 Ubuntu 24.04 VMs (Hyper-V)

Creates `ubuntu1` … `ubuntu10` on Hyper-V using `boxen/ubuntu-24.04`
(2 vCPU, dynamic memory 2 GB → 8 GB, DHCP addresses on the Default Switch).

Requires Windows Pro/Enterprise with Hyper-V enabled and an **elevated** PowerShell.

```powershell
vagrant up                       # all 10
$env:VM_COUNT=3; vagrant up      # fewer VMs
$env:SWITCH_NAME="MySwitch"; vagrant up
```

VMs resolve each other as `<name>.mshome.net`. `provision/bootstrap.sh` installs base
tools and authorizes your `~/.ssh/*.pub` key (or `$env:SSH_PUBKEY`) for the `vagrant` user.
