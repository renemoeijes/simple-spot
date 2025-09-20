#!/bin/bash

# Log watcher voor raspotify
journalctl -u raspotify -f -o cat | while IFS= read -r line; do
  case "$line" in
    *"<Ok(NEW_SESSION)>"*)
      echo "Spotify session detected: disconnecting Bluetooth..."
      # Alleen verbonden devices
      mapfile -t DEVICES < <(bluetoothctl devices Connected | awk '{print $2}')
      if [ ${#DEVICES[@]} -eq 0 ]; then
        echo "No connected Bluetooth devices."
      else
        for mac in "${DEVICES[@]}"; do
          [ -n "$mac" ] && bluetoothctl disconnect "$mac" >/dev/null 2>&1
        done
      fi
      # Optionele ALSA “reset” (alleen indien echt nodig):
      # if command -v alsactl >/dev/null 2>&1; then
      #   alsactl kill rescan >/dev/null 2>&1 || true
      # fi
      ;;
  esac
done
