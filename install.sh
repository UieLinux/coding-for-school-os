#!/bin/sh

if [ $USER != "root" ]; then
   echo "Devi sudare per essere root"
   exit
fi

echo "Copy icons pack..."
rm -rf /usr/share/icons/coding-for-school
cp -R ./cfs-ui/icons/coding-for-school/ /usr/share/icons/

echo "Copy theme pack..."
rm -rf /usr/share/themes/coding-for-school
cp -R ./cfs-ui/themes/coding-for-school/ /usr/share/themes/

echo "Copy artwork pack..."
rm -rf /usr/share/coding-for-school
cp -R ./cfs-ui/artwork/coding-for-school/* /usr/share/coding-for-school/

echo "Set correct shutdown icon for panel"
sed -i 's/gnome-logout/system-shutdown-panel/g' /usr/share/applications/lxde-logout.desktop 

echo "Override lxde menu icon"
cp -R /usr/share/coding-for-school/cfs-start-menu.png /usr/share/lxde/images/lxde-icon.png

echo "Override logout lxde banner"
cp -R /usr/share/coding-for-school/cfs-logout-banner.png /usr/share/lxde/images/logout-banner.png

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

echo "Setting wallpaper" 
su -l pi -c "pcmanfm --set-wallpaper /usr/share/coding-for-school/cfs-wallpaper.png"

echo "Install scratch GPIO"
# Note: https://pihw.wordpress.com/lessons/rgb-led-lessons/rgb-led-lesson-2-scratch-gpio-getting-started/
cd /home/pi
wget http://goo.gl/Pthh62 –O install_scratchgpio5.sh
bash install_scratchgpio5.sh

#wget http://goo.gl/T8cLSU -O isid6.sh
#sudo bash isid6.sh

echo "done!\n"

#echo "Install pavucontrol"
#apt-get install -y pavucontrol
echo "TODO"
# ---------
echo "Togliere l'icona screenlock dal pannello"
echo "1. Tasto destro sull'icona"
echo "2. Impostazioni pannello"
echo "3. In scheda Applet pannello scegliere barra avvio applicazioni (ultima)"
echo "4. Cliccare Modifica"
echo "5. Rimuovere Screenlock"
echo "6. Rimuovere Workspace selector"

su -l pi -c "lxpanelctl restart"
