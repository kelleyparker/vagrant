#!/bin/bash

# Function to install a package on Ubuntu/Debian
install_package() {
    sudo apt-get install -y "$1"
}

# Function to install VirtualBox on Ubuntu/Debian
install_virtualbox() {
    echo "Installing VirtualBox..."
    sudo apt-get update
    install_package virtualbox
}

# Define the VirtualBox URL
virtualbox_url="https://download.virtualbox.org/virtualbox/7.0.12/VirtualBox-7.0.12-159484-Win.exe"

# Extract version number from the URL
virtualbox_version=$(echo $virtualbox_url | grep -oP 'VirtualBox-(\d+\.\d+\.\d+)-' | cut -d'-' -f2)

# Define the path where the installer will be saved
virtualbox_installer="/tmp/VirtualBox-$virtualbox_version-Win.exe"

# Download VirtualBox
echo "Downloading VirtualBox..."
wget -O $virtualbox_installer $virtualbox_url

# Install VirtualBox
echo "Installing VirtualBox..."
sudo chmod +x $virtualbox_installer
sudo $virtualbox_installer

# Clean up the installer file
rm $virtualbox_installer

# Define the Vagrant URL
vagrant_url="https://releases.hashicorp.com/vagrant/2.4.0/vagrant_2.4.0_linux_amd64.zip"

# Extract version number from the URL
vagrant_version=$(echo $vagrant_url | grep -oP 'vagrant/(\d+\.\d+\.\d+)/' | cut -d'/' -f2)

# Define the directory where Vagrant will be installed
install_dir="/usr/local/bin"

# Define the path where the installer will be saved
vagrant_installer="/tmp/vagrant_installer_$vagrant_version.zip"

# Download Vagrant
echo "Downloading Vagrant..."
wget -O $vagrant_installer $vagrant_url

# Unzip the installer
unzip -q $vagrant_installer -d $install_dir

# Clean up the installer file
rm $vagrant_installer
