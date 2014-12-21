Coding for School
===

Installare Raspbian su SD
---
1. Scaricare l'ultima versione di raspbian:
```
$ wget http://downloads.raspberrypi.org/raspbian_latest
```
- Inserire l'SD nel computer ed eseguire:
```
# unzip -p 201X-XX-XX-wheezy-raspbian.zip | dd of=/dev/sdX bs=4M
```

Predisporre l'ambiente di sviluppo
---
1. Scaricare l'ultima immagine di raspbian (vedi sopra)
- Seguire questa guida per rendere l'immagine avviabile con qemu
```
[http://xecdesign.com/qemu-emulating-raspberry-pi-the-easy-way/](http://xecdesign.com/qemu-emulating-raspberry-pi-the-easy-way/)
```

- Impostare xorg per farlo andare a 800x600. Creare in file /etc/X11/xorg.conf e incollarci:

```
Section "Screen"
Identifier "Default Screen"
SubSection "Display"
Depth 16
Modes "800x600" "640x480"
EndSubSection
EndSection
```


Configurare Raspbian (first boot)
---
Al primo boot si avvia in automatico il tool raspi-config. Eseguire i seguenti passi:

1. Expand Filesystem
  - Basta dare invio e riformatta la SD in modo da occuparla interamente
2. Change User Password
  - Impostare una password per l'utente pi (es: ragno)
3. Enable Boot to Desktop/Scratch
  - Selezionare "Desktop Log in..."
4. Internationalisation Options
  - I1-Change Locale
      - [*]it_IT.UTF-8 UTF-8 default locale for system enviroment
  - I2-Change Timezone
      - Europe->Rome
  - I3-Change Keyboard Layout
      - Generic 105-key (Intl) PC -> Other -> Italian -> Italian -> The default for
     the keyboard layout -> No compose key -> No
Finish -> Yes
5. Effettuare il reboot

Personalizzare l'aspetto (Second boot)
---
### Modifiche automatiche all'interfaccia

1. Al primo boot aprire una sessione terminale
- Nella home (/home/pi) eseguire
```
$ git clone https://github.com/UieLinux/coding-for-school-os
```
- Andare nella cartella cooding-for-school-os
```
$ cd ./coding-for-school-os
```
- Diventare root:
```
$ sudo -s
```
- Installare i temi
```
# ./install.sh
```

### Modifiche manuali all'interfaccia

1. Togliere l'icona screenlock (in basso a destra)
- Togliere l'icona cpu usage monitor
- In Panel Preference / Appearance, scegliere Solid theme
- In Panel Preference / Appearance, scegliere Font color #393939
- In Preferenze / Openbox Configuration Manager, scegliere il tema "coding-for-school"
- In Preferences / Customize Look and Feel, scegliere in Widget "coding-for-school"
- In Preferences / Customize Look and Feel, scegliere in Icon theme, coding-for-school
- Aggiornare il sistema e fare il reboot:
```
$ sudo apt-get update && sudo apt-get upgrade
```
- Svuotare il cestino

Note:
---
1. Vedere se è il caso di eliminare alcuni programmi invece di togliere solo le icone dal desktop
-. Pensare bene a che programmi e link aggiungere, tra cui alcune idee:
  - Client [owncloud](http://owncloud.org/)
  - [blockly](https://code.google.com/p/blockly/)
  - [Kano pong](http://www.codecademy.com/courses/kano-pong/0/1)
  - [kids Ruby](http://kidsruby.com)

Risorse
--- 
* http://www.linux-mitterteich.de/fileadmin/datafile/papers/2013/qemu_raspiemu_lug_18_sep_2013.pdf
* https://github.com/cymplecy/scratch_gpio
* http://simplesi.net/scratchgpio/
* https://extremeshok.com/1081/raspberry-pi-raspbian-tuning-optimising-optimizing-for-reduced-memory-usage/
* https://gist.github.com/cybear/4751158
* http://computers.tutsplus.com/tutorials/learn-how-to-use-raspberry-pi-gpio-pins-with-scratch--mac-59941
* http://www.danielemeli.com/configurazione-iniziale-del-raspberry-pi/
