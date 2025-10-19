# Install Graphene OS on new Pixel 7 Pro

To install Graphene OS on a new Pixel 7 Pro, first download this repository 
onto a computer, which is running Debian 11 (bullseye).  To download this 
repository execute the following from the command line.

```shell script
git clone https://github.com/Vet-The-Vote/v12-mobile.git
cd v12-mobile
```

## Prerequisites for Installation Computer

The installation computer needs to have Debian 11 (bullseye) installed and running on "bare metal", meaning not running in a virtualized environment, but running directly on the computer as its "host" operating system.

If you do not have Debian 11 installed on a computer, execute the instructions
contained in [Installing Debian 11](docs/installing-debian-11.md).

## Prerequisites on Installation Computer

* git
* direnv - also add `eval "$(direnv hook bash)"` to `~/.bashrc`
* android-sdk-platform-tools-common
* signify-openbsd
* libarchive-tools

To install the pre-requisites open a command line terminal on the installation 
computer, which should be running Debian 11 (bullseye), and execute the following:

```shell script
install-prerequisites.sh
```

## Install Instructions for Pixel 7 Pro

1. Plugin Pixel 7 Pro to a USB-C on the back of a computer, which is running Debian 11 (bullseye).  Note, do not plug the Pixel 7 Pro into a USB port on the front of the computer.  See the official [Graphene OS installation prerequisites](https://grapheneos.org/install/cli#prerequisites) for more details.
2. Enable "Developer Mode" on the Pixel 7 Pro by doing as follows:
    - From the home screen, swipe up on the screen.
    - Tap on `Settings -> System -> About Phone`, then scroll all the way to the bottom.
    - Tap on `Build number` seven times, making sure the Pixel 7 Pro shows the messages "You are now a developer".
3. Enable OEM Unlocking on the Pixel 7 Pro by doing the following:
    - From the home screen, swipe up on the screen.
    - Tap on `Settings -> System -> Developer options`.
    - Toggle on `OEM unlocking`, then confirm the warning message by tapping on `Enable`.
4. Execute: `sudo systemctl stop fwupd.service`
5. Power off the Pixel 7 Pro, by pressing both buttons at the same time: `Power` & `Volume Up`.
6. Hold down `Volume Down` while powering back up the Pixel 7 Pro.  Continue holding `Volume Down` until it boots up into the bootloader interface.
7. After the Pixel 7 Pro boots up into the bootloader, execute the following from the command line: `fastboot flashing unlock`.
8. On the Pixel 7 Pro, confirm to unlock the bootloader by doing the following:
    - Press `Volume Down` one time.
    - Confirm that the menu item on screen next to the `Power` button reads `Unlock the bootloader`.
    - Press the `Power` button.
9. Download and install Graphene OS by executing: `download-and-verify-Pixel-8.sh`
10. After the script `download-and-verify-Pixel-8.sh` has completed, lock the bootloader on the Pixel 7 Pro by doing the following:
    - From a command line terminal execute: `fastboot flashing lock`
    - On the Pixel 7 Pro:
        - Press `Volume Down` one time.
        - Confirm that the menu item on screen next to the `Power` button reads `Lock the bootloader`.
        - Press the `Power` button.
        - The Pixel 7 Pro will reboot and go back into the bootloader screen.
11. Reboot into Graphene OS by doing the following:
        - Boot Press the `Power` button on the Pixel 7 Pro phone.  The Pixel 7 Pro should reboot into Graphene OS after 1-2 minutes.
12. Verify the following boot key hash is displayed with a yellow notice when the Pixel 7 Pro first powers on.
    - `cd7479653aa88208f9f03034810ef9b7b0af8a9d41e2000e458ac403a2acb233`
13. Disable OEM unlocking on the Pixel 7 Pro by doing the following:
    - Tap `Settings -> About phone`, then scroll all the way to the bottom.
    - Tap on `Build number` seven times, making sure the Pixel 7 Pro shows the messages "You are now a developer".
    - Tap `back` (the left arrow at the top).
    - Tap `System -> Developer options`.
    - Toggle off `OEM unlocking`.
    - Toggle off `Use developer options`, then tap `Restart`.  The Pixel 7 Pro should reboot.

After executing the installation steps in this section, your Pixel 7 Pro should 
now have Graphene OS installed on it.  But, it comes with very few apps by 
default.  This is by design and for the sake of security.  Execute the steps in 
following section to install the F-Droid app store and then install the Briar
messaging app, which is secured using strong encryption and also the TOR network.
        
## Installing F-Droid App Store

1. Install the `F-Droid` app store by opening the following link on the Pixel 7 Pro:
    - https://f-droid.org/F-Droid.apk
2. Then tap:
    - "DOWNLOAD F-DROID" button, then tap "Download"
    - The following warning will be displayed: `File might be harmful`.
    - Tap `Download anyway` to download the F-Droid app.
3. Tap the three dots in the top right of the window, then tap `Downloads`.
4. Tap on `F-Droid.apk` to install the F-Droid app store.
    - A warning will be displayed saying `Venadium - For your security, your phone currently isn't allowed to install uknown apps from this source.  You can change this in Settings.`.
    - Tap `Settings`.
    - Toggle on `Allow from this source`.
    - A message will be displayed saying, `F-Droid - Do you want to install this app?`.  
    - Tap on `Install`.
    - Then navigate back to the home screen.

At this point the F-Droid app store should now be installed on the Pixel 7 Pro.  
And there should now be a icon for `F-Droid` on the home screen.

## Installing Secure Messaging App "Briar"

1. On the home screen, tap on the `F-Droid` icon.
2. Search for the `Briar` app by tapping on the green magnifying glass icon in the bottom right.
3. Tap on `Search apps` at the top left of the screen, then type `briar`.
4. F-Droid should now be displaying `Briar Secure Messaging, Anywhere`.  Tap on the download icon to its right.
5. A noticed will be displayed saying, `F-Droid - For your security, your phone currently isn't allowed to install uknown apps from this source.  You can change this in Settings.`.
6. Tap `Settings`.
7. Toggle on `Allow from this source`.
8. A message will be displayed saying, `Briar - Do you want to install this app?`.
9. Tap on `Install`.
10. Then navigate back to the home screen.

At this point the Briar app should now be installed on the Pixel 7 Pro.  
And there whould now be an icon for `Briar` on the home screen.

## Configuring Secure Messaging App "Briar"

1. On the home screen, tap on the `Briar` icon.
2. Enter a nickname that you want to use for people to contact you in Briar.
3. Enter a password to protect messages stored in Briar.
4. When prompted, tap `ALLOW CONNECTIONS`, then tap `Allow`.
5. Tap `CREATE ACCOUNT` to create your Briar account on your Pixel 7 Pro.

In order to communicate with another person using Briar, you must both add 
each other as a `Contact` by each sharing your Briar URL with each other.

# Other Apps 

The following is a small list of other app, which can improve security when
using a Graphene OS cell phone.

* Orbot - TOR VPN for Smartphones
    - To install execute the following:
        1. Navigate to: https://orbot.app/en/
        2. Tap on `GET IT ON F-Droid`.
        3. Tap on the URl underneath `Direct HTTPS`.
        4. Navigate back to the home screen.
        5. Open the F-Droid app.
        6. Tap on the `Settings` icon in the bottom right.
        7. Tap on the `Repositories` menu item.
        8. Toggle on `Guardian Project Official Releases`.
        9. Tap the back button.
        10. Tap on the `Latest` menu in the bottom left.
        11. Tap on the green magnifying glass icon in the bottom right.
        12. Enter `orbot` in the search menu.
        13. Tap on `Orbot: Proxy with Tor by Guardian Project` (the one with the onion icon).
        14. Tap on `INSTALL`.
        15. A noticed will be displayed saying, `Orbot - Do you want to install this app?`, tap `Install`.
* Bitwarden - An open source password manager.
* Ripple - A panic button to automatically delete sensitive data quickly.
