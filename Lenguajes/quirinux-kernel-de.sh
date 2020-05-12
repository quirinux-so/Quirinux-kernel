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

# ABHÄNGIGKEITEN INSTALLIEREN

echo "# Quellliste aktualisieren"; sleep 1s
sudo apt-get update -y

echo "# Abhängigkeiten installieren"; sleep 1s
for paquetes_dependencias in zenity wget; do sudo apt-get install -y $paquetes_dependencias; done
sudo apt-get install -f

# INSTALLIEREN DES KERNELS AVL

echo "# Kernel herunterladen"; sleep 1s
wget https://cloud.astian.org/index.php/s/AWtTbWF6rXYkny8/download -O linux-image-5.4.28avl2-lowlatency.deb

echo "# Herunterladen von Kernel-Headern"; sleep 1s
wget https://cloud.astian.org/index.php/s/M4HR74qXGbwWTBy/download -O linux-headers-5.4.28avl2-lowlatency.deb

echo "# Den neuen Kernel installieren"; sleep 1s
sudo dpkg -i linux-headers-5.4.28avl2-lowlatency.deb linux-image-5.4.28avl2-lowlatency.deb

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
