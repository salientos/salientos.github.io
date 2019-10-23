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
#  Program :	Git_Push v1
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

#banner "Git Pull, check for newer files first..."
#git pull

banner "Git Add, Adding everything here..."

git add --all .

banner "Enter a commit comment (optional)"

read input

# Committing to the local repository
# with commit comment if given

banner "Committing to local repository..."

git commit -m "$input"

banner "Push local files to Github..."

git push -u origin master

banner "Git push completed..."