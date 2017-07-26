#!/bin/sh

# The main goal of this file is to be used when a brand-new computer has to be 
# quickly set up. It performs basic packages installation (git, ssh, pdflatex...).
# This file should be executed with root privileges.

# list of packages to install
packages=("git" "ssh" "texlive" "openjdk-7-jdk")

for pack in "${packages[@]}"; do
    echo "[startup.sh] Installing ${pack}"
    apt install "${pack}"
done

apt update 
apt upgrade
