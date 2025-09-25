<<<<<<< HEAD
# simple-spot
=======
Simple Spotify Agent for rpi. 


This is part of a whole concept: 
- Simple-wifi  -> wifi ssid setup via phone.
- Simple-bt    -> Play bluetooth
- Simple-spot  -> Play spotify

Link to website:
https://renemoeijes.github.io/simple-wifi/

Install All Script:
https://raw.githubusercontent.com/renemoeijes/simple-wifi/main/Simple-Install.sh


**Simple Spotify**

simple-spotify is a spotify client based on raspotify, dtcooper. 


🚀 **It play spotify from any device. When connecting, it will stop the bluetooth from playing**
- **(When connectign with bleutooth, then spotify will stop playing !!)**

## Key Features

- **🔌 Plug & Play** - Automatically starts spotify on connection
- **📱 Mobile-friendly** - Works with phones, tablets, and computers  
- **⚡ Lightweight** - Minimal resource usage, perfect for Pi Zero
- **🏗️ Production-ready** - Professional Debian packaging and systemd integration
- **🔧 Zero configuration** - Hardcoded settings, just install and use
- **🌐 Universal compatibility** - Works with all modern devices and browsers


## Quick Start

1. **Install the package:** (I would recommend to use the Simple-Install.sh script for complete setup)
   ```bash
      64 bit 
      sudo apt install /path/to/simple-spot_<version>_arm64.deb

      Older 32 bit
      sudo apt install /path/to/simple-spot_<version>_armhf.deb
   ```

## Building from Source

### Quick Build (for development)
```bash
make clean
make
sudo make install
```

### Complete Build from GitHub
```bash
git clone https://github.com/renemoeijes/simple-spot.git
cd simple-spot
make clean
make
sudo make install
```

### Building Debian Package
```bash
git clone https://github.com/renemoeijes/simple-spot.git
cd simple-spot
dpkg-buildpackage -b
```
This creates a `.deb` package in the parent directory that you can install with `sudo dpkg -i simple-spot_*.deb`.

## About

simple-spot is designed with usability as goal. To provide a simple solution for frustrating problems.
No need for credentials etc. Just connect and play.

**Author:** R. Moeijes  
**License:** GPL v2+  
**Project:** simple-wifi - SimpleSoft solutions

---
