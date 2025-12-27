#!/bin/bash
################################################################################
# Installs the software, which is required for you to create a V12 Mobile phone
# on your own, and for free.
################################################################################

echo "Checking if pre-requisite apt packages have been installed."
declare -a PACKAGES=("git", "direnv", "android-sdk-platform-tools-common", "signify-openbsd", "libarchive-tools")
for PACKAGE in "${PACKAGES[@]}"; do
	sudo apt update
	is_installed=$(dpkg -l | grep -i -c -P "ii\s+$PACKAGE\s+")
	if [[ ${is_installed} == "1" ]]; then
		# the package is already installed
		echo "apt package has already been installed: ${PACKAGE}"
	else
		# the package is not installed
		echo "apt package is not installed: ${PACKAGE}"
		echo "Installing apt package: ${PACKAGE} ..."
		sudo apt-get install -y ${PACKAGE}
	fi
done
echo "All pre-requisite apt packages have been installed."
