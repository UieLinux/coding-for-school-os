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

install -m 755 hostname.sh /etc/init.d/
install -m 755 hostname_changed.sh /etc/init.d/
update-rc.d hostname_changed.sh defaults 36 S .

# Install VNC Server
cd ../cfs-ui
apt-get -y install tightvncserver
su -l pi -c "mkdir -p ~/.config/autostart/"
install -m 755 -o pi config/autostart/autotightvnc.desktop \
	/home/pi/.config/autostart
install -m 755 config/autostart/tightvnc.desktop \
        /usr/share/applications

echo "Artwork installation..."
#TODO: no use of coding-for-school icons theme, remove it?
rm -rf /usr/share/icons/$CFS
rm -rf /usr/share/themes/$CFS
rm -rf /usr/share/$CFS
cp -R icons /usr/share/icons/$CFS
cp -R theme /usr/share/themes/$CFS
cp -R artwork /usr/share/$CFS

echo "Custom panel config installation..."
install -m 644 -o pi config/lxpanel/LXDE-pi/panels/panel \
		/home/pi/.config/lxpanel/LXDE-pi/panels/
echo "Restart panel"
su -l pi -c "lxpanelctl restart"

echo "Setting wallpaper"
su -l pi -c "pcmanfm --set-wallpaper /usr/share/coding-for-school/cfs-wallpaper.png"
su -l pi -c "pcmanfm --wallpaper-mode=stretch"

echo "Setting lxde theme..."
install -m 644 -o pi config/openbox/lxde-pi-rc.xml \
		/home/pi/.config/openbox/lxde-pi-rc.xml

#TODO: no use of coding-for-school icons theme, remove it?
echo "Setting icon theme..."
su -l pi -c "mkdir -p ~/.config/lxsession/LXDE-pi/"
su -l pi -c "chmod -R 700 ~/.config/lxsession/"
install -m 644 -o pi config/lxsession/LXDE-pi/desktop.conf \
		/home/pi/.config/lxsession/LXDE-pi/desktop.conf

#Resource https://github.com/cymplecy/scratch_gpio
#Resource http://simplesi.net/scratchgpio/
#Resource https://pihw.wordpress.com/lessons/rgb-led-lessons/rgb-led-lesson-2-scratch-gpio-getting-started/
echo "Install scratch GPIO6"
cd /home/pi
wget https://raw.githubusercontent.com/cymplecy/scratch_gpio/V6/install_scratchgpio6.sh
bash install_scratchgpio6.sh
rm -rf install_scratchgpio6.sh
cd Desktop
sed -i "s/Application;Education;Development;/Development;/g" scratchgpio6*
mv scratchgpio6* /usr/share/applications/
cd /home/pi

#echo "Install scratch GPIO5"
#wget http://goo.gl/Pthh62 -O install_scratchgpio5.sh
#bash install_scratchgpio5.sh
#rm -rf install_scratchgpio5.sh

echo "System update..."
apt-get update && apt-get upgrade -y

echo "Install Pibrella python3 module..."
apt-get -y install python3-pip
pip-3.2 install pibrella
echo "Install Pibrella python module..."
apt-get -y install python-pip
pip install pibrella

echo "Install WiringPI"
rm -rf wiringPI
git clone git://git.drogon.net/wiringPi
cd wiringPi
./build
cd ..

# Install bonjour service.
# Use avahi-discoverer on client to show devices list
apt-get -y install avahi-daemon

# Control of GPIO from LIRC
apt-get -y install lirc liblircclient-dev

echo "Update Raspberry firmware"
#apt-get -y install rpi-update
rpi-update

echo "Clean desktop"
rm -rf /home/pi/Desktop/*

echo "Clean home directory"

#Self-destruction
rm -r /home/pi/$CFS-os
echo "Rebooting system..."
sleep 5
reboot

