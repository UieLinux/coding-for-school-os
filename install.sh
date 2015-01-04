#!/bin/sh

if [ $USER != "root" ]; then
   echo "Devi sudare per essere root"
   exit
fi

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

echo "Custom panel config installation..."
install -m 744 -o pi config/lxpanel/LXDE-pi/panels/panel \
		/home/pi/.config/lxpanel/LXDE-pi/panels/		
echo "Restart panel"
su -l pi -c "lxpanelctl restart"

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

echo "Install development packages"
apt-get -y install vim

# Install bonjour service. 
# Use avahi-discoverer on client to show devices list
apt-get -y install avahi-daemon

# Control of GPIO from LIRC
apt-get -y install lirc liblircclient-dev
#wget http://goo.gl/T8cLSU -O isid6.sh
#sudo bash isid6.sh

echo "System update..."
apt-get update && apt-get upgrade

echo "Update Raspberry firmware"
#apt-get -y install rpi-update
rpi-update

echo "Clean home directory"
#TODO gallochri: I think that python games folders can be left
#rm -rf /home/pi/python_games

read -t 10 -p "Hit ENTER or wait ten seconds for reboot"
#Autodestruction
rm -r /home/pi/$CFS-os
echo "Rebooting system..."
reboot

