#!/bin/bash
# quirinux-kernel-de.sh

# Programmiert von Charlie Martinez (Carlos Mariano Martinez Bourio).

# Offizielle Website: www.quirinux.org
# Direkter Kontakt: cmartinez@quirinux.org
# https://github.com/quirinux-so

# GPL Version 3 
# https://github.com/quirinux-so/quirinux-kernel/blob/master/LICENCE

# DAS GRAFISCHE MENÜ MIT ZENITY GENERIEREN

opc=$(zenity --width=350 --height=220 --title=Quirinux --entry --text="        
              Installation des AVL-Kernels 5.4.28
              Trulan Martin Kernel mit niedriger Latenz
              Geben Sie eine Option ein:  
	             1) Kernel installieren 
	             2) Beenden 
"
)
case $opc in

"1") 

(
echo "# Hinzufügen von Respositorien"; sleep 1s

# DIE AVL-REPOSITORY-LISTENDATEI ERZEUGEN

sudo touch /etc/apt/sources.list.d/kernel-avlinux.list
echo "# AV Linux" >> /etc/apt/sources.list.d/kernel-avlinux.list
echo " " >> /etc/apt/sources.list.d/kernel-avlinux.list
echo "deb [ trusted=yes ] http://www.bandshed.net/kernels/apt/ buster main" >> /etc/apt/sources.list.d/kernel-avlinux.list

# DEN AVL-KERNEL INSTALLIEREN

echo "# Software-Aktualisierung"; sleep 1s
sudo apt-get update -y
echo "# Instalando el nuevo kernel"; sleep 1s

for pakete_kernel in linux-image-5.4.28avl2-lowlatency linux-headers-5.4.28-rt19avl2; do sudo apt-get install -y $pakete_kernel; done
sudo apt-get install -f
echo "# Kernel installiert. Sie können neu starten, um die Änderungen zu übernehmen."; sleep 1s
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
  
