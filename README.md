# Linux Locate - fast config file finder & editor

Linux Locate: a bash service that lets you find configs quickly.

`locate` is a simple, color-coded bash script to quickly find and edit configuration files on Linux systems. It saves time hunting through `/etc` and other system directories, supporting multiple formats, priority configs, multi-column display, and extension filtering.

### Features

* Lists configuration files in `/etc` with line numbers and color highlighting
* Multi-column display for easy viewing
* Priority list for frequently used configs (Postfix, Apache, Fail2Ban, etc.)
* Supports common config extensions: `.conf`, `.ini`, `.cf`, `.local`, `.cnf`, `.yaml`, `.yml`, `.json`, `.env`, `.rules`, `.list`, `.service`, `.socket`, `.timer`
* Filter by extension: `locate -q .ext` (e.g., `locate -q .git`)
* Full list mode: `locate -all`
* Opens selected config in `$EDITOR` (defaults to `nano`)

### Installation

1. Clone this repository:

```bash
sudo nano /usr/local/bin/locate
```

Paste the attached locate.sh script.

2. Make it executable:

```bash
chmod +x /usr/local/bin/locate
```

3. Run it:

```bash
locate
```

### Usage

```bash
locate            # Show prioritized config files
locate -all       # Show all config files found in /etc
locate -q .ext    # Filter by extension, e.g., .yaml, .json, .git
```

1. Select a number from the list to open the file in your editor.
2. Default editor is `$EDITOR`, fallback is `nano`.

### Customization

* Change colors by setting the `COLOR` environment variable:

```bash
export COLOR="\e[38;5;208m"  # orange
```

* Change line number color:

```bash
NUMCOLOR="\e[38;5;82m"  # green
```

* Add or remove priority configs in the script under the `PRIORITY` array

### Supported Extensions

You add extensions freely.

```
.conf, .ini, .cf, .local, .cnf, .config, .yaml, .yml, .json, .env, .rules, .list, .service, .socket, .timer
```

### License

MIT License - feel free to use, modify, and share.

---
