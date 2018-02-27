#!/bin/bash

# The main goal of this file is to be used when a brand-new computer has to be 
# quickly set up. 
# This file NEEDS to be executed with root privileges.

COL="\033[0;36m" # cyan
NC="\033[0m"

install_bicon(){
    cd /tmp
    git clone https://github.com/behdad/bicon && cd bicon
    ./autogen.sh && ./configure && make && make install
}

# list of apt_packages to install
apt_packages=("git" "ssh" "texlive" "gcc" "curl" "libcurl3"\
    "python" "python-pip" "ruby" "libfribidi0" "libfribidi-dev"\
    "nodejs" "npm"  "dh-autoreconf" "gimp" "zathura" "ack-grep"\
    "build-essential" "vim" "libssl-dev" "rubber" "mpv" "pkg-config" "tree" "gitk" "exuberant-ctags")

install_apt(){
    counter=0
    for pack in "${apt_packages[@]}"; do
        if [[ "${1}" = true ]]; then
            pack_found=$(dpkg -s "${pack}") 
    #         pack_found=$(dpkg-query -W --showformat="${Status}\n" "${pack}") # XXX: maybe just use 'which'??
            if [[ "$?" -ne 0 ]]; then
                echo -e "${COL}[apt] Installing missing package: ${pack}...${NC}"
                apt install "${pack}" --assume-yes
                counter=$(( counter + 1 ))
            else
                echo -e "${COL}[apt] Package ${pack} found, skipped.${NC}"
            fi
        else
            echo -e "${COL}[apt] Installing ${pack}...${NC}"
            apt install "${pack}" --assume-yes
            counter=$(( counter + 1 ))
        fi
    done
    echo -e "${COL}[apt] Installed ${counter} apt_packages.${NC}"
    echo -e "${COL}[apt] updating...${NC}"
    apt update --assume-yes
    apt upgrade --assume-yes
}

npm_packages=("grip" "cloc")
install_npm(){
    for pack in "${npm_packages[@]}"; do
        echo -e "${COL}[npm] Installing ${pack}...${NC}"
        npm install "${pack}"
    done
}

pip_packages=("pyserial")
install_pip(){
    for pack in "${pip_packages[@]}"; do
        echo -e "${COL}[pip] Installing ${pack}...${NC}"
        pip install "${pack}"
    done
}

for arg in "${@}"; do
    case "${arg}" in 
        apt|--apt)
            if [[ "${2}" == "--missing" ]]; then
                install_apt true
                shift 2; break
            else
                install_apt
                shift 1; break
            fi
            ;;
        npm|--npm)
            install_npm
            shift 1; break
            ;;
        pip|--pip)
            install_pip
            shift 1; break
            ;;
        bicon|--bicon)
            install_bicon
            shift 1; break
            ;;
       all)
           install_apt true
           install_npm
           install_pip
           install_bicon
           break
    esac
done
