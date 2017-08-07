#!/bin/bash

# The main goal of this file is to be used when a brand-new computer has to be 
# quickly set up. It performs basic packages installation (git, ssh, pdflatex...).
# This file should be executed with root privileges.


# TODO: install pip packages (grip.. )

install_only_missing=false
if [[ "${1}" == "--missing" ]]; then
    install_only_missing=true
fi

# list of packages to install
packages=("git" "ssh" "texlive" "gcc" "curl" "libcurl3" "python" "python-pip" "ruby" "libfribidi0" "libfribidi-dev")
counter=0

for pack in "${packages[@]}"; do
    if [[ "${install_only_missing}" ]]; then
        pack_found=$(dpkg-query -W --showformat="${Status}\n" "${pack}")
        if [[ "${pack_found}" != "" ]]; then
            echo "[startup.sh] Installing missing package: ${pack}"
            apt install "${pack}" --assume-yes
            counter=$(( counter + 1 ))
        else
            echo "[startup.sh] Package ${pack} found, skipped."
        fi
    else
        echo "[startup.sh] Installing ${pack}"
        apt install "${pack}" --assume-yes
        counter=$(( counter + 1 ))
    fi
done
echo "[startup.sh] Installed ${counter} packages."

echo "[startup.sh] updating..."
# apt update 
# apt upgrade
