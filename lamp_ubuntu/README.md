# LAMP demo

Ubuntu 24.04 with Apache, MySQL and PHP at `http://192.168.56.20/` (override `LAMP_IP`).
A form (`index.html`) posts a name to `process.php`, which inserts it into `db1.users`
using a prepared statement. DB credentials are written to `/etc/lamp_db.ini` by the
provisioner; the default password is `password` (set `DB_PASSWORD` to change).

View stored rows: `vagrant ssh -c "sudo mysql db1 -e 'SELECT * FROM users'"`.
