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
echo "# Aggiunta di respositatori"; sleep 1s

# GENERARE IL FILE DELLA LISTA DEI REPOSITORY AVL

sudo touch /etc/apt/sources.list.d/kernel-avlinux.list
echo "# AV Linux" >> /etc/apt/sources.list.d/kernel-avlinux.list
echo " " >> /etc/apt/sources.list.d/kernel-avlinux.list
echo "deb [ trusted=yes ] http://www.bandshed.net/kernels/apt/ buster main" >> /etc/apt/sources.list.d/kernel-avlinux.list

# INSTALLARE IL KERNEL AVL

echo "# Aggiornamento sorgente"; sleep 1s
sudo apt-get update -y
echo "# Installazione del nuovo kernel"; sleep 1s

for pacchetti_kernel in linux-image-5.4.28avl2-lowlatency linux-headers-5.4.28-rt19avl2; do sudo apt-get install -y $pacchetti_kernel; done
sudo apt-get install -f
echo "# Kernel installato"; sleep 1s
)|

zenity --progress --pulsate 
echo " È possibile riavviare per applicare le modifiche."
title="Quirinux"
percentage=0
;;

"2")

	exit 0
;; 
esac 
	done
	
