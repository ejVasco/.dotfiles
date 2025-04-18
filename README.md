find . -type f -name "*.sh" -exec chmod +x {} \;
# Overview
This is meant to be used immediately after installing Pop!_OS to completely set up my system the way I like it.
# Cloning the repo
1. Open terminal
2. Clone the repo
```git clone etc etc etc```
3. Open the repo
# How to run scripts:
1. Make them executable
```chmod +x zsh.sh brew.sh install.sh config.sh finalize.sh```
2. To run
```./[script file]```
# Steps
1. Run `zsh.sh`
This will install Zsh and Oh My Zsh (plugins and stuff will be done later by config).
2. Reboot or logout
Must be done to apply the new default shell as Zsh.
3. Run `brew.sh`
Installs brew and adds it to path already.
4. Run `install.sh`
Installs packages via apt and brew.
5. Run `config.sh`
Creates symlinks between configs in the repo and the config location that programs use.
6. Run `finalize.sh`
Not sure yet, but this will be for any commands that I couldn't put in the above files.





enable multiarchitecture on 64 bit system
sudo dpkg --add-architecture i386
add to sudo nano /etc/apt/sources.list
deb http://deb.debian.org/debian/ bookworm main contrib non-free

# Packages I may want to check out
## apt
## brew
## flatpak
- lonewolf
- notorious
- pdf slicer
- foliate
- escritoire
- bookup

