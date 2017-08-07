#!/bin/bash

# The main goal of this file is to be used when a brand-new computer has to be 
# quickly set up. It performs basic packages installation (git, ssh, pdflatex...).
# This file may need to be executed with root privileges.

# TODO: install pip packages (grip.. )
# TODO: install npm packages (cloc.. )

install_bicon(){
    cd /tmp
    git clone https://github.com/behdad/bicon && cd bicon
    ./autogen.sh && ./configure && make && make install
}

install_only_missing=false
if [[ "${1}" == "--missing" ]]; then
    install_only_missing=true
fi

# list of packages to install
packages=("git" "sudo" "ssh" "texlive" "gcc" "curl" "libcurl3" "python" "python-pip" "ruby" "libfribidi0" "libfribidi-dev" "nodejs" "npm" "pkg-configure" "dh-autoreconf")
counter=0

for pack in "${packages[@]}"; do
    if [[ "${install_only_missing}" ]]; then
        pack_found=$(dpkg-query -W --showformat="${Status}\n" "${pack}") # XXX: maybe just use 'which'??
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

# TODO: test this
# echo "[startup.sh] installing bicon.."
# install_bicon
