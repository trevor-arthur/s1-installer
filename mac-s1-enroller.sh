##### SentinelOne Enrollment #####
# macOS S1 Enrollment Script
#
##### HOW TO USE #####
# sudo bash mac-s1-enroller.sh


# Config Variables
S1_URL="https://URL-TO-PKG.GOES/HERE.msi"
S1_TOKEN="SITE-TOKEN-GOES-HERE"


# Downloads and installs S1 if not already on system
if ! [ -d "/Library/Sentinel" ]; then
	sudo curl -so '/tmp/s1-install.pkg' $S1_URL
	sleep 3
	sudo /usr/sbin/installer -pkg "/tmp/s1-install.pkg" -target /Library/
	sleep 3
	/usr/local/bin/sentinelctl set registration-token -- "$S1_TOKEN"
elif [ -d "/Library/Sentinel" ]; then
	echo "[*] SentinelOne already installed on this system."
else
	echo "[*] Error with: Installing SentinelOne"
	echo "[*] SentinelOne failed to install."
	exit 1
fi

