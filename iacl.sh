#/bin/bash

while [ opt != 5 ] ; do
	clear
	echo "### MENU PRINCIPAL ###"
	echo "1) Criar Usuario"
	echo "2) Listar Usuario"
	echo "3) Listar Grupos"
	echo "4) Listar Permissoes"
	echo "5) Rollback"
	echo "6) Sair"
	read -p "Escolha a opcao desejada: " opt

	case "$opt" in
		1) 	# Criando diretorios
			echo "Criando diretórios..."
			printf "publico, adm, ven, sec em /data..."
			echo "Feito!"
			mkdir -p /data/publico /data/adm /data/ven /data/sec
			echo "Criando grupos..."
			# Crinado grupos 
			printf "GRP_ADM, GRP_VEN, GRP_SEC..."
			groupadd GRP_ADM
			groupadd GRP_VEN
			groupadd GRP_SEC
			echo "Feito!"
			# Criando usuarios
			echo "Criando usuarios..."
			printf "joao, maria, carlos, debora, sebastiana, roberto, josefina, amanda e rogerio"
			useradd carlos -m -s /bin/bash -p $(openssl passwd -crypt Senha123) -G GRP_ADM
			useradd maria -m -s /bin/bash -p $(openssl passwd -crypt Senha123) -G GRP_ADM
			useradd joao -m -s /bin/bash -p $(openssl passwd -crypt Senha123) -G GRP_ADM
			useradd debora -m -s /bin/bash -p $(openssl passwd -crypt Senha123) -G GRP_VEN
			useradd sebastiana -m -s /bin/bash -p $(openssl passwd -crypt Senha123) -G GRP_VEN
			useradd roberto -m -s /bin/bash -p $(openssl passwd -crypt Senha123) -G GRP_VEN
			useradd josefina -m -s /bin/bash -p $(openssl passwd -crypt Senha123) -G GRP_SEC
			useradd amanda -m -s /bin/bash -p $(openssl passwd -crypt Senha123) -G GRP_SEC
			useradd rogerio -m -s /bin/bash -p $(openssl passwd -crypt Senha123) -G GRP_SEC
			echo "Feito!"
			printf "Atribuindo permissoes dos diretorios..."
			chown root:GRP_ADM /data/adm
			chown root:GRP_VEN /data/ven
			chown root:GRP_SEC /data/sec
			chmod 770 /data/adm
			chmod 770 /data/sec
			chmod 770 /data/ven
			chmod 777 /data/publico
			echo "Feito!"
			;;
		2) 	echo "Listar Usuario"; cat /etc/passwd;;
		3) 	echo "Listar Grupos"; cat /etc/group;;
		4) 	echo "Permissoes dos usuarios"; ls -lr /data 2>/dev/null;;
		5) 	echo "Rollback!!!";
			printf "Apagando diretorios... ";
			rm -r /data	
			echo "Feito!"
			printf "Apagando grupos... ";
			groupdel GRP_ADM
			groupdel GRP_VEN
			groupdel GRP_SEC
			echo "Feito!"
			printf "Apagando usuarios... ";
			userdel -r carlos
			userdel -r maria
			userdel -r joao
			userdel -r debora
			userdel -r sebastiana
			userdel -r roberto
			userdel -r josefina
			userdel -r amanda
			userdel -r rogerio
			echo "Feito!";;
		6) 	clear; echo "Obrigado, espero ter lhe ajudado!"; 
			break;;
		*)	echo "Opcao invalida ";;
	esac
	read -p "Pressione <ENTER> para continuar..." tc
done
