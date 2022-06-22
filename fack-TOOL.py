#!/usr/bin/env python3

#Normal Import
import time,os,sys,smtplib,getpass,ssl
from email.mime.text import MIMEText
from email.utils import formataddr
from email.mime.multipart import MIMEMultipart
from email.mime.base import MIMEBase
from email import encoders
from email.mime.text import MIMEText

#emails:
from Core.mails import banner,Facebook,Gmail,GmailActivity,FacePro
from Core.send_mails import GmailS,YahooEmail,LiveEmail


red = ("\033[1;31;40m")
green = ("\033[1;32;40m")
white = ("\033[1;37;40m")
cyan = ("\033[1;36;40m")
start = (green + "[" + white + "+" + green + "]" + white)
alert = (green + "[" + red + "!" + green + "]" + white)


def NormalEmail():
	banner()
	print(cyan + "Elige un servicio para enviar el Email HTML o da Exit y usa SET")
	print("")
	print(red + "[" + green + "1" + red + "]" + cyan + " @gmail")
	print(red + "[" + green + "2" + red + "]" + cyan + " @yahoo")
	print(red + "[" + green + "3" + red + "]" + cyan + " @hotmail")
	print(red + "[" + green + "3" + red + "]" + cyan + " @outlok")
	print(red + "[" + green + "3" + red + "]" + cyan + " @live")
	print("")
	print(red + "[" + green + "99" + red + "]" + green + " Exit")
	print(cyan + "--------------------------------------------")
	print("")
	Smtp_pick = int(input(red + "Predator-Phish>> " + white))

	if Smtp_pick == 1:
        	GmailS()

	elif Smtp_pick == 2:
        	YahooEmail()

	elif Smtp_pick == 3:
        	LiveEmail()

	elif Smtp_pick == 4:
        	LiveEmail()

	elif Smtp_pick == 5:
        	LiveEmail()

	elif Smtp_pick == 99:
		print("Goodbye :)")
		print("")
		sys.exit()

	else:
        	print(alert + " Opcion invalida" + alert)



def mail():
	banner()
	time.sleep(0.7)
	print(cyan + "Plantillas de emails para enviar:")
	print("")
	print(red + "[" + green + "1" + red + "]" + cyan + " Facebook")
	print(red + "[" + green + "2" + red + "]" + cyan + " Facebook Profile")
	print(red + "[" + green + "3" + red + "]" + cyan + " Gmail")
	print(red + "[" + green + "4" + red + "]" + cyan + " Gmail Activity")
	print(cyan + "--------------------------------------------")
	print(red + "[" + green + "5" + red + "]" + cyan + " Enviar email HTML")
	print("")
	print(red + "[" + green + "99" + red + "]" + green + " Exit")
	print("")
	mailPick = int(input(red + "Predator-Phish>> " + white))

	if mailPick == 1:
		Facebook()
		time.sleep(3)

	elif mailPick == 2:
		FacePro()
		time.sleep(3)

	elif mailPick == 3:
		Gmail()
		time.sleep(3)

	elif mailPick == 4:
		GmailActivity()
		time.sleep(3)

	elif mailPick == 5:
		NormalEmail()

	elif mailPick == 99:
		print("Goodbye :)")
		print("")
		sys.exit()

	else:
		print("\nOpcion Invalida!")
		sys.exit()





mail()
