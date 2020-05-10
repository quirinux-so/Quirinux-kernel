#!/bin/bash
# quirinux-kernel-pt.sh

# Programado por Charlie Martínez (Carlos Mariano Martínez Bourio)

# Site oficial: www.quirinux.org
# Contato direto: cmartinez@quirinux.org
# https://github.com/quirinux-so

# Versão 3 da licença GPL
# https://github.com/quirinux-so/quirinux-kernel/blob/master/LICENCE

# GERAR O MENU GRÁFICO COM ZENITY

opc=$(zenity --width=350 --height=220 --title=Quirinux --entry --text="        
              Instalação do Kernel AVL 5.4.28
              Trulan Martin baixa latência
              Digite uma opção:
	             1) Instalar Kernel 
	             2) Sair 
"
)
case $opc in

"1") 

(
echo "# Adicionando repositórios"; sleep 1s

# GERAR O ARQUIVO DA LISTA DE REPOSITÓRIOS

sudo touch /etc/apt/sources.list.d/kernel-avlinux.list
echo "# AV Linux" >> /etc/apt/sources.list.d/kernel-avlinux.list
echo " " >> /etc/apt/sources.list.d/kernel-avlinux.list
echo "deb [ trusted=yes ] http://www.bandshed.net/kernels/apt/ buster main" >> /etc/apt/sources.list.d/kernel-avlinux.list

# INSTALAR O KERNEL AVL

echo "# Atualizando fontes"; sleep 1s
sudo apt-get update -y
echo "# Instalando o novo kernel"; sleep 1s

for paquetes_kernel in linux-image-5.4.28avl2-lowlatency linux-headers-5.4.28-rt19avl2; do sudo apt-get install -y $paquetes_kernel; done
sudo apt-get install -f
echo "# Kernel instalado"; sleep 1s
)|

zenity --progress --pulsate 
echo " Você pode reiniciar para aplicar."
title="Quirinux"
percentage=0
;;

"2")

	exit 0
;; 
esac 
	done

	
