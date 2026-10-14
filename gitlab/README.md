# GitLab EE

Ubuntu 24.04, 6 GB RAM, host-only IP `192.168.33.11` (override with `GITLAB_IP`).
First boot takes 10–20 minutes. Browse to `http://192.168.33.11` and log in as `root` with:

```
vagrant ssh -c "sudo cat /etc/gitlab/initial_root_password"
```

(The file is deleted after 24 hours.)
