# Linux Located - fast config file finder & editor

Linux Located: a bash service that lets you find configs quickly.

Pronounced: *Locate Dee* or: `/loʊˈkeɪt ˈdiː/`

`located` is a simple linux program to quickly find and edit configuration files on Linux systems. It saves time hunting through `/etc` and other system directories, supporting multiple formats, priority configs, multi-column display, and extension filtering.

<img src="https://raw.githubusercontent.com/flaneurette/Linux-Located/refs/heads/main/src/locateD.png">

### Features

* Lists configuration files in `/etc` with line numbers and color highlighting
* Multi-column display for easy viewing
* Priority list for frequently used configs (Postfix, Apache, Fail2Ban, etc.)
* Supports common config extensions: `.conf`, `.ini`, `.cf`, `.local`, `.cnf`, `.yaml`, `.yml`, `.json`, `.env`, `.rules`, `.list`, `.service`, `.socket`, `.timer`
* Filter by extension: `located -q .ext` (e.g., `located -q .git`)
* Full list mode: `located -all`
* Opens selected config in `$EDITOR` (defaults to `nano`)

### Installation

Wget the raw package:

```
wget https://github.com/flaneurette/Linux-Located/raw/refs/heads/main/located-1.0.deb
```

Install it:

```
sudo dpkg -i located-1.0.deb
```

Manpage:
```
man located
```

Usage:

```bash
located            # Show prioritized config files
located -all       # Show all config files found in /etc
located -q .ext    # Filter by extension, e.g., .yaml, .json, .git
```

### Manual installation


1. Clone this repository:

```bash
sudo nano /usr/local/bin/located
```

Paste the attached locate.sh script.

2. Make it executable:

```bash
chmod +x /usr/local/bin/located
```

3. Run it:

```bash
located
```

### Usage

```bash
located            # Show prioritized config files
located -all       # Show all config files found in /etc
located -q .ext    # Filter by extension, e.g., .yaml, .json, .git
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
