#!/bin/bash
# quirinux-kernel-it.sh

# Programmato da Charlie Martinez (Carlos Mariano Martinez Bourio)

# Sito ufficiale: www.quirinux.org
# Contatto diretto: cmartinez@quirinux.org
# https://github.com/quirinux-so

# GPL Versione 3 
# https://github.com/quirinux-so/quirinux-kernel/blob/master/LICENCE

# GENERA IL MENU GRAFICO CON ZENITY

opc=$(zenity --width=350 --height=220 --title=Quirinux --entry --text="        
              Installazione del kernel AVL 5.4.28
              Trulan Martin Low-Latency Kernel
              Inserire un'opzione: 
	             1) Installare il kernel  
	             2) Uscita 
"
)
case $opc in

"1") 

(

# INSTALLAZIONE DELLE DIPENDENZE

echo "# Aggiornamento dell'elenco delle fonti"; sleep 1s
sudo apt-get update -y

echo "# Installazione delle dipendenze"; sleep 1s
for paquetes_dependencias in zenity wget; do sudo apt-get install -y $paquetes_dependencias; done
sudo apt-get install -f

# INSTALLAZIONE DI KERNEL AVL

echo "# Download del kernel"; sleep 1s
wget https://cloud.astian.org/index.php/s/AWtTbWF6rXYkny8/download -O linux-image-5.4.28avl2-lowlatency.deb

echo "# Download delle intestazioni del kernel"; sleep 1s
wget https://cloud.astian.org/index.php/s/M4HR74qXGbwWTBy/download -O linux-headers-5.4.28avl2-lowlatency.deb

echo "# Installazione del nuovo kernel"; sleep 1s
sudo dpkg -i linux-headers-5.4.28avl2-lowlatency.deb linux-image-5.4.28avl2-lowlatency.deb

echo "# Kernel installato. Puoi riavviare per applicare le modifiche.";; sleep 1s
)|

zenity --progress --pulsate 
sudo rm /etc/apt/sources.list.d/kernel-avlinux.list
title="Quirinux"
percentage=0
;;

"2")

	exit 0
;; 

esac
