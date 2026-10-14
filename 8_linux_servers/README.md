# 8 Linux servers

Fedora 39 ×2, RHEL 9 ×2, Ubuntu 18.04, Ubuntu 20.04, Kali Rolling ×2 on VirtualBox.
Default 2 GB RAM each (16 GB total). Change with `VM_MEMORY=4096 vagrant up`, or start a
subset: `vagrant up rhel9-1`. If the first `up` fails, update Vagrant and install
`vagrant-vbguest`.
