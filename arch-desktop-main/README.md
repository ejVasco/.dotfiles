# arch-desktop-main
This is the main directory that has my configs (other directories will pull configs for things from here, like tmux and nvim)
## Contents
This directory contains:
| File/Directory | What is it |
|-|-|
| `.zshrc` | Zshell config
| `packages.txt` | text file of packages I need/want
| `packages.sh` | script to install all packages using __*paru*__
| `.config` | directory of config files
| `config.sh` | script that will apply configs
## Installing Arch Linux
Before installing, should connect to internet using `iwctl`.
The config for `archinstall` that I use:
- Archinstall language (Default) : English
- Locales (Default)
    - Keyboard layout: us (I use dvorak but manage this on my keyboard)
    - Locale language: en_US
    - Locale encoding: UTF-8
- Mirrors: Mirror regions: United States
- Disk configuration
    - Disk configuration type: Use a best-effort default partition layout
    - Select correct disk
    - Filesystem: btrfs
    - Would you like to use BTRFS subvolumes with a default structure?: Yes
    - Would you like to use compression or disable COW?: Use compression
- Disk encryption (skip)
- Swap: Swap on zram: Enabled
- Bootloader: Systemd-boot
- Unified kernal images: Enabled
- Hostname (user choice)
- Root password (user choice)
- User account (user choice)
- Profile
    - Profiles: Desktop: Hyprland
    - Graphics driver (user choice)
    - Greeter: ly
- Audio: Audio: pipewire
- Kernels: Kernel: linux, linux-lts
- Network configuration: NetworkManager
- Additional packages (None / User choice)
- Timezone (user choice)
- Automatic time sync (NPT): NTP: Enabled
## Ater Install, Reboot, and Login
#### 1. Networking/Internet
- open terminal (in hyprland open kitty with `SUPER+Q` by default)
- run `nmtui`
    - this is the network manager terminal user interface
    - if you can't connect or something is wrong, good luck
- verify connection using `ping google.com` or something similar
- `sudo systemctl enable --now NetworkManager` so network manager starts on boot
#### 2. Update system
Just in case:
```bash
sudo pacman -Syu
```
#### 3. Installing paru
- follow install instructions on [paru repo here](https://github.com/Morganamilo/paru)
- verify with `paru --version`
#### 4. Install Packages and Configs
- navigate to home directory
- backup `.config` and possibly `.zshrc`
```
bash
mkd
```
- clone repo in home directory (`cd` takes you to home directory)
```git clone https://github.com/ejVasco/.dotfiles.git```
## Packages Info
