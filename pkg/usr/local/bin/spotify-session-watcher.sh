#!/bin/bash

# Log watcher voor raspotify
journalctl -u raspotify -f -o cat | while read -r line; do
   if echo "$line" | grep -q "Session connected"; then
      echo "Spotify session detected: disconnecting Bluetooth..."
      # Disconnect alle Bluetooth devices
      bluetoothctl disconnect $(bluetoothctl devices | awk '{print $2}')
      # Eventueel ALSA reset (optioneel)
      alsa force-reload
   fi
done
