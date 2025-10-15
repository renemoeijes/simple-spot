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

      # stop RasRadio
      pkill -f RasRadio
      echo "\[INFO\] RasRadio gestopt (als het draaide)"

      # ALSA "reset"
      command -v alsactl >/dev/null 2>&1 && alsactl kill rescan || true
      ;;
  esac
done
