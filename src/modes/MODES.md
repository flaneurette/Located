```
modes/
  logs.sh
  certs.sh
  services.sh
  versions.sh
  etc...
```

Modes logic in lcd.sh

```
#!/usr/bin/env bash
# is NOT POSIX sh, but bash.

SCRIPT_DIR="$(cd -- "$(dirname -- "${BASH_SOURCE[0]}")" && pwd)"

LCD_SHARE_DIR="${LCD_SHARE_DIR:-/usr/share/lcd}"

# Prefer installed path, fallback to dev tree
if [[ -d "$LCD_SHARE_DIR/modes" ]]; then
  MODES_DIR="$LCD_SHARE_DIR/modes"
else
  MODES_DIR="$SCRIPT_DIR/modes"
fi

source "$MODES_DIR/modes/logs.sh"
source "$MODES_DIR/modes/certs.sh"
source "$MODES_DIR/modes/services.sh"
# p.s. don't exit in sourced files, kills entire program.
```