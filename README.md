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

* Scaricare l'ultima immagine di raspbian (vedi appendice)
* Seguire questa guida per rendere l'immagine avviabile con qemu [http://xecdesign.com/qemu-emulating-raspberry-pi-the-easy-way/](http://xecdesign.com/qemu-emulating-raspberry-pi-the-easy-way/)
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

2. Configurare iniziale
---
Al primo boot si avvia in automatico il tool raspi-config. Eseguire i seguenti passi:

* Expand Filesystem
  - Basta dare invio e riformatta la SD in modo da occuparla interamente
* Change User Password
  - Impostare una password per l'utente pi (es: ragno)
* Enable Boot to Desktop/Scratch
  - Selezionare "Desktop Log in..."
* Internationalisation Options
  - I1-Change Locale
      - [*]it_IT.UTF-8 UTF-8 default locale for system enviroment
  - I2-Change Timezone
      - Europe->Rome
  - I3-Change Keyboard Layout
      - Generic 105-key (Intl) PC -> Other -> Italian -> Italian -> The default for
     the keyboard layout -> No compose key -> No
Finish -> Yes
* Effettuare il reboot

3. Personalizzazione interfaccia
---

* Al primo boot aprire una sessione terminale
* Nella home (/home/pi) eseguire
```
  $ git clone https://github.com/UieLinux/coding-for-school-os
```
* Andare nella cartella cfs-ui
```
  $ cd ./coding-for-school-os/cfs-ui
```
* Diventare root:
```
  $ sudo -s
```
* Installare i temi
```
  # ./install.sh
```

4. Modifiche da effettuare manualmente
---
Alcune modifiche all'interfaccia non sono ancora state riportate nello script di installazione. Per ora tali modifiche sono da effettuare manualmente, e sono:

* Togliere l'icona screenlock (in basso a destra)
* Togliere l'icona cpu usage monitor
* In Panel Preference / Appearance, scegliere Solid theme
* In Panel Preference / Appearance, scegliere Font color #393939
* In Preferenze / Openbox Configuration Manager, scegliere il tema "coding-for-school"
* In Preferences / Customize Look and Feel, scegliere in Widget "coding-for-school"
* In Preferences / Customize Look and Feel, scegliere in Icon theme, "coding-for-school"
* Aggiornare il sistema e fare il reboot:
```
  $ sudo apt-get update && sudo apt-get upgrade
```
* Svuotare il cestino

5. Creare l'immagine finale di CFS-OS
---
TODO

6. Appendice
---
### Installare Raspbian su SD

* Scaricare l'ultima versione di raspbian:
```
  $ wget http://downloads.raspberrypi.org/raspbian_latest
```
* Inserire l'SD nel computer ed eseguire:
```
  # unzip -p 201X-XX-XX-wheezy-raspbian.zip | dd of=/dev/sdX bs=4M
```

### Elenco icone di default sul desktop di Raspbian

- Shutdown		-Accesso rapido allo spegnimento
- IDLE			-IDLE di python 2.7.X	
- OCR Resources		-http://www.ocr.org.uk/qualifications/by-subject/computing/raspberry-pi/
- Scratch		-Programmazione visuale
- Minecraft Pi		-Giovo 3D
- Sonic Pi		-Programmazione visuale
- LXTerminal		-Terminale grafico per LXDE
- Browser Epiphany	-Browser in gtk
- Mathematica		-Calcolo computazionale, varie ed eventuali(http://www.wolfram.com/mathematica)
- Python Games		-Giochini tipo "forza 4" in python
- La guida Debian	-Doc debian locale in Inglese
- WiFi Config		-Strumento di configurazione del wifi
- IDLE 3			-IDLE di python 3.x
- Pi Store		-Software store della raspberry
- Wolfram		-IDE di wolfram (http://www.wolfram.com/raspberry-pi/)

### Icone rimanenti

- Scratch
- Wifi config		-Cambiando nome all'icona

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
