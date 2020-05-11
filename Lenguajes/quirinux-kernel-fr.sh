#!/bin/bash
# quirinux-kernel-fr.sh

# Programmé par Charlie Martínez (Carlos Mariano Martínez Bourio)

# Site officiel: www.quirinux.org
# Contact direct: cmartinez@quirinux.org
# https://github.com/quirinux-so

# Licence GPL version 3
# https://github.com/quirinux-so/quirinux-kernel/blob/master/LICENCE

# GÉNÉRER LE MENU GRAPHIQUE AVEC ZENITY

opc=$(zenity --width=350 --height=220 --title=Quirinux --entry --text="        
              Installation du Kernel AVL 5.4.28
              Trulan Martin faible latence
              Entrez une option:
	             1) Installer le noyau
	             2) Quitter
"
)
case $opc in

"1") 

(
echo "# Ajout de dépôt"; sleep 1s

# GÉNÉRER LE FICHIER DE LISTE DE DÉPÔT AVL

sudo touch /etc/apt/sources.list.d/kernel-avlinux.list
echo "# AV Linux" >> /etc/apt/sources.list.d/kernel-avlinux.list
echo " " >> /etc/apt/sources.list.d/kernel-avlinux.list
echo "deb [ trusted=yes ] http://www.bandshed.net/kernels/apt/ buster main" >> /etc/apt/sources.list.d/kernel-avlinux.list

# INSTALLER LE KERNEL AVL

echo "# Mise à jour des sources"; sleep 1s
sudo apt-get update -y
echo "# Installation du nouveau noyau"; sleep 1s

for packages_kernel in linux-image-5.4.28avl2-lowlatency linux-headers-5.4.28-rt19avl2; do sudo apt-get install -y $packages_kernel; done
sudo apt-get install -f
echo "# Noyau installé. Vous pouvez redémarrer pour appliquer les modifications."; sleep 1s
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
  
