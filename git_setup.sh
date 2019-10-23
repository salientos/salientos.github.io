#!/bin/bash
#    _________      .__  .__               __    ________    _________
#   /   _____/____  |  | |__| ____   _____/  |_  \_____  \  /   _____/
#   \_____  \\__  \ |  | |  |/ __ \ /    \   __\  /   |   \ \_____  \ 
#   /        \/ __ \|  |_|  \  ___/|   |  \  |   /    |    \/        \
#  /_______  (____  /____/__|\___  >___|  /__|   \_______  /_______  /
#          \/     \/             \/     \/               \/        \/
#
##############################################################################
#
#  Program :	Git_Setup v1
#  Arch    :	x86_64 
#  Author  : 	Silent Robot
#  Website : 	https://sourceforge.net/projects/salient-os/
#
##############################################################################

function banner() {
	term_cols=$(tput cols) 
	str=":: $1 ::"
	for ((i=1; i<=`tput cols`; i++)); do echo -n ‾; done
	tput setaf 10; printf "%*s\n" $(((${#str}+$term_cols)/2)) "$str"; tput sgr0
	for ((i=1; i<=`tput cols`; i++)); do echo -n _; done
}

# Installing git if not installed for Arch Linux

if ! location="$(type -p "git")" || [ -z "git" ]; then
	banner "Installing git..."
	# check if pacman is installed
	if which pacman > /dev/null; then
		sudo pacman -S --noconfirm git
	fi
fi

# Setting up Git Repository

banner "Setting up Git..."

git init
git config --global user.name "salientos"
git config --global user.email "d3signr@gmail.com"
sudo git config --system core.editor nano
git config --global credential.helper cache
git config --global credential.helper 'cache --timeout=25000'
git config --global push.default simple

banner "Git Setup Completed..."
