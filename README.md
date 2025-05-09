# Installation

### Clone the dotfiles
```bash
git clone --recurse-submodules https://github.com/Danisaski/dotfiles.git ~/dev
```
or with SSH privileges

```bash
git clone --recurse-submodules git@github.com:Danisaski/dotfiles.git ~/dev
```

### Make scripts executable
```bash
cd ~/dev
chmod +x setup.sh scripts/*.sh
```

### Run the setup
```bash
./setup.sh
```

## Pleasant development experience
![Terminal overview](https://github.com/Danisaski/neodafer/blob/93e4b52af0d80ae918d3b730932c0e3633b8d270/images/neofetch_desktop.png)
![Neovim setup](https://github.com/Danisaski/neodafer/blob/93e4b52af0d80ae918d3b730932c0e3633b8d270/images/neovim.png)

<details><summary>🔧 Legacy instructions (IGNORE) (click to expand)</summary>
  
# Development Environment Setup Guide

This guide provides setup instructions for both Arch Linux and Ubuntu/Debian WSL2 environments, focusing on a development setup with Zsh, Python, Rust, and Neovim.

## Table of Contents
- [Configuration Management](#configuration-management)
  - [Option A: Direct Git Repository](#option-a-direct-git-repository)
  - [Option B: Copy Method](#option-b-copy-method)
  - [Verify Configuration](#verify-configuration)
  - [Delete Configuration](#delete-configuration)
- [System Setup](#system-setup)
  - [Arch Linux Setup](#arch-linux-setup)
  - [Ubuntu/Debian Setup](#ubuntudebian-setup)
- [Development Environment](#development-environment)
  - [Zsh & Oh My Zsh](#zsh--oh-my-zsh)
  - [Starship Prompt](#starship-prompt)
  - [Tmux Setup](#tmux-setup)
  - [Development Tools](#development-tools)
  - [Python Setup](#python-setup)
  - [Rust Setup](#rust-setup)
  - [Neovim Setup](#neovim-setup)
  - [Zsh Configuration](#zsh-configuration)
- [Post-Installation](#post-installation)
- [Github SSH configuration](#github-ssh-configuration)
- [Dependencies Overview](#dependencies-overview)

## Configuration Management

Fresh arch linux install
```bash
git clone https://github.com/Danisaski/neodafer.git ~/.config/nvim && bash ~/.config/nvim/setup.sh
```

### Option A: Direct Git Repository
This method allows you to track changes and update directly using Git.

#### For Linux (Arch/Ubuntu/Debian):
Backup existing configurations if needed
```bash
mv ~/.config/nvim ~/.config/nvim.bak 2>/dev/null
mv ~/.config/starship.toml ~/.config/starship.toml.bak 2>/dev/null
mv ~/.tmux.conf ~/.tmux.conf.bak 2>/dev/null
```

Clone directly to the configuration directory
```bash
git clone https://github.com/Danisaski/neodafer.git ~/.config/nvim
ln -s ~/.config/nvim/starship.toml ~/.config/starship.toml
ln -s ~/.config/nvim/.tmux.conf ~/.tmux.conf
ln -s ~/.config/nvim/.alacritty.toml ~/.alacritty.toml
ln -s ~/.config/nvim/config ~/.config/ghostty/config
```

To update configuration later:
```bash
cd ~/.config/nvim
git pull
```

To clean/reset configuration:
```bash
cd ~/.config/nvim
git fetch origin
git reset --hard origin/main
```

#### For Windows (CMD):
Backup existing configurations if needed
```cmd
if exist "%LOCALAPPDATA%\nvim" ren "%LOCALAPPDATA%\nvim" nvim.bak
if exist "%USERPROFILE%\.config\starship.toml" ren "%USERPROFILE%\.config\starship.toml" starship.toml.bak
if exist "%USERPROFILE%\.tmux.conf" ren "%USERPROFILE%\.tmux.conf" tmux.conf.bak
```

Create necessary directories
```cmd
mkdir "%LOCALAPPDATA%\nvim" 2>nul
mkdir "%USERPROFILE%\.config" 2>nul
```

Clone directly to the configuration directory
```cmd
cd /d "%LOCALAPPDATA%"
git clone https://github.com/Danisaski/neodafer.git nvim
```

Create symbolic links for configuration
```cmd
mklink "%USERPROFILE%\.config\starship.toml" "%LOCALAPPDATA%\nvim\starship.toml"
mklink "%USERPROFILE%\.tmux.conf" "%LOCALAPPDATA%\nvim\.tmux.conf"
```

To update configuration later:
```cmd
cd /d "%LOCALAPPDATA%\nvim"
git pull
```

To clean/reset configuration:
```cmd
cd /d "%LOCALAPPDATA%\nvim"
git fetch origin
git reset --hard origin/main
```

### Option B: Copy Method
This method creates a clean copy of the configurations without Git history.

#### For Linux (Arch/Ubuntu/Debian):
Create necessary config directories
```bash
mkdir -p ~/.config/nvim
mkdir -p ~/.config
```

Clean existing configurations
```bash
rm -rf ~/.config/nvim
rm -f ~/.config/starship.toml
rm -f ~/.tmux.conf
```

Clone and setup
```bash
git clone https://github.com/Danisaski/neodafer.git ~/.config/neodafer-tmp
cp -r ~/.config/neodafer-tmp/lua ~/.config/nvim/
cp ~/.config/neodafer-tmp/init.lua ~/.config/nvim/
cp ~/.config/neodafer-tmp/starship.toml ~/.config/
cp ~/.config/neodafer-tmp/.tmux.conf ~/
rm -rf ~/.config/neodafer-tmp
```

#### For Windows (CMD):
Create necessary directories
```cmd
mkdir "%LOCALAPPDATA%\nvim" 2>nul
mkdir "%USERPROFILE%\.config" 2>nul
```

Clean existing configurations
```cmd
rd /s /q "%LOCALAPPDATA%\nvim" 2>nul
del /f "%USERPROFILE%\.config\starship.toml" 2>nul
del /f "%USERPROFILE%\.tmux.conf" 2>nul
mkdir "%LOCALAPPDATA%\nvim"
```

Clone and setup
```cmd
cd /d "%TEMP%"
git clone https://github.com/Danisaski/neodafer.git neodafer-tmp
xcopy /E /I /Y neodafer-tmp\lua "%LOCALAPPDATA%\nvim\lua\"
copy /Y neodafer-tmp\init.lua "%LOCALAPPDATA%\nvim\"
copy /Y neodafer-tmp\starship.toml "%USERPROFILE%\.config\"
copy /Y neodafer-tmp\.tmux.conf "%USERPROFILE%\"
rd /s /q neodafer-tmp
```

### Verify Configuration

#### For Linux:
```bash
ls -la ~/.config/nvim/init.lua
ls -la ~/.config/nvim/lua
ls -la ~/.config/starship.toml
ls -la ~/.tmux.conf
```

#### For Windows (CMD):
```cmd
dir "%LOCALAPPDATA%\nvim\init.lua"
dir "%LOCALAPPDATA%\nvim\lua"
dir "%USERPROFILE%\.config\starship.toml"
dir "%USERPROFILE%\.tmux.conf"
```

### Delete Configuration

#### For Linux:
```bash
rm -rf ~/.local/share/nvim
rm -rf ~/.config/nvim
rm -rf ~/.oh-my-zsh
rm -f ~/.config/starship.toml
rm -f ~/.tmux.conf
rm -f ~/.zshrc
```

#### For Windows:
```powershell
rd /s /q %userprofile%\AppData\Local\nvim
rd /s /q %userprofile%\AppData\Local\nvim-data
```

## System Setup

### Arch Linux Setup

Setup the default user
```bash
echo "%wheel ALL=(ALL) ALL" > /etc/sudoers.d/wheel
useradd -m -G wheel -s /bin/bash dafer
passwd dafer
exit
```
Then in cmd, Arch.exe cwd.
```bash
Arch.exe config --default-user dafer
```

First update the system and install essential packages:
```bash
sudo pacman-key --init
sudo pacman-key --populate
sudo pacman -Sy archlinux-keyring
sudo pacman-key --refresh-keys {ERRONEUS KEY ID}
sudo pacman -Syu
sudo pacman -S base-devel git curl wget unzip zip sudo jdk17-openjdk

```

Create your user if not exists
```bash
useradd -m -G wheel -s /bin/bash dafer
passwd dafer
```

### Ubuntu/Debian Setup

Update the system and install essential packages:
```bash
sudo apt update && sudo apt upgrade -y
sudo apt install -y build-essential git curl wget unzip zip pkg-config
```

## Development Environment

### Zsh & Oh My Zsh

Install and configure Zsh:
Arch
```bash
sudo pacman -S zsh
```

Ubuntu/Debian
```bash
sudo apt install -y zsh
```

```bash
# Set Zsh as default shell
chsh -s $(which zsh)

# Install Oh My Zsh
sh -c "$(curl -fsSL https://raw.githubusercontent.com/ohmyzsh/ohmyzsh/master/tools/install.sh)"

# Install plugins
git clone https://github.com/zsh-users/zsh-autosuggestions ${ZSH_CUSTOM:-~/.oh-my-zsh/custom}/plugins/zsh-autosuggestions
git clone https://github.com/zsh-users/zsh-syntax-highlighting ${ZSH_CUSTOM:-~/.oh-my-zsh/custom}/plugins/zsh-syntax-highlighting
```

### Starship Prompt

Install Starship:
Arch
```bash
sudo pacman -S starship
```

Ubuntu/Debian
```bash
curl -sS https://starship.rs/install.sh | sh
```

### Tmux Setup

Install Tmux:
Arch
```bash
sudo pacman -S tmux
```

Ubuntu/Debian
```bash
sudo apt install -y tmux
```

Add these lines to your `~/.bashrc` or `~/.zshrc` to automatically start Tmux on terminal open:
```bash
# Automatically start Tmux on terminal open
if [[ -z "$TMUX" ]]; then
    tmux
fi
```

### Development Tools

Install FZF, Ripgrep, and Lazygit:
Arch
```bash
sudo pacman -S fzf ripgrep
sudo pacman -S lazygit
```

Ubuntu/Debian
```bash
sudo apt install -y fzf ripgrep
LAZYGIT_VERSION=$(curl -s "https://api.github.com/repos/jesseduffield/lazygit/releases/latest" | grep -Po '"tag_name": "v\\K[^"]*')
curl -Lo lazygit.tar.gz "https://github.com/jesseduffield/lazygit/releases/latest/download/lazygit_${LAZYGIT_VERSION}_Linux_x86_64.tar.gz"
tar xf lazygit.tar.gz lazygit
sudo install lazygit /usr/local/bin
```

### Python Setup

Install Python and virtualenv:
Arch
```bash
sudo pacman -S python python-pip python-virtualenv
```

Ubuntu/Debian
```bash
sudo apt install -y python3 python3-pip python3-venv
```

Create default virtual environment directory
```bash
mkdir -p ~/code/python/venvs
python3 -m venv ~/code/python/venvs/denv
```

### Rust Setup

Install Rust using rustup:
```bash
curl --proto '=https' --tlsv1.2 -sSf https://sh.rustup.rs | sh
source "$HOME/.cargo/env"
```

### Neovim Setup

Install Neovim:
Arch
```bash
sudo pacman -S neovim
```

Ubuntu/Debian
```bash
curl -LO https://github.com/neovim/neovim/releases/latest/download/nvim-linux64.tar.gz
sudo rm -rf /opt/nvim
sudo tar -C /opt -xzf nvim-linux64.tar.gz
sudo ln -sf /opt/nvim-linux64/bin/nvim /usr/local/bin/nvim
```

### Zsh/Bash Configuration

Add these lines to your `~/.zshrc` or `~/.bashrc`:
```bash
# Path to your Oh My Zsh installation.
export ZSH="$HOME/.oh-my-zsh"
    
# Enable plugins
plugins=(git zsh-autosuggestions zsh-syntax-highlighting)

# Source the plugins
source $ZSH/oh-my-zsh.sh

# Initialize starship
eval "\$(starship init zsh)"

# Activate Python venv on startup
source ~/code/python/venvs/denv/bin/activate

# Add cargo to path
source "\$HOME/.cargo/env"

# Add NVM to path
export NVM_DIR="\$HOME/.nvm"
[ -s "\$NVM_DIR/nvm.sh" ] && \. "\$NVM_DIR/nvm.sh"    # This loads nvm
[ -s "$NVM_DIR/bash_completion" ] && \. "$NVM_DIR/bash_completion"  # This loads nvm bash_completion


# Automatically start Tmux on terminal open
if [[ -z "\$TMUX" ]]; then
    tmux
fi

# Always start in the home directory
cd ~
```

## Post-Installation

1. Restart your shell:
```bash
exec zsh
```

2. Verify installations:
```bash
nvim --version
python3 --version
rustc --version
starship --version
tmux -V
```

Remember to:
- Clone your personal Starship configuration
- Clone your Neovim configuration
- Configure any additional Git settings

## Github SSH configuration

Modify url
```bash
git remote set-url origin git@github.com:Danisaski/neodafer.git
```

Create a SSH key
```bash
ssh-keygen -t ed25519 -C dafernandezperez@gmail.com
```
Get its contents
```bash
cat ~/.ssh/id_ed25519.pub
```

Remove PATH appending in WSL from Windows, slowdown shell autocompletion (add to /etc/wsl.conf)
```bash
[interop]
appendWindowsPath=false
```

## Dependencies Overview

The setup includes these main dependencies:
- Base development tools (gcc, make, etc.)
- Git for version control
- Curl for downloads
- Pkg-config for compilation
- Zsh shell dependencies
- Python build dependencies
- Neovim dependencies
- Tmux for terminal multiplexing

Note: Some commands might require re-logging or restarting your terminal to take effect.
</details>
