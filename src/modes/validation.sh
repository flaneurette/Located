[[ "${BASH_SOURCE[0]}" != "$0" ]] || {
  echo "This file must be sourced"
  exit 1
}

# Detect binary files
is_binary() {
  file -b --mime "$1" | grep -qv '^text/'
}

# Usage
# if is_binary "$target"; then
#  warn "Binary file detected: $target"
# fi

is_config_key() {
  case "$1" in
    EDITOR|COLORS|LOG_LINES) return 0 ;;
    *) return 1 ;;
  esac
}

# Validate editors
validate_editor() {
  local ed="$1"

  case "$ed" in
    nano|vim|vi|emacs|neovim|micro|helix|kakoune|kak|vis|amp|joe|jed|pico|mg|zile|e3|ee|fte|ex|sed|ed|sam|acme|qe|vy|wily|adie|beaver)
      command -v "$ed" >/dev/null
      ;;
    gedit|kate|kwrite|mousepad|leafpad|pluma|xed|geany|sublime-text|vscode|atom|brackets|bluefish|xemacs|spacemacs|doom-emacs|textadept|howl)
      [[ -n "${DISPLAY:-}" ]] && command -v "$ed" >/dev/null
      ;;
    *)
      return 1
      ;;
  esac
}
# Usage
# if validate_editor "$2"; then
#   EDITOR="$2"
# else
#   EDITOR="nano"
# fi
# -----------------------------------------

# Numeric input
is_number() {
  [[ "$1" =~ ^[0-9]+$ ]]
}
# Usage
# is_number "$LOG_LINES" || LOG_LINES=100
# -----------------------------------------

# Integer with bounds
is_int_range() {
  local val="$1" min="$2" max="$3"

  [[ "$val" =~ ^[0-9]+$ ]] || return 1
  (( val >= min && val <= max ))
}
# Usage
# is_int_range "$DAYS" 1 365 || exit 1
# -----------------------------------------

# Alphanumeric identifiers (services, modes)
is_safe_name() {
  [[ "$1" =~ ^[a-zA-Z0-9._-]+$ ]]
}
# Usage
# is_safe_name "$service" || exit 1
# -----------------------------------------

# Filesystem paths
is_safe_path() {
  local path
  path="$(realpath -m -- "$1" 2>/dev/null)" || return 1
  # Reject root or empty
  [[ "$path" != "/" && -n "$path" ]] || return 1
  # Reject obvious footguns
  case "$path" in
    /proc/*|/sys/*|/dev/*) return 1 ;;
  esac
  [[ -e "$path" ]]
}
# Usage
# is_safe_path "$TARGET" || exit 1
# -----------------------------------------

# Detect dangerous commands (`rm`, `dd`, `mkfs`)
contains_dangerous_cmd() {
  local input="$*"
  case "$input" in
    *" rm "*|*" rm-"*|*" rm/"*) return 0 ;;
    *"dd "*|*" mkfs"*|*" mkdir"*|*" touch"*|*" cp"*) return 0 ;;
    *) return 1 ;;
  esac
}
# Usage
# if contains_dangerous_cmd "$@"; then
#  echo "Refusing dangerous command"
#  exit 1
# fi
# -----------------------------------------

# Whitelist flags
is_flag() {
  case "$1" in
    -logs|-log|-cert|-certs|-service|-services|-v|-start|-stop|-restart|-s|-quit|-reboot)
      return 0
      ;;
    *)
      return 1
      ;;
  esac
}
# -----------------------------------------

# Config value validator (generic)
require_match() {
  local val="$1" regex="$2" name="$3"

  if [[ ! "$val" =~ $regex ]]; then
    echo "Invalid value for $name"
    exit 1
  fi
}
# Usage
# require_match "$EDITOR" '^(nano|vim|vi)$' "editor"
# -----------------------------------------

# Safer `source` wrapper
safe_source() {
  local file="$1"

  [[ -f "$file" ]] || return 1
  [[ ! -L "$file" ]] || return 1

  local perm owner
  perm=$(stat -c %a "$file") || return 1
  owner=$(stat -c %U "$file") || return 1

  [[ "$owner" == "$USER" || "$owner" == "root" ]] || return 1
  (( perm <= 644 )) || return 1

  source "$file"
}
# -----------------------------------------

# Bash hardening flags

# Early in `lcd`:
# set -o errexit
# set -o nounset
# set -o pipefail
# Enable carefully - can break loose scripts.
