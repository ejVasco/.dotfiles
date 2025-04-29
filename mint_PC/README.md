# Overview

# Instructions

## Update system
```sudo apt update```
```sudo apt upgrade```

## Install Zsh

```sudo apt install zsh```

```chsh -s $(which zsh)```
(Won't show any feedback but just proceed)

Reboot system

Upon reboot and opening terminal, zsh will prompt to create a configuration through a cli menu, just quit by pressing 'q'

## Install Brew
Run the script found on the website: https://brew.sh/
(Must run after installing zsh) 
After running the end of the terminal output will look something like this:
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

## 

# Other

## About Packages Managers

APT for core applications (window managers, system libraries, steam, etc)

Flatpak for GUI apps with newer versions (libre office, gimp, etc)

Homebrew for newer versions of developer and cli tools.
