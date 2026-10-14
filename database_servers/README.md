# MySQL server

Ubuntu 24.04 with MySQL Server, host-only IP `192.168.33.10` (override with `DB_IP`).
MySQL listens on localhost only; edit `bind-address` and add a user to allow remote access.
Connect: `vagrant ssh -c "sudo mysql"`.
