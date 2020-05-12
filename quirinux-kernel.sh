#!/bin/bash
# quirinux-kernel.sh

# Programado por Charlie Martínez (Carlos Mariano Martínez Bourio).

# Sitio oficial: www.quirinux.org
# Contacto directo: cmartinez@quirinux.org
# https://github.com/quirinux-so

# Licencia GPL Versión 3 
# https://github.com/quirinux-so/quirinux-kernel/blob/master/LICENCE

# GENERAR EL MENÚ GRÁFICO CON ZENITY

opc=$(zenity --width=350 --height=220 --title=Quirinux --entry --text="        
              Instalación del Kernel AVL 5.4.28
              de baja latencia de Trulan Martin

              Introduce una opción: 
#!/bin/bash
# quirinux-kernel.sh

# Programado por Charlie Martínez (Carlos Mariano Martínez Bourio).

# Sitio oficial: www.quirinux.org
# Contacto directo: cmartinez@quirinux.org
# https://github.com/quirinux-so

# Licencia GPL Versión 3 
# https://github.com/quirinux-so/quirinux-kernel/blob/master/LICENCE

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
echo "# Agregando respositorios"; sleep 1s

# INSTALANDO DEPENDENCIAS

echo "# Actualizando lista de fuentes"; sleep 1s
sudo apt-get update -y
echo "# Instalando dependencias"; sleep 1s
for paquetes_kernel in zenity wget; do sudo apt-get install -y $paquetes_kernel; done
sudo apt-get install -f

# INSTALANDO EL KERNEL AVL

echo "# Descargando Kernel"; sleep 1s
wget https://cloud.astian.org/index.php/s/AWtTbWF6rXYkny8/download -O linux-image-5.4.28avl2-lowlatency.deb

echo "# Descargando Kernel Headers"; sleep 1s
wget https://cloud.astian.org/index.php/s/M4HR74qXGbwWTBy/download -O linux-headers-5.4.28avl2-lowlatency.deb

echo "# Instalando el nuevo kernel"; sleep 1s
sudo dpkg -i linux-headers-5.4.28avl2-lowlatency.deb linux-image-5.4.28avl2-lowlatency.deb

echo "# Kernel instalado. Puedes reiniciar para aplicar los cambios."; sleep 1s
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
	
