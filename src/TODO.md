# Todo list.

⭐ Reserved flags: `-v -start -stop -restart -s -quit -reboot`.

> ~~Basic features~~ ✅ FINISHED.
> ```
> lcd            # Show prioritized config files
> lcd -all       # Show all config files found in /etc
> lcd -q .ext    # Filter by extension, e.g., .yaml, .json, .git
> ```

Configuration edit.

```
lcd -config | -conf | -c            # Aliases
-------------------------------------------------------------
# Editor
lcd -config -editor nano			# Alter lcd config editor
lcd -config -editor vi				# Ibid
lcd -config -editor vim				# Ibid

# Colors
lcd -config -colors green:orange    # Alter lcd config colors
```

Extra's:

```
lcd -archive 		| -archives  	# .tar, .gz, .zip, .bz2, .xz, .7z
lcd -logs    		| -log 			# /var/log/* and other log locations
lcd -error   		| -errors 	    # /var/log/error.log and all other error logs. (also scan all vhosts!)
lcd -service 		| -services 	# systemd service files
lcd -cron    		| -crontabs 	# crontabs, /etc/cron.*
lcd -cert    		| -certs  	    # SSL/TLS certificates (.pem, .crt, .key)
lcd -backup  		| -backups	    # .bak, .old, backup dirs
lcd -journal -n 100 | -news			# quick journalctl wrapper
```

Each mode could have its own priority list and search paths. Like: *lcd -logs* could prioritize:

```
/var/log/syslog
/var/log/apache2/error.log
/var/log/auth.log
/var/log/mysql/error.log
```


# Other ideas

Alt dir scanning.

```
lcd -dir /boot			# Lists files in /boot (must be root! determine usr privileges first)
lcd -directory /boot	# ibid
```

User dirs.

```
lcd -usr  | -user		# prints all files/scripts found in /usr/local/bin (must be user OR root!)
lcd -root 				# prints all files/scripts found in /root (must be root!)
```

Home scan.

```
lcd -home admin 		# prints all relevant files/scripts found in /home/admin/ (must be user OR root!)
lcd -home alice 		# prints all relevant files/scripts found in /home/alice/ (must be user OR root!)
```

Complete Linux update, upgrade and auto-clean.

```
lcd -update 			# Interactive updates
lcd -update -full 		# Updates, upgrades and auto-removes stale packages.
```

Explain.

```
lcd -explain 			# explains the filesystem and prints it to the user. (Simply list everything in ~)
```

Aliases.

```
lcd -aliases   		    			# Show all aliases from /etc/aliases (must be root)
lcd -alias webinfo:root@example.com	# Save new alias to /etc/aliases (must be root)
lcd -alias root:/dev/null			# Save new alias to /etc/aliases (must be root)
```

Clean function.

```
lcd -clean				# Cleans/vacuums filesystem: apt, cache, tmp, logs, .tar.gz files
lcd -clean -days 5		# Cleans/vacuums filesystem: apt, cache, tmp, logs, .tar.gz files older than nth days.
lcd -clean -size >=100M	# Optional size param.
```

Unlocker.

```
lcd -unlock				# Removes apt/dpkg locks.
```

Firewall management

```
lcd -firewall 		 	# shows `iptables -L -n -v --line-numbers` (easy to forget, so shortcut: -firewall)
lcd -firewall6 		 	# shows `ip6tables -L -n -v --line-numbers` (easy to forget, so shortcut: -firewall6)

lcd -firewall -drop 192.168.1.50       # Block IP
lcd -firewall -drop 2001:db8::1        # Auto-detects IPv6
lcd -firewall -accept 10.0.0.5         # Whitelist IP to all ports
lcd -firewall -accept 10.0.0.5 -p 22   # Whitelist IP to port 22
lcd -firewall -remove 192.168.1.50     # undo a rule
```

Vhosts management (very difficult to memorize all sites/configs/enabled/available/ssl etc if many vhosts)

```
lcd -vhosts          	# Apache/Nginx virtual host configs
lcd -sites           	# all sites configs
```

Site management:

```
lcd -site example.com
lcd -site example.com -logs
lcd -site example.com -cert
```

Search on filesize.

```
lcd -size >100M      	# files larger than 100M
lcd -size <10M       	# files smaller than 10M
lcd -size 50M-200M   	# files between 50M and 200M
```

We could combine it with the other modes too:

```
lcd -logs -size >100M     	# big log files eating disk space
lcd -archive -size >=1G    	# large archives
lcd -all -size >=500M      	# any large config/system files
```

⭐ Caveat: Early on, we have to scan for `-v` or `-start -stop -restart -s -quit -reboot`. If found, we know the following section are requested.

```
-v > inspect / explain
-start -stop -restart -s -quit -reboot > mutate state
```

Easy service management. No need for `systemctl` / `service` which all have a different parameter order (confusing).

```
lcd `service` -start -stop -restart
---------------------------------------------------------
lcd apache -start   | -s           # also accepts apache2
lcd apache -stop    | -quit
lcd apache -restart | -reboot
```

Versioning. 

Often it's `service -v`, then `--version`, another has `-changelog` or `-version` or `-V` or just: `version` etc, etc, rather inconsistent).

> To make things worse: `PHP -v` gives `CLI` version, instead of `running PHP`.

We can simply map them all to an understandable format:

```
lcd linux -v 		 # shows uname -a
lcd php -v			 # shows real webserver PHP
lcd apache -v
lcd dovecot -v
lcd postfix -v
lcd all -v           # show versions of all installed services!
```

Example of beautiful formatting:

```
lcd php -v
  CLI:     			PHP 8.1.2
  FPM:     			PHP 8.1.2  
  Running: 			PHP 8.1.2 (via php-fpm8.1)
  Config File:      /etc/php/8.1/fpm/php.ini
  Extensions:       mysqli, pdo_mysql, gd, curl, mbstring...
  Memory Limit:     128M
  Upload Max:       2M
  Post Max:         8M
```
And:
```
lcd apache -v
  Installed: 		Apache/2.4.52
  Running:   		Apache/2.4.52
  Mods available: 	mod_proxy, mod_evasive, ...
```