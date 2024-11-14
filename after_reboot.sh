#!/bin/bash

set -e  # Exit immediately if a command exits with a non-zero status

# Variables for URLs and file paths
CHROME_URL="https://dl.google.com/linux/direct/google-chrome-stable_current_amd64.deb"
VSCODE_URL="https://packages.microsoft.com/repos/vscode"
VSCODE_GPG="https://packages.microsoft.com/keys/microsoft.asc"
SLACK_API_URL="https://slack.com/api/apps.admin.manifest.export"

# Function to check if a command exists
command_exists() {
    command -v "$1" >/dev/null 2>&1
}

# Function to install a deb package from a URL
install_deb_package() {
    local url=$1
    local temp_deb="$(mktemp)" # Create a temporary file
    wget -qO "$temp_deb" "$url"
    sudo dpkg -i "$temp_deb" || sudo apt install -f -y
    rm -f "$temp_deb"
}

# Function to get the latest Slack download URL
get_latest_slack_version() {
    wget -qO- "https://slack.com/intl/en-br/downloads/linux" | grep -oP 'https://downloads.slack-edge.com/releases/linux/[^"]+' | head -1
}

# Function to wait for apt lock
wait_for_apt_lock() {
    echo "Waiting for other apt processes to finish..."
    while sudo fuser /var/lib/apt/lists/lock >/dev/null 2>&1; do
        sleep 1
    done
    echo "Lock is free, proceeding with package installation."
}

# Wait for apt lock
wait_for_apt_lock

# Update and upgrade system packages
echo "Updating system packages..."
sudo apt update && sudo apt upgrade -y

# Install Google Chrome
if ! command_exists google-chrome; then
    echo "Installing Google Chrome..."
    install_deb_package "$CHROME_URL"
else
    echo "Google Chrome is already installed."
fi

# Install Visual Studio Code
if ! command_exists code; then
    echo "Installing Visual Studio Code..."
    wget -qO- "$VSCODE_GPG" | gpg --dearmor | sudo tee /usr/share/keyrings/packages.microsoft.gpg >/dev/null
    echo "deb [arch=amd64 signed-by=/usr/share/keyrings/packages.microsoft.gpg] $VSCODE_URL stable main" | sudo tee /etc/apt/sources.list.d/vscode.list
    sudo apt update
    sudo apt install code -y
else
    echo "Visual Studio Code is already installed."
fi

# Install Deja Dup
if ! command_exists deja-dup; then
    echo "Installing Deja Dup..."
    sudo apt install deja-dup -y
else
    echo "Deja Dup is already installed."
fi

# Install Zsh
if ! command_exists zsh; then
    echo "Installing Zsh..."
    sudo apt install zsh -y
else
    echo "Zsh is already installed."
fi

# Install Oh My Zsh
if [ ! -d "$HOME/.oh-my-zsh" ]; then
    echo "Installing Oh My Zsh..."
    sh -c "$(curl -fsSL https://raw.githubusercontent.com/ohmyzsh/ohmyzsh/master/tools/install.sh)" "" --unattended
    # Set Zsh as the default shell for the current user
    chsh -s "$(which zsh)"
    # Change the theme to 'agnoster'
    sed -i 's/ZSH_THEME=".*"/ZSH_THEME="agnoster"/' ~/.zshrc
else
    echo "Oh My Zsh is already installed."
fi

# Install Slack
if ! command_exists slack; then
    echo "Installing Slack..."

    # Remove existing Slack package if present
    if dpkg-query -l | grep -q slack-desktop; then
        echo "Removing old Slack package..."
        sudo apt remove --purge slack-desktop -y
        sudo apt autoremove -y
    fi

    # Add Slack's public GPG key and repository if not already added
    if [ ! -f /usr/share/keyrings/slack.gpg ]; then
        echo "Adding Slack's GPG key and repository..."
        wget -qO- https://packagecloud.io/slacktechnologies/slack/gpgkey | sudo tee /usr/share/keyrings/slack.gpg >/dev/null
        echo "deb [signed-by=/usr/share/keyrings/slack.gpg] https://packagecloud.io/slacktechnologies/slack/debian/ jessie main" | sudo tee /etc/apt/sources.list.d/slack.list
        sudo apt update
    fi

    # Fetch and install the latest Slack version
    SLACK_URL=$(get_latest_slack_version)
    echo "Latest Slack version found: $SLACK_URL"
    install_deb_package "$SLACK_URL"
else
    echo "Slack is already installed."
fi

# HIBERNATE FUNCTION ON POP OS

# Check if swapfile is already configured
if ! grep -q '/swapfile' /etc/fstab; then
    echo "Configuring swapfile for hibernation..."
    
    # Comment out the current swap from fstab
    sudo sed -i 's!^/dev/mapper/cryptswap!# &!' /etc/fstab
    # Optionally, comment out the current swap from crypttab
    sudo sed -i 's!^cryptswap!# &!' /etc/crypttab

    # Create a swapfile the same size as your RAM
    MEMSIZE="$(grep MemTotal /proc/meminfo | awk '{print $2}')KiB"
    sudo fallocate -l $MEMSIZE /swapfile
    sudo chmod 600 /swapfile
    sudo mkswap /swapfile

    SWAP_UUID=$(findmnt -no UUID -T /swapfile)
    SWAP_OFFSET=$(sudo filefrag -v /swapfile | awk '{ if($1=="0:"){print $4} }')
    KERNEL_OPTS="resume=UUID=$SWAP_UUID resume_offset=${SWAP_OFFSET/../}"

    # Add the new swap to your fstab
    echo '/swapfile none swap defaults 0 0' | sudo tee -a /etc/fstab

    # Update the kernel options
    sudo kernelstub -a "$KERNEL_OPTS"
    echo "$KERNEL_OPTS" | sudo tee -a /etc/initramfs-tools/conf.d/resume
else
    echo "Swapfile is already configured."
fi

# Install python3-pydrive
if ! dpkg-query -l | grep -q python3-pydrive; then
    echo "Installing python3-pydrive..."
    sudo apt install python3-pydrive -y
else
    echo "python3-pydrive is already installed."
fi

# Final message
echo "Installation script complete. Please restart your terminal."

