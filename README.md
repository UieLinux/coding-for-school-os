Coding for School OS
===
Coding for school OS, per gli amici CFS-OS, è basata sulla distribuzione [Raspbian](http://www.raspbian.org) per [Raspberry PI](http://www.raspberrypi.org).
La personalizzazione consiste in 4 punti fondamentali:

1. Modifica dell'aspetto (Temi, Icone, ecc..)
2. Installazione nuovi programmi
3. Eliminazione programmi ritenuti inutili
4. Ottimizzazione di sistema per migliorare le prestazioni 

![Imgur](http://i.imgur.com/vFVXEB7.png?1)

1. Ambiente di sviluppo
---
Per applicare le personalizzazioni, si parte dalla distro di partenza e si applicano le modifiche.
Ci sono 2 possibilità.

1. Riportare tutte le modifiche su una installazione fatta su una raspberry (vedi Appendice)
2. Eseguire sul computer una macchina virtuale con qemu in emulazione.

Per eseguire la VM segure le seguenti indicazioni:

* Scaricare l'ultima immagine di [raspbian](http://downloads.raspberrypi.org/raspbian_latest) ed estrarla: unzip 201X-XX-XX-wheezy-raspbian.zip
* Scaricare il [kernel](http://xecdesign.com/downloads/linux-qemu/kernel-qemu) (oppure utilizzare quello nella cartella qemu-raspbian)
* Eseguire lo script qemu-rasp-first-boot.sh (è nella cartella qemu-raspbian) assicurandosi che i percorsi dei file siano corretti
* Al prompt dei comandi aprire il file /etc/ld.so.preload e commentare l'unica riga così: #/usr/lib/arm-linux-gnueabihf/libcofi_rpi.so
* Creare il file /etc/udev/rules.d/90-qemu.rules con il seguente contenuto:
```
   KERNEL=="sda", SYMLINK+="mmcblk0"
   KERNEL=="sda?", SYMLINK+="mmcblk0p%n"
   KERNEL=="sda2", SYMLINK+="root"
```
* Spegnere il sistema digitando exit
* Eseguire script qemu-rasp.sh
* Fonte: [http://xecdesign.com/qemu-emulating-raspberry-pi-the-easy-way/](http://xecdesign.com/qemu-emulating-raspberry-pi-the-easy-way/)


2. Configurazione iniziale
---
Al primo boot si avvia in automatico il tool raspi-config. Eseguire i seguenti passi:

* (1)Expand Filesystem
  - Basta dare invio e riformatta la SD in modo da occuparla interamente
* (2)Change User Password
  - Impostare una password per l'utente pi (es: ragno)
* (3)Enable Boot to Desktop/Scratch
  - Selezionare "Desktop Log in..."
* (4)Internationalisation Options
  - I1-Change Locale
      - [*]it_IT.UTF-8 UTF-8 default locale for system enviroment
  - I2-Change Timezone
      - Europe->Rome
  - I3-Change Keyboard Layout
      - Generic 105-key (Intl) PC -> Other -> Italian -> Italian -> The default for
     the keyboard layout -> No compose key -> Finish -> Yes
* Impostare xorg per farlo andare a 800x600. Creare in file /etc/X11/xorg.conf e incollarci:
```
  Section "Screen"
  Identifier "Default Screen"
  SubSection "Display"
  Depth 16
  Modes "800x600" "640x480"
  EndSubSection
  EndSection
```
* Fare il reboot

3. Personalizzazione interfaccia
---

* Al primo boot aprire una sessione terminale
* Nella home (/home/pi) eseguire
```
  $ git clone https://github.com/UieLinux/coding-for-school-os
```
* Spostarsi nella cartella coding-for-school-os
```
  $ cd ./coding-for-school-os
```
* Diventare root:
```
  $ sudo -s
```
* Installare i temi
```
  # ./install.sh
```

~~4. Modifiche da effettuare manualmente~~
---
~~Alcune modifiche all'interfaccia non sono ancora state riportate nello script di installazione. Per ora tali modifiche sono da effettuare manualmente, e sono:~~

* ~~Tasto destro sul pannello / Impostazioni Pannello~~
   * ~~In "Aspetto", "Sfondo" scegliere "Tema di sistema"~~
   * ~~In "Aspetto", "Carattere", "Colore personalizzato" cliccare il pulsante bianco~~
      * ~~In Nome colore impostare #393939~~
   * ~~In "Applet di pannello" scegliere "Pager scrivania" e cliccare "Rimuovi"~~
   * ~~In "Applet di pannello" scegliere "Monitoraggio CPU" e cliccare "Rimuovi"~~
   * ~~In "Applet di pannello" scegliere "Barra avvio applicazioni" e cliccare "Modifica"~~
      * ~~Nella finestra "Barra di avvio applicazioni", sulla sinistra, scegliere "Logout" e cliccare "Rimuovi"~~
      * ~~Nella finestra "Barra di avvio applicazioni", sulla sinistra, scegliere "Screenlock" e cliccare "Rimuovi"~~
* ~~In Menu / Preferenze / Openbox Configuration Manager, scegliere in Tema -> "coding-for-school"~~
* ~~In Menu / Preferenze / Openbox Configuration Manager, scegliere Desktop e mettere 1 nel numero di desktop virtuali~~
* ~~In Menu / Preference / Personalizza Aspetto e Stile, scegliere in Widget -> "coding-for-school"~~
* ~~In Menu / Preference / Personalizza Aspetto e Stile, scegliere in Tema di icone -> "coding-for-school"~~

5. Creare l'immagine finale di CFS-OS
---
* Estraete la mSD card dalla Raspberrypi (da spenta) e inseritela in un lettore nel PC
* Individuate la lettera assegnata al dispositivo con fdisk -l
* Copiate l'immagine raw della mSD con dd:
```
  # dd if=/dev/sdX of=CFS-OS.img
```
* Comprimere l'immagine con 7z
```
  # 7z a CFS-OS.7z CFS-OS.img
```
* Installare l'immagine compressa su una nuova mSD card
```
  # 7z e -so CFS-OS.7z | dd of=/dev/sdX
```

6. Appendice
---
### Installare Raspbian su microSD

* Scaricare l'ultima versione di raspbian:
```
  $ wget http://downloads.raspberrypi.org/raspbian_latest
```
* Inserire l'SD nel computer ed eseguire:
```
  # unzip -p 201X-XX-XX-wheezy-raspbian.zip | dd of=/dev/sdX bs=4M
```
###Configurazione Iniziale

Valgono gli stessi passaggi per l'installazione in virtuale.
Nel caso ci siano dei problemi con l'overscan e vengano visulaizzate delle bande nere attorno
all'immagine del desktop è possibile disabilitarlo:
*(8) Advaced Options
	- A1 Overscan
	- <Disable>

### Elenco icone di default sul desktop di Raspbian

- Solo il cestino

### Icone rimanenti

- Scratch
- Cestino

### Note:

* Valutare se è il caso di eliminare alcuni programmi invece di togliere solo le icone dal desktop
* Valutare quali programmi e link aggiungere, tra cui alcune idee:
  - [owncloud](http://owncloud.org/)
  - [blockly](https://code.google.com/p/blockly/)
  - [Kano pong](http://www.codecademy.com/courses/kano-pong/0/1)
  - [kids Ruby](http://kidsruby.com)

7. Risorse
--- 
* http://www.linux-mitterteich.de/fileadmin/datafile/papers/2013/qemu_raspiemu_lug_18_sep_2013.pdf
* https://github.com/cymplecy/scratch_gpio
* http://simplesi.net/scratchgpio/
* https://extremeshok.com/1081/raspberry-pi-raspbian-tuning-optimising-optimizing-for-reduced-memory-usage/
* https://gist.github.com/cybear/4751158
* http://computers.tutsplus.com/tutorials/learn-how-to-use-raspberry-pi-gpio-pins-with-scratch--mac-59941
* http://www.danielemeli.com/configurazione-iniziale-del-raspberry-pi/
* https://www.safaribooksonline.com/library/view/raspberry-pi-hacks/9781449362737/ch01.html
* https://github.com/raspberrypilearning
* http://www.meccanismocomplesso.org/starting-raspberry-pi-introduction/
* http://wiringpi.com/
* http://pi4j.com/images/j8header-large.png
* http://www.maffucci.it/2012/07/21/raspberry-pi-lezione-01-conosciamo-la-scheda/
* http://blog.oscarliang.net/use-gpio-pins-on-raspberry-pi/
* http://www.raspberrypi.org/forums/viewtopic.php?f=62&t=18832
* https://learn.adafruit.com/webide/installation
* http://www.raspberrypi.org/forums/viewtopic.php?f=66&t=18207
* http://www.emcu.it/RaspBerryPi/RaspBerryPi.html
* https://learn.sparkfun.com/tutorials/raspberry-gpio
* http://www.mauroalfieri.it/elettronica/webiopi-raspberry-controllo-remoto-gpio.html
* http://www.vincenzov.net/tutorial/RaspberryPi/
