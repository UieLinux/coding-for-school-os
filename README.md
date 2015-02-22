Coding for School OS
===
Coding for school OS, per gli amici CFS-OS, è una distribuzione per [Raspberry PI](http://www.raspberrypi.org) basata su [Raspbian](http://www.raspbian.org).

![Imgur](http://i.imgur.com/vFVXEB7.png?1)

Installazione
===

1. Scaricare CFS-OS
---
Cliccate qui: to_be_complete

2. Scompattare il file che avete scaricato
---
* Cliccate con il tasto destro del mouse sul file e nel menù che vo apparirà selezionate “Extract all”
* Attendi il completamento della procedura, al termine apparirà un file con estensione .img

3. Creare l'SD con Win32DiskImager (Windows)
---
Se nel tuo computer hai windows, usa questa procedura per installare CFS-OS nella SD.

* Scarica il file win32diskimager-binary.zip da: https://launchpad.net/win32-image-writer/+download
* Decomprimi il file .zip nella stessa directory in cui è stato scompattato il file del S.O.
* Al termine della procedura verrà visualizzata una nuova directory chiamata win32diskimager-binary
* Accedete alla directory creata ed avviate il file Win32DiskImager.exe (se utilizzate
Windows 7 o Windows 8 dovrete cliccare con il tasto destro del mouse sul file e selezionare “Esegui come
amministratore”).
* Se la vostra scheda SD non compare automaticamente nella sezione Device dovrete andare a selezionarla
manualmente dall’apposita tendina.
* Nella sezione Image File selezionate il file .img di CFS-OS che avete scaricato e decompresso
* Clicca su Write
* La procedura richiede alcuni minuti, al termine la scheda SD potrà essere usata sul vostro Raspberry Pi 

4. Creare l'immagine con dd (Linux)
---
Se nel tuo computer hai Linux, usa questa procedura per installare CFS-OS nella SD.

* Apri una finestra terminale 
* Vai nella cartella in cui hai scaricato il file img
* Esegui il seguente comando
```bash
dd if=./immagine.img of=/dev/sdX bs=4k
```

5. Avviate CFS-OS
---
L'installazione è finita.
Mettete l'SD nella Raspberry è iniziate a divertirvi.
