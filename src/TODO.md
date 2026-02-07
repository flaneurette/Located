# Todo list.

```
located -archive | -archives  	# .tar, .gz, .zip, .bz2, .xz, .7z
located -logs    | -log 		# /var/log/* and other log locations
located -error   | -errors 		# /var/log/error.log and all other error logs. (also scan all vhosts!)
located -service | -services 	# systemd service files
located -cron    | -crontabs 	# crontabs, /etc/cron.*
located -cert    | -certs  		# SSL/TLS certificates (.pem, .crt, .key)
located -backup  | -backups		# .bak, .old, backup dirs
```

Each mode could have its own priority list and search paths. Like: *located -logs* could prioritize:

```
/var/log/syslog
/var/log/apache2/error.log
/var/log/auth.log
/var/log/mysql/error.log
```

# Other ideas

```
located -vhosts          # Apache/Nginx virtual host configs
located -sites           # enabled sites
located -sites-available # all available site configs
located -sites-enabled   # just the active ones
```

```
located -size >100M      # files larger than 100M
located -size <10M       # files smaller than 10M
located -size 50M-200M   # files between 50M and 200M
```

We could combine it with the other modes too:

```
located -logs -size +100M     # big log files eating disk space
located -archive -size +1G    # large archives
located -all -size +500M      # any large config/system files
```