#!/bin/bash

# define variables used by this script.
DEVICE_NAME=shiba
RELEASE_DATE=2024011600
GRAPHENE_IMAGE=$DEVICE_NAME-factory-$RELEASE_DATE

# begin script execution.
cd $PROJECT_ROOT/graphene-os-images
echo "The Graphene OS image name that will be installed is: $GRAPHENE_IMAGE"
echo "Downloading the Graphene OS image ..."
if [ ! -f ./factory.pub ]; then
	curl -O https://releases.grapheneos.org/factory.pub > ./factory.pub
else
	echo "./factory.pub detected, so will not be downloaded."
fi
if [ ! -f ./$GRAPHENE_IMAGE.zip.sig ]; then
	curl -O https://releases.grapheneos.org/$GRAPHENE_IMAGE.zip.sig > ./$GRAPHENE_IMAGE.zip.sig
else
	echo "/$GRAPHENE_IMAGE.zip.sig detected, so will not be downloaded."
fi
if [ ! -f ./$GRAPHENE_IMAGE.zip ]; then
	curl -O https://releases.grapheneos.org/$GRAPHENE_IMAGE.zip > ./$GRAPHENE_IMAGE.zip
else
	echo "/$GRAPHENE_IMAGE.zip detected, so will not be downloaded."
fi

echo "Verifying the Graphene OS image ..."
signify-openbsd -Cqp ./factory.pub -x $GRAPHENE_IMAGE.zip.sig
if [[ $? -eq 0 ]]; then
	echo "The Graphene OS image has been verified to be correct."
    echo "Extracting the Graphene OS image ..."
	if [ -d "$PROJECT_ROOT/graphene-os-images/$GRAPHENE_IMAGE" ]; then
		echo "deleting ${PROJECT_ROOT}/graphene-os-images/${GRAPHENE_IMAGE} ..."
		rm -rf ${PROJECT_ROOT}/graphene-os-images/${GRAPHENE_IMAGE}
	fi
    bsdtar xvf ./$GRAPHENE_IMAGE.zip
    echo "Graphene OS image was extracted."
    LOOP=Y
    while [ ${LOOP} == "Y" ]; do
		if [[ $(lsusb | grep -i -c -P 'Google Inc\. Nexus\/Pixel Device') == "1" ]]; then
			LOOP=N
			echo "Pixel 8 device detected successfully."
			cd $PROJECT_ROOT/graphene-os-images/$GRAPHENE_IMAGE
			echo "Graphene OS will now be installed on the Pixel 8."
			read -p "Press [ENTER] to proceed with the installation of Graphene OS on the Pixel 8."
			./flash-all.sh
			echo "-------------------------------------------------------------"
			echo "Graphene OS has been installed on the Pixel 8."
			echo "Some additional manual steps are required."
			echo "Please continue following the installation instructions continuing on step 10."
		else
			echo "ERROR: Pixel 8 device was not detected."
			read -p "Is the Pixel 8 plugged into a USB-C connection? (Y/N): " ANSWER
			if [[ "${ANSWER^^}" != "Y" ]]; then
				echo "Exiting the installation."
				exit 1
			fi
		fi
    done
else
    echo "The Graphene OS image has been corrupted or tampered with."
    echo "Do not proceed with the installation."
fi

