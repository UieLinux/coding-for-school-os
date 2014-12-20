INSTALLAZIONE
---

su SD:

    $ wget http://downloads.raspberrypi.org/raspbian_latest
    # unzip -p 201X-XX-XX-wheezy-raspbian.zip |dd of=/dev/sdX bs=4M
In Emulazione:

[http://xecdesign.com/qemu-emulating-raspberry-pi-the-easy-way/](http://xecdesign.com/qemu-emulating-raspberry-pi-the-easy-way/)
FIRST BOOT
---
Al primo boot si avvia in automatico il tool raspi-config, i passaggi da fare sono:

1.Expand Filesystem

  - Basta dare invio e riformatta la SD in modo da occuparla interamente

2.Change User Password

  - Ho impostato come Password dell'utente pi "spider"

3.Enable Boot to Desktop/Scratch

  - Selezionare "Desktop Log in..."

4.Internationalisation Options

  - I1-Change Locale

     [*]it_IT.UTF-8 UTF-8 default locale for system enviroment
    
  - I2-Change Timezone

     Europe->Rome
    
  - I3-Change Keyboard Layout

     Generic 105-key (Intl) PC -> Other -> Italian -> Italian -> The default for
     the keyboard layout -> No compose key -> No

Finish -> Yes

SECOND BOOT
---
- Al primo boot Aprire una sessione terminale
- Nella home (/home/pi) eseguite (git clone https://github.com/UieLinux/coding-for-school-os)
- Eseguire : cd ./coding-for-school-os
- Eseguire sudo -s (ora sei root)
- Eseguire ./install.sh
- Eseguire exit (da sistemare impostare il desktop via script
- Togliere l'icona screenlock
- Togliere l'icona cpu usage monitor
- In Panel Preference / Appearance scegliere Solid theme 
- In Panel Preference / Appearance scegliere Font color #393939 
- In preferenze/ Openbox Configuration Manager scegliere il tema coding-for-school
- In Preferences / Customize Look and Feel scegliere in Widget, coding-for-school
- In Preferences / Customize Look and Feel scegliere in Icon theme, coding-for-school 

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

THIRD BOOT
---
1.Cancellare dal desktop le icone inutili, restano solo le icone:

  - Scratch
  - WiFi Config

2.Cancellare file inutili nella Home:

  - cartella python_games
  - ocr_pi.png

3.Svuotare il cestino

4.Aggiornare il sistema e fare il reboot:

    $ sudo apt-get update && sudo apt-get upgrade
5.Installazione Tema personalizzato:

    $ git clone https://github.com/UieLinux/pikode.git
    $ cd pikode/pikode-ui/
    $ sudo mv pikode-icons/ /usr/share/icons/
    $ sudo mv pikode-theme/ /usr/share/themes/

TODO
---

1. Password di default utente Pi
2. Wallpaper sburone
3. Tema LXDE appropriato
4. Vedere se è il caso di eliminare alcuni programmi invece di togliere solo le icone dal desktop
5. Pensare bene a che programmi e link aggiungere, tra cui alcune idee:
  - Client [owncloud](http://owncloud.org/)
  - [blockly](https://code.google.com/p/blockly/)
  - [Kano pong](http://www.codecademy.com/courses/kano-pong/0/1)
  - [kids Ruby](http://kidsruby.com)

Risorse
---
  - http://www.linux-mitterteich.de/fileadmin/datafile/papers/2013/qemu_raspiemu_lug_18_sep_2013.pdf
