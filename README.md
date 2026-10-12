# vagrant

Sample Vagrant labs. Each folder under `labs/` is its own Vagrant environment:
`cd labs/<name> && vagrant up`.

## Setup

Install VirtualBox and Vagrant:

| Host | Command |
|------|---------|
| Ubuntu/Debian | `./scripts/install-linux.sh` |
| Windows (elevated PowerShell) | `.\scripts\install-windows.ps1` |

The Hyper-V lab needs Hyper-V instead of VirtualBox; see its Vagrantfile header.

## Labs

| Lab | Provider | VMs | Purpose |
|-----|----------|-----|---------|
| [`ubuntu-24-hyperv`](labs/ubuntu-24-hyperv) | Hyper-V | 10 x Ubuntu 24.04 | General-purpose lab; `VM_COUNT` env var changes the count |
| [`linux-mixed`](labs/linux-mixed) | VirtualBox | 8 | Fedora 39, RHEL 9, Ubuntu 18.04/20.04, Kali |
| [`fedora-ansible`](labs/fedora-ansible) | VirtualBox | 8 x Fedora 38 | Ansible / RHCE study, Ansible preinstalled |
| [`fedora-38`](labs/fedora-38) | VirtualBox | 1 | Single bridged Fedora 38 |
| [`fedora-multi`](labs/fedora-multi) | VirtualBox | 3 x Fedora 37 | 60 GB disks (needs `vagrant-disksize` plugin) |
| [`database`](labs/database) | VirtualBox | 1 | Ubuntu + MySQL on 192.168.33.10 |
| [`gitlab`](labs/gitlab) | VirtualBox | 1 | GitLab EE on Ubuntu 20.04, 192.168.33.10 |
| [`lamp`](labs/lamp) | VirtualBox | 1 | Apache/MySQL/PHP with an intentionally insecure demo form |
| [`pentest-kali`](labs/pentest-kali) | VirtualBox | 2 x Kali | `offense` and `defense` boxes |
| [`windows-servers`](labs/windows-servers) | VirtualBox | 4 | Windows Server on 10.0.7.2-5 |

`database` and `gitlab` both use 192.168.33.10, so don't run them at the same time.

## Checks

CI (`.github/workflows/lint.yml`) runs `ruby -c` on every Vagrantfile and `shellcheck` on the shell scripts.
