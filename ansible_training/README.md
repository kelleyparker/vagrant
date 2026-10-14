# Ansible / RHCE training

Fedora VMs on a host-only network so Ansible can actually manage them:

| VM | IP | Role |
|---|---|---|
| `fedora1` | 192.168.56.101 | control node (`ansible`, `ansible-navigator`) |
| `fedora2` … `fedora8` | 192.168.56.102 … .108 | managed nodes |

```
vagrant up
vagrant ssh fedora1
cd ~/ansible && ansible all -m ping
```

`~/ansible` on `fedora1` holds `ansible.cfg` and a generated `inventory.ini`
(`[control]`, `[managed]`). A throwaway SSH keypair is created on first `vagrant up` in
`.vagrant/` (git-ignored) and used only between lab VMs; the host needs OpenSSH
(`ssh-keygen`). VMs resolve each other by name via `/etc/hosts`.

Overrides: `VM_COUNT`, `VM_MEMORY`, `NET_PREFIX` (default `192.168.56`), `BOX`, `BOX_VERSION`.
Fedora 38 is EOL, so consider pointing `BOX` at a newer release.
