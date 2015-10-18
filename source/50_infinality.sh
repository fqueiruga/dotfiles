function is_infinality_under_mint() {
  [[ -r /etc/infinality-settings.sh ]]
}

(is_mint && is_infinality_under_mint) || return 1

# Reads infinality config on mint installations using mdm
. /etc/infinality-settings.sh
