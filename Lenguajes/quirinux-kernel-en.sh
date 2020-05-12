#!/bin/bash
# quirinux-kernel-en.sh

# Programmed by Charlie Martínez (Carlos Mariano Martínez Bourio).

# Official Site: www.quirinux.org
# Direct contact: cmartinez@quirinux.org
# https://github.com/quirinux-so

# GPL License Version 3
# https://github.com/quirinux-so/quirinux-kernel/blob/master/LICENCE

# GENERATE THE GRAPHIC MENU WITH ZENITY

opc=$(zenity --width=350 --height=220 --title=Quirinux --entry --text="        
              Installation of the Kernel AVL 5.4.28
              Trulan Martin low latency
              Enter an option:
	             1) Install Kernel 
	             2) Exit
"
)
case $opc in

"1") 

(
# INSTALLING DEPENDENCIES

echo "# Updating source list"; sleep 1s
sudo apt-get update -y

echo "# Installing dependencies"; sleep 1s
for paquetes_dependencias in zenity wget; do sudo apt-get install -y $paquetes_dependencias; done
sudo apt-get install -f

# INSTALLING THE KERNEL AVL

echo "# Downloading Kernel"; sleep 1s
wget https://cloud.astian.org/index.php/s/AWtTbWF6rXYkny8/download -O linux-image-5.4.28avl2-lowlatency.deb

echo "# Downloading Kernel Headers"; sleep 1s
wget https://cloud.astian.org/index.php/s/M4HR74qXGbwWTBy/download -O linux-headers-5.4.28avl2-lowlatency.deb

echo "# Installing the new kernel"; sleep 1s
sudo dpkg -i linux-headers-5.4.28avl2-lowlatency.deb linux-image-5.4.28avl2-lowlatency.deb

echo "# Kernel installed. You can reboot to apply the changes."; sleep 1s
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
