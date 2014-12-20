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


exit
echo "Exit to the $USER user" 

echo "Setting wallpaper" 
pcmanfm --set-wallpaper /usr/share/coding-for-school/wallpapers/cfs-wallpaper.png 

