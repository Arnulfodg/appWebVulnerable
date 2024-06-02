#! /bin/bash

yellowColour="\e[0;33m\033[1m"
redColour="\e[0;31m\033[1m"
endColour="\033[0m\e[0m"

echo "
 __  __ ___ ____  _____ ____  __  __ ___ ____  
|  \/  |_ _|  _ \| ____/ ___||  \/  |_ _/ ___| 
| |\/| || || | | |  _| \___ \| |\/| || |\___ \ 
| |  | || || |_| | |___ ___) | |  | || | ___) |
|_|  |_|___|____/|_____|____/|_|  |_|___|____/ 
                 
"
echo -e "\n\n"     
echo "
 __  __ _   _ _____ ___ _     _     ___ ____    _    _____ 
|  \/  | | | |_   _|_ _| |   | |   |_ _|  _ \  / \  | ____|
| |\/| | | | | | |  | || |   | |    | || | | |/ _ \ |  _|  
| |  | | |_| | | |  | || |___| |___ | || |_| / ___ \| |___ 
|_|  |_|\___/  |_| |___|_____|_____|___|____/_/   \_\_____|
      "
function panel(){
echo -e "\n\tPanel de ayuda\n"
echo -e "\tQué desea realizar?"
echo -e "\t1) Instalar el laboratorio"
echo -e "\t2) practicar"
}
      
# ------ exit of program
function salir(){
echo -e "\n\n ${redColour}[!] saliendo del programa...\n${endColour}"
tput cnorm && exit 1
sleep 3
}
# ------ end exit of program

function install_web(){
echo -e "\t\nIniciando instalación\n"
sudo apt update -y

sudo apt upgrade -y

sudo apt install apache2 -y

sudo a2enmod rewrite

sudo service apache2 restart

sudo apt install php libapache2-mod-php -y

sudo apt install mysql-server php-mysql -y

sudo service mysql restart

sudo service apache2 restart

echo -e "\n\nAl ingresar a la base de datos coloca lo siguiente\n"
echo -e "${yellowColour}ALTER USER 'root'@'localhost' IDENTIFIED WITH mysql_native_password BY 'mutillidae';${endcolour}\n"

sudo mysql -u root

echo -e "\n\n{yellowColour}Verifica el password de la base de datos ingresando:${endcolour} ${redColour}\'mutillidae\'${endcolour}\n\n"

sleep 10

sudo mysql -u root -p

cd /var/www/html

sudo apt install php-curl php-mbstring php-xml -y

sudo apt install git -y

sudo git clone http://github.com/webpwnized/mutillidae.git

echo -e "\nInstalación terminada\n"
echo -e '\nAl abrir la web por primera vez presiona en: ${yellowColour}\"click here\"${endcolour} para que se actualice la base de datos y disfruta tu entorno de pruebas\n'
}

function practice(){
sudo service mysql start
sudo service apache2 start
sleep 10
firefox localhost/mutillidae/src
}

function stop(){
sudo service apache2 stop
sudo service mysql stop
}

declare -i contador=0

while getopts "123" argument; do
	case $argument in
	1) let contador+=1;;
	2) let contador+=2;;
	3) let contador+=3;;
	4) ;;
	esac
done

if [ $contador -eq 1 ]; then
	install_web
elif [ $contador -eq 2 ]; then
	practice
elif [ $contador -eq 2 ]; then
	stop
else
	panel
fi
