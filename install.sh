#!/bin/sh

if [ $USER != "root" ]; then
   echo "Devi sudare per essere root"
   exit

CFS=coding-for-school

echo "Hostname generator installation..."
cd sources
install -m 755 name_generator /usr/local/bin/
install -m 755 cfs-registration /etc/init.d/
update-rc.d cfs-registration defaults
install -m 755 cfs-hostname-changer /etc/init.d/
update-rc.d cfs-hostname-changer defaults

echo "Artwork installation..."
cd ../cfs-ui
rm -rf /usr/share/{icons/$CFS,themes/$CFS,$CFS}
cp -R icons /usr/share/$CFS
cp -R theme /usr/share/themes/$CFS
cp -R artwork /usr/share/$CFS

echo "Custom pannel config installation..."
cp -R config/LXDE-pi /home/pi/.config/lxpanel
echo "Restart panel"
su -l pi -c "lxpanelctl restart"

####################Code above revisioned##################
#TODO put some where this:
# echo "System update..."
# apt-get update && apt-get upgrade


#echo "Set correct shutdown icon for panel"
#sed -i 's/gnome-logout/system-shutdown-panel/g' /usr/share/applications/lxde-logout.desktop

#echo "Override lxde menu icon"
#cp -R /usr/share/coding-for-school/cfs-start-menu.png /usr/share/lxde/images/lxde-icon.png

#echo "Override logout lxde banner"
#cp -R /usr/share/coding-for-school/cfs-logout-banner.png /usr/share/lxde/images/logout-banner.png









echo "Setting LXDE panel"
patch -N -p1 /home/pi/.config/lxpanel/LXDE/panels/panel < ./patch/panel.diff

echo "Setting wallpaper"
su -l pi -c "pcmanfm --set-wallpaper /usr/share/coding-for-school/cfs-wallpaper.png"

echo "Install scratch GPIO"
# Note: https://pihw.wordpress.com/lessons/rgb-led-lessons/rgb-led-lesson-2-scratch-gpio-getting-started/
cd /home/pi
wget http://goo.gl/Pthh62 -O install_scratchgpio5.sh
bash install_scratchgpio5.sh
rm -rf install_scratchgpio5.sh

echo "Install WiringPI"
rm -rf wiringPI
git clone git://git.drogon.net/wiringPi
cd wiringPi
./build

echo "Update Raspberry firmware"
#apt-get -y install rpi-update
rpi-update

echo "Install other packages"
apt-get -y install vim

# Install bonjour service. 
# Use avahi-discoverer on client to show devices list
apt-get -y install avahi-daemon

# Control of GPIO from LIRC
apt-get -y install lirc liblircclient-dev

#wget http://goo.gl/T8cLSU -O isid6.sh
#sudo bash isid6.sh

# vnc server
apt-get -y install tightvncserver

echo "Remove desktop icons"
rm -f /home/pi/Desktop/debian-reference-common.desktop
rm -f /home/pi/Desktop/idle*
rm -f /home/pi/Desktop/shutdown.desktop
rm -f /home/pi/Desktop/python-games.desktop
rm -f /home/pi/Desktop/minecraft-pi.desktop
rm -f /home/pi/Desktop/lxterminal.desktop
rm -f /home/pi/Desktop/wolfram-*
rm -f /home/pi/Desktop/ocr_resources.desktop
rm -f /home/pi/Desktop/epiphany-browser.desktop
rm -f /home/pi/Desktop/pistore.desktop
rm -f /home/pi/Desktop/sonic-pi.desktop
rm -f /home/pi/Desktop/scratch.desktop
rm -f /home/pi/Desktop/scratchgpio5.desktop
rm -rf /home/pi/Scratch

echo "Clean home directory"
rm -rf /home/pi/python_games
rm -f /home/pi/ocr_pi.png

echo "Clean Trash"
rm -f /home/pi/.local/share/Trash/info/*
rm -f /home/pi/.local/share/Trash/files/*

echo "done!\n"

