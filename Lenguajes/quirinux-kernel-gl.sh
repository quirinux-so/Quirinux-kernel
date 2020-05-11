
#!/bin/bash
# quirinux-kernel-gl.sh

# Programado por Charlie Martínez (Carlos Mariano Martínez Bourio)

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
echo "# Engadindo repositorios"; sleep 1s

# XERA A FICHA DA LISTA DO REPOSITORIO AVL

sudo touch /etc/apt/sources.list.d/kernel-avlinux.list
echo "# AV Linux" >> /etc/apt/sources.list.d/kernel-avlinux.list
echo " " >> /etc/apt/sources.list.d/kernel-avlinux.list
echo "deb [ trusted=yes ] http://www.bandshed.net/kernels/apt/ buster main" >> /etc/apt/sources.list.d/kernel-avlinux.list

# INSTALA O AVL DE KERNEL

echo "# Actualización de fontes"; sleep 1s
sudo apt-get update -y
echo "# Instalación do novo núcleo"; sleep 1s

for packages_kernel in linux-image-5.4.28avl2-lowlatency linux-headers-5.4.28-rt19avl2; do sudo apt-get install -y $packages_kernel; done
sudo apt-get install -f
echo "# Kernel instalado. Pode reiniciar para aplicar os cambios."; sleep 1s
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
  
