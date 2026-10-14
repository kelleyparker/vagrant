# Fedora 38 cloud VM

One Fedora 38 VM (2 GB, 2 CPUs) with bridged networking, updated with `dnf update`.
Vagrant prompts for the host interface unless you set `BRIDGE_IF`. Override the box with
`BOX` / `BOX_VERSION` since Fedora 38 is EOL.
