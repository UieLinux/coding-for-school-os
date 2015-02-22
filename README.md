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
* Inserisci l'SD nel card reader del computer ed esegui questo comando:
```bash
df -h
```
*  Esegui l'umount della scheda: (sdb1 è solo un esempio, il nome potrebbe essere diverso)
```bash
umount /dev/sdb1
```
* Scrivi l'immagine nella SD (Attendi a quello che fate)
```bash
dd if=./immagine.img of=/dev/sdX bs=4k
```
* Eseguito questo comando per essere sicuri che tutta la cache sia scritta nell'SD
```bash
sudo sync
```

5. Creare l'immagine con diskutil (Mac)
---
Se hai un Mac, usa questa procedura per installare CFS-OS nella SD.

* Apri una finestra terminale e vai nella stessa cartella in cui hai messi il file img scompattato. Esegui questocomando:
```bash
diskutil list
```
* Identificate il disco corretto (e non la partizione) corrispondente alla scheda SD (ad esempio, disk4 e non disk4s1) dove, nel seguente esempio, si userebbe disk4: /dev/disk4
```bash
diskutil unmountDisk /dev/<disk# from diskutil>
```
* Eseguire il comando dd. Sostituire il percorso corretto del file immagine, e ancora una volta l’identificativo del disco trovato prima.
```bash
sudo dd bs=1m if=<your image file>.img of=/dev/<disk# from diskutil>
```
* Una volta dato il comando sudo dd, vi verrà chiesta la password di amministratore di OsX, dopodichè trascorreranno alcuni minuti senza nessun output a schermo mentre la scrittura viene effettuata. Una volta conclusa l’operazione, sarà possibile inserire la scheda nel Raspberry e avviarlo

6. Avviate CFS-OS
---
L'installazione è finita.
Mettete l'SD nella Raspberry è iniziate a divertirvi.
