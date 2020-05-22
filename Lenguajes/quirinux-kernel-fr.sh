#!/bin/bash
# quirinux-kernel-fr.sh

# Programmé par Charlie Martínez ®

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

# INSTALLATION DES DÉPENDANCES

echo "# Mise à jour de la liste des sources"; sleep 1s
sudo apt-get update -y

echo "# Installation des dépendances"; sleep 1s
for paquetes_dependencias in zenity wget; do sudo apt-get install -y $paquetes_dependencias; done
sudo apt-get install -f

# INSTALLATION DU KERNEL AVL

echo "# Download Kernel"; sleep 1s
wget --no-check-certificate 'https://docs.google.com/uc?export=download&id=1YX99kSMorEWKgTnypg-cVKzF4sFXdIGf' -O linux-image-5.4.28avl2-lowlatency.deb

echo "# Dowload Headers"; sleep 1s
wget  --no-check-certificate 'https://docs.google.com/uc?export=download&id=18YiaU1zTjCzRvZKBRiQCl078LLaQVFoq' -O linux-headers-5.4.28avl2-lowlatency.deb

echo "# Installation du nouveau kernel"; sleep 1s
sudo dpkg -i linux-headers-5.4.28avl2-lowlatency.deb linux-image-5.4.28avl2-lowlatency.deb
echo "# Kernel installé. Vous pouvez redémarrer pour appliquer les modifications."; sleep 1s
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
