#!/bin/bash

# Nombre:	instalar-kernel-avl.sh
# Autor:	Charlie Martínez® <cmartinez@quirinux.org>
# Licencia:	https://www.gnu.org/licenses/gpl-3.0.txt
# Descripción:	Instala el kernel AVL 5.4.28 descargándolo desde los repositorios de Quirinux 2.0
# Versión:	1.00

# Generando el menú gráfico con Zenity:

opc=$(zenity --width=350 --height=220 --title=Quirinux --entry --text="        
              Instalación del Kernel AVL 5.4.28
              de baja latencia de Trulan Martin

              Introduce una opción: 

	             1) Instalar Kernel 
	             2) Salir 
"
)
case $opc in

"1") 

(

# INSTALANDO DEPENDENCIAS

echo "# Actualizando lista de fuentes"; sleep 1s
sudo apt-get update -y

echo "# Instalando dependencias"; sleep 1s
for paquetes_dependencias in zenity wget; do sudo apt-get install -y $paquetes_dependencias; done
sudo apt-get install -f

# INSTALANDO EL KERNEL AVL

sudo mkdir /opt/tmp

echo "# Download Kernel"; sleep 1s
wget --no-check-certificate 'http://my.opendesktop.org/s/tybe5FaBMjzts4R/download' -O /opt/tmp/linux-image-5.4.28avl2-lowlatency.deb

echo "# Dowload Headers"; sleep 1s
wget  --no-check-certificate 'http://my.opendesktop.org/s/Cx43SWj4w7LrTiY/download' -O /opt/tmp/linux-headers-5.4.28avl2-lowlatency.deb

sudo chmod 777 -R /opt/tmp/
sudo chown $USER /opt/tmp/*

echo "# Instalando el nuevo kernel"; sleep 1s
sudo dpkg -i /opt/tmp/linux-headers-5.4.28avl2-lowlatency.deb 
sudo dpkg -i /opt/tmp/linux-image-5.4.28avl2-lowlatency.deb
sudo apt-get remove --purge cryptsetup-initramfs -y
sudo apt-get autoremove --purge -y

echo "# Kernel instalado. Puedes reiniciar para aplicar los cambios."; sleep 1s
)|

zenity --progress --pulsate 

title="Quirinux"
percentage=0
;;

"2")

	exit 0
;; 

esac
