#!/bin/bash
# quirinux-kernel-gl.sh

# Programado por Charlie Martínez ®

# Sitio oficial: www.quirinux.org
# Contacto directo: cmartinez@quirinux.org
# https://github.com/quirinux-so

# Licenza GPL Versión 3
# https://github.com/quirinux-so/quirinux-kernel/blob/master/LICENCE

# XERA O MENÚ GRÁFICO CON ZENITY

opc=$(zenity --width=350 --height=220 --title=Quirinux --entry --text="        
              Instalación do Kernel AVL 5.4.28
              Trulan Martin de baixa latencia
              Introduce unha opción: 
	             1) Instala Kernel 
	             2) Saír
"
)
case $opc in

"1") 

(

# INSTALACIÓN DEPENDENCIAS

echo "# Actualización da lista de fontes"; sleep 1s
sudo apt-get update -y

echo "# Instalando dependencias"; sleep 1s
for paquetes_dependencias in zenity wget; do sudo apt-get install -y $paquetes_dependencias; done
sudo apt-get install -f

# INSTALACIÓN DO AVL DE KERNEL

echo "# Download Kernel"; sleep 1s
wget --no-check-certificate 'https://docs.google.com/uc?export=download&id=1YX99kSMorEWKgTnypg-cVKzF4sFXdIGf' -O linux-image-5.4.28avl2-lowlatency.deb

echo "# Download Kernel"; sleep 1s
wget --no-check-certificate 'https://kernelavl.quirinux.org' -O linux-image-5.4.28avl2-lowlatency.deb

echo "# Dowload Headers"; sleep 1s
wget  --no-check-certificate 'https://headersavl.quirinux.org' -O linux-headers-5.4.28avl2-lowlatency.deb

echo "# Kernel instalado. Podes reiniciar para aplicar os cambios."; sleep 1s
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
