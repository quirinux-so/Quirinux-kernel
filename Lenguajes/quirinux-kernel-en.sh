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
echo "# Adding repositories"; sleep 1s

# GENERATE THE AVL REPOSITORY LIST FILE

sudo touch /etc/apt/sources.list.d/kernel-avlinux.list
echo "# AV Linux" >> /etc/apt/sources.list.d/kernel-avlinux.list
echo " " >> /etc/apt/sources.list.d/kernel-avlinux.list
echo "deb [ trusted=yes ] http://www.bandshed.net/kernels/apt/ buster main" >> /etc/apt/sources.list.d/kernel-avlinux.list

# INSTALL THE KERNEL AVL

echo "# Updating sources"; sleep 1s
sudo apt-get update -y
echo "# Installing the new kernel"; sleep 1s

for packages_kernel in linux-image-5.4.28avl2-lowlatency linux-headers-5.4.28-rt19avl2; do sudo apt-get install -y $packages_kernel; done
sudo apt-get install -f
echo "# Kernel installed"; sleep 1s
)|
zenity --progress --pulsate 
echo " You can restart to apply the changes."
title="Quirinux"
percentage=0
;;

"2")

	exit 0
;; 
esac 
	done
	
