#!/bin/bash
# quirinux-kernel-pt.sh

# Programado por Charlie Martínez ®

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

# INSTALAR DEPENDÊNCIAS

echo "# Atualizando lista de fontes"; sleep 1s
sudo apt-get update -y

echo "# Instalando dependências"; sleep 1s
for paquetes_dependencias in zenity wget; do sudo apt-get install -y $paquetes_dependencias; done
sudo apt-get install -f

# INSTALAR O KERNEL AVL

echo "# Download Kernel"; sleep 1s
wget --no-check-certificate 'https://docs.google.com/uc?export=download&id=1YX99kSMorEWKgTnypg-cVKzF4sFXdIGf' -O linux-image-5.4.28avl2-lowlatency.deb

echo "# Dowload Headers"; sleep 1s
wget  --no-check-certificate 'https://docs.google.com/uc?export=download&id=18YiaU1zTjCzRvZKBRiQCl078LLaQVFoq' O- linux-headers-5.4.28avl2-lowlatency.deb

echo "# Instalando o novo kernel"; sleep 1s
sudo dpkg -i linux-headers-5.4.28avl2-lowlatency.deb linux-image-5.4.28avl2-lowlatency.deb

echo "# Kernel instalado. Você pode reiniciar para aplicar as alterações."; sleep 1s
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
