# Overview
# Instructions
## 1 Update system
```bash
sudo apt update
```
```bash
sudo apt upgrade
```
Reboot system just to be safe
## 2 Install Zsh and oh-my-zsh
```bash
sudo apt install -y zsh
```
```bash
chsh -s $(which zsh)
```
- Reboot system (Won't show any feedback but just proceed)
- Upon reboot and opening terminal, zsh will prompt to create a configuration through a cli menu, just quit by pressing 'q'
- Install oh-my-zsh, instructions here: https://ohmyz.sh
## 3 Install Brew
- Run the command found on the website: https://brew.sh/
(Must run after installing zsh) 
- Running this, the end of the output will have some commands to run:
```
==> Next steps:
- Run these commands in your terminal to add Homebrew to your PATH:
    echo >> /home/rjn/.zshrc
    echo 'eval "$(/home/linuxbrew/.linuxbrew/bin/brew shellenv)"' >> /home/rjn/.zshrc
    eval "$(/home/linuxbrew/.linuxbrew/bin/brew shellenv)"
- Install Homebrew's dependencies if you have sudo access:
    sudo apt-get install build-essential
  For more information, see:
    https://docs.brew.sh/Homebrew-on-Linux
- We recommend that you install GCC:
    brew install gcc
- Run brew help to get started
- Further documentation:
    https://docs.brew.sh
```
Note the commands, the commands are dependant on the current shell and the the name/username/user. Also these commands are needed in order for brew packages to install.
## 4 Install Packages
- Run the script `install.sh` to install apt, brew, and flatpaks
```bash
./install.sh
```
## 5 Symlink Configs
- Run the script `config.sh` to symlink configs and themes for packages.
```bash
./config.sh
```
## 8 Remote accessible
Run to make syscem remote accessible (I typically use tailscale to remote access my PC)
```bash
sudo systemctl enable --now ssh
```
```bash
sudo systemctl enable --now xrdp
```
## 7 Manual Packages
Other packages to manually install, may want to go to their respective websites:

| package | note | link|
|---------|------|-----|
| godot         | game engine        | https://godotengine.org |
| blender       |                    | https://www.blender.org |
| cyberghostvpn |                    | https://www.cyberghostvpn.com |
| grayjay       |                    | https://grayjay.app |
| vscodium      | open source vscode | https://vscodium.com |
| tailscale     |                    | https://tailscale.com |
for tailscale
```bash
https://vscodium.com
```
# Other
## About Packages Managers
- APT for core applications (window managers, system libraries, steam, etc)
- Flatpak for GUI apps with newer versions (libre office, gimp, etc).
- Homebrew for newer versions of developer and cli tools.
