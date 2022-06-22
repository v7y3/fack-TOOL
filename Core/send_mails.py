import smtplib,os,getpass,sys,ssl,base64
from email.header import Header
from email.mime.text import MIMEText
from email.utils import formataddr
from email.mime.multipart import MIMEMultipart
from email.mime.base import MIMEBase
from email import encoders
from email.mime.text import MIMEText
from Core.mails import banner


red = ("\033[1;31;40m")
green = ("\033[1;32;40m")
white = ("\033[1;37;40m")
cyan = ("\033[1;36;40m")
y = ("\033[1;33;40m")
start = (red + "[" + green + "+" + red + "]" + cyan)
alert = (red + "[" + y + "!" + red + "]" + cyan)


def GmailS():
	banner()
	print("")
	fromaddr = input(start + " Ingresa tu email: ")
	password = getpass.getpass(start + " Ingresa tu clave (No se muestra): ")
	toaddr = input(start + " Ingresa el email de la victima: ")
	from_displayname = input(start + " Ingresa el nombre de usuario que vera la victima: ")
	subject = input(start + " Ingresa el Subject: ")
	pathfile = input(start + " Ingresa el nombre o ruta de tu archivo HTML (Ejemplo: email.html): ")

	html = open(pathfile)
	msg = MIMEText(html.read(), 'html')
	msg['From'] = str(
		Header(from_displayname, 'UTF-8').encode() + ' <' + fromaddr + '> ')
	msg['To'] = toaddr
	msg['Subject'] = subject

	debug = False
	if debug:
		print(msg.as_string())
	else:
		server = smtplib.SMTP('smtp.gmail.com',587)
		server.starttls()
		server.login(fromaddr, password)
		text = msg.as_string()
		server.sendmail(fromaddr, toaddr, text)
		server.quit()
		print(alert + "Email Enviado" + alert)


def LiveEmail():
	banner()
	print("")
	fromaddr = input(start + " Ingresa tu email: ")
	password = getpass.getpass(start + " Ingresa tu clave (No se muestra): ")
	toaddr = input(start + " Ingresa el email de la victima: ")
	from_displayname = input(start + " Ingresa el nombre de usuario que vera la victima: ")
	subject = input(start + " Ingresa el Subject: ")
	pathfile = input(start + " Ingresa el nombre o ruta de tu archivo HTML (Ejemplo: email.html): ")

	html = open(pathfile)
	msg = MIMEText(html.read(), 'html')
	msg['From'] = str(
		Header(from_displayname, 'UTF-8').encode() + ' <' + fromaddr + '> ')
	msg['To'] = toaddr
	msg['Subject'] = subject

	debug = False
	if debug:
		print(msg.as_string())
	else:
		server = smtplib.SMTP('smtp.live.com',587)
		server.starttls()
		server.login(fromaddr, password)
		text = msg.as_string()
		server.sendmail(fromaddr, toaddr, text)
		server.quit()
		print(alert + "Email Enviado" + alert)


def YahooEmail():
	banner()
	print("")
	fromaddr = input(start + " Ingresa tu email: ")
	password = getpass.getpass(start + " Ingresa tu clave (No se muestra): ")
	toaddr = input(start + " Ingresa el email de la victima: ")
	from_displayname = input(start + " Ingresa el nombre de usuario que vera la victima: ")
	subject = input(start + " Ingresa el Subject: ")
	pathfile = input(start + " Ingresa el nombre o ruta de tu archivo HTML (Ejemplo: email.html): ")

	html = open(pathfile)
	msg = MIMEText(html.read(), 'html')
	msg['From'] = str(
		Header(from_displayname, 'UTF-8').encode() + ' <' + fromaddr + '> ')
	msg['To'] = toaddr
	msg['Subject'] = subject

	debug = False
	if debug:
		print(msg.as_string())
	else:
		server = smtplib.SMTP('smtp.mail.yahoo.com',587)
		server.starttls()
		server.login(fromaddr, password)
		text = msg.as_string()
		server.sendmail(fromaddr, toaddr, text)
		server.quit()
		print(alert + "Email Enviado" + alert)
