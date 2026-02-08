# LCD - Linux Control Dashboard.

**LCD - Linux Control Dashboard (List > Choose > Do)**

It is a simple GNU-Linux program to quickly find and edit configuration files on Linux systems. It saves time hunting through `/etc` and other system directories, supporting multiple formats, priority configs, multi-column display, and extension filtering.

### Quick Installation

```
sudo add-apt-repository ppa:flaneurette/lcd
sudo apt update
sudo apt install lcd
```

Usage:

`lcd service -param`

Examples:

```bash
lcd            # Show prioritized config files
lcd -all       # Show all config files found in /etc
lcd -q .ext    # Filter by extension, e.g., .yaml, .json, .git
```

<img src="https://raw.githubusercontent.com/flaneurette/LCD/refs/heads/main/src/Terminal.png">

### Features
 
* Lists configuration files in `/etc`
* Multi-column display for easy viewing
* Priority list for frequently used configs (Postfix, Apache, Fail2Ban, etc.)
* Supports common config extensions: `.conf`, `.ini`, `.cf`, `.local`, `.cnf`, `.yaml`, `.yml`, `.json`, `.env`, `.rules`, `.list`, `.service`, `.socket`, `.timer`
* Filter by extension: `lcd -q .ext` (e.g., `lcd -q .git`)
* Full list mode: `lcd -all`
* Opens selected config in `$EDITOR` (defaults to `nano`, you can change it to anything you like).

### Alternative: .deb installation

Wget the raw package:

```
wget https://github.com/flaneurette/LCD/raw/refs/heads/main/lcd_1.0-0_all.deb
```

Install it:

```
sudo dpkg -i lcd_1.0-0_all.deb
```

Usage:

```bash
lcd            # Show prioritized config files
lcd -all       # Show all config files found in /etc
lcd -q .ext    # Filter by extension, e.g., .yaml, .json, .git
```
 
### Alternative: manual installation (with config options)

1. Clone this repository:

```bash
sudo nano /usr/local/bin/lcd
```

Paste the attached lcd.sh script. 

2. Make it executable:

```bash
chmod +x /usr/local/bin/lcd
```

3. Run it:

```bash
lcd
```

### Usage

```bash
lcd            # Show prioritized config files
lcd -all       # Show all config files found in /etc
lcd -q .ext    # Filter by extension, e.g., .yaml, .json, .git
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