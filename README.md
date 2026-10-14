# vagrant

Sample Vagrant labs. Each folder is its own self-contained Vagrant environment;
`cd` into one and run `vagrant up`. Every folder has a README describing it.

| Folder | What you get | Provider | RAM (default) |
|---|---|---|---|
| [`10_ubuntu24_vms`](10_ubuntu24_vms/) | 10 Ubuntu 24.04 VMs | Hyper-V | 2 GB boot / 8 GB max each |
| [`8_linux_servers`](8_linux_servers/) | Fedora, RHEL 9, Ubuntu, Kali (8 VMs) | VirtualBox | 2 GB each |
| [`ansible_training`](ansible_training/) | 8 Fedora VMs with Ansible (RHCE study) | VirtualBox | 2 GB each |
| [`database_servers`](database_servers/) | Ubuntu 24.04 + MySQL (`192.168.33.10`) | VirtualBox | 1 GB |
| [`fedora_38_cloud`](fedora_38_cloud/) | One Fedora 38 VM, bridged | VirtualBox | 2 GB |
| [`gitlab`](gitlab/) | GitLab EE on Ubuntu 24.04 (`192.168.33.11`) | VirtualBox | 6 GB |
| [`lamp_ubuntu`](lamp_ubuntu/) | Apache/MySQL/PHP demo app (`192.168.56.20`) | VirtualBox | 2 GB |
| [`multiple_servers1`](multiple_servers1/) | 3 Fedora VMs with 60 GB disks | VirtualBox | 4 GB each |
| [`pentest`](pentest/) | Kali offense + defense (`192.168.56.10/.11`) | VirtualBox | 2 GB each |
| [`windows_servers`](windows_servers/) | 4 Windows Server VMs (`10.0.7.2-5`) | VirtualBox | 2 GB each |

## Prerequisites

Install VirtualBox and Vagrant (Hyper-V instead of VirtualBox for `10_ubuntu24_vms`):

- Windows (elevated PowerShell): `.\vagrant_install_windows.ps1`
- Debian/Ubuntu: `./vagrant_install_linux.sh` (VirtualBox + Vagrant) or `./ubuntu_vagrant_install.sh` (Vagrant only)

## Quick start

```
cd lamp_ubuntu
vagrant up          # create and provision
vagrant ssh         # log in (add the VM name if the lab has several)
vagrant halt        # shut down
vagrant destroy -f  # delete everything
```

## Notes and troubleshooting

- **Host RAM**: multi-VM labs add up quickly. Bring up a subset (`vagrant up fedora1 fedora2`)
  or lower memory where a lab supports it (`VM_MEMORY=1024`).
- **IP clashes**: `database_servers` and `gitlab` use different host-only IPs so they can run together.
  Most labs allow an override via an environment variable (see each README).
- **VirtualBox and Hyper-V** conflict on Windows. Disable Hyper-V/WSL2 features
  (`bcdedit /set hypervisorlaunchtype off`) to use VirtualBox labs, and the reverse for Hyper-V labs.
- **Box fails to download or boot**: `vagrant plugin install vagrant-vbguest`, update Vagrant, and check
  the box still exists on [Vagrant Cloud](https://app.vagrantup.com). Several boxes here (Fedora 37/38/39,
  Ubuntu 18.04/20.04) are end-of-life and kept only for testing.
- **Credentials** in these labs (such as the LAMP DB password) are throwaway defaults. Never reuse them.
- Use the `pentest` lab only against systems you own or are authorized to test.
