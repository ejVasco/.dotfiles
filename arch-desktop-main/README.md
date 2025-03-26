# arch-desktop-main
This is the main directory that has my configs (scripts in other directories may pull some configs here, like tmux and nvim). Information in this file will assume you followed along, installing hyprland as shown in the archinstall script below.

If you just want to install the packages and/or configs, skip to [After Install step 4](#4-install-packages-and-configs-using-this-repo) (**NOT RECOMMENDED**).
## Contents
This directory contains:
| File/Directory | What is it |
|----------------|------------|
| `.zshrc`       | Zshell config
| `packages.txt` | text file of packages I need/want
| `1packages.sh` | script to install all packages using __*paru*__
| `.config`      | directory of config files
| `2config.sh`   | script that will apply configs
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
- Automatic time sync (NTP): NTP: Enabled
## Ater Install, Reboot, and Login
#### 1. Networking/Internet
- open terminal (in hyprland open kitty with `SUPER+Q` by default)
- connect to a network using 
```
nmtui
```
(this is the network manager terminal user interface. if you can't connect or something is wrong, good luck)
- verify connection using via below command or something similar
```
ping google.com
```
- enable network manager starts on boot
```
sudo systemctl enable --now NetworkManager
```
#### 2. Update system
Just in case:
```
sudo pacman -Syu
```
#### 3. Installing paru
- follow install instructions on the [paru repository](https://github.com/Morganamilo/paru)
- verify installation with 
```
paru --version
```
#### 4. Remove some default packages (optional)
The archinstall script installs some basic packages. I have preferred alternatives to these packages that will be installed by `packages.sh`. If you prefer these packages, then don't remove them (like nano which is easy to use compared to neovim which has to be learned)
```
paru -Rns nano vim dunst htop 
```
The alternatives that will be installed are neovim, swaync, btop.
#### 5. Install packages and configs using this repo
- navigate to home directory
```
cd ~
```
- create `backup_config` directory and copy `.config` and `.zshrc` (if they exist)
```
mkdir -p backup_config
cp -a .zshrc backup_config
cp -a .config backup_config
```
- clone repo into home directory (`cd ~` will take you to home directory if you are not there already)
```
git clone https://github.com/ejVasco/.dotfiles.git
```
- navigate into the correct directory
```
cd .dotfiles/arch-desktop-main
```
- make scripts into executables
```
chmod +x 1packages.sh 2config.sh
```
- run each script
```
./1package.sh
```
```
./2config.sh
```
## Packages Info
This is just a really long section, that won't be super specific about packages, just my use cases basically.
| Package | What is it |
|---------|------------|
| zsh     | alternative shell to bash
# TODO
- work on [package info](#packages-info)
- .zshrc stuff (compare to pc)
- also compare old config.sh file to see what i'm forgetting, cant rember rn tbh
- add checks for enable stuff in the config.sh, I rembember chatgpt showed me an example
- do tmux, hyprland, waybar, kitty, nvim configs first
- look into these packages since i dont have them installed: hypridle, hyprlock, hyprpaper, hyprpolkitagent, hyprsunset, hyprsysteminfo
- look into the dracula theme since its near universal
- add auto updating to my hyprland autostart? or an easy command 'updateconf' or something
