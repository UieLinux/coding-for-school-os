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










