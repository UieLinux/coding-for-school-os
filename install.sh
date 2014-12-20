#!/bin/sh

if [ $USER != "root" ]; then
   echo "Devi sudare per essere root"
   exit
fi

echo "Copy icons pack..."
cp -R ./cfs-ui/icons/coding-for-school/ /usr/share/icons

echo "Copy theme pack..."
cp -R ./cfs-ui/themes/coding-for-school/ /usr/share/themes

echo "Copy artwork pack..."
cp -R ./cfs-ui/artwork/coding-for-school/ /usr/share/coding-for-school

echo "Set correct shutdown icon for panel"
sed -i 's/gnome-logout/system-shutdown-panel/g' /usr/share/applications/lxde-logout.desktop 

#echo "Install pavucontrol"
#apt-get install -y pavucontrol

echo "Togliere l'icona screenlock dal pannello"
echo "1. Tasto destro sull'icona"
echo "2. Impostazioni pannello"
echo "3. In scheda Applet pannello scegliere barra avvio applicazioni (ultima)"
echo "4. Cliccare Modifica"
echo "5. Rimuovere Screenlock"
echo "Quando fatto premere invio"
read x
exit
echo "Exit to the $USER user" 

echo "Setting wallpaper" 
pcmanfm --set-wallpaper /usr/share/coding-for-school/wallpapers/cfs-wallpaper.png 

