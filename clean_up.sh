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
#  Program :	Clean_Up v1
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

banner "Cleaning up Site Repository"

mv .git/config config
rm -rf .git
sh ./git_setup*
mv config .git/config
git add --all .
git commit -m " "
git push origin master --force

banner "Clean up completed..."
