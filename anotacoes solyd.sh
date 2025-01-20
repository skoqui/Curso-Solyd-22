	#Curso SOLYD 

#Resoluçao CTFs 2020
# 1 Introdução a Segurança da Informação 
# 2 Introdução a Linux/Windows
# 3 Introdução a Programação em Bash
# 4 Introdução a Programação em Python
# 5 Introdução a Redes de Computadores
# 6 Trabalhando com Redes e Sockets
# 7 Descoberta e Analise de Redes e Serviços 1
# 8 Descoberta e Analise de Redes e Serviços 2
# 9 Introdução ao Desenvolvimento Web
# 10 Vunerabilidade Web 1
# 11 Vunerabilidade Web 2
# 12 Vunerabilidade Web 3
# 13 Vunerabilidade Web 4
# 14 Criptografia, senhas e brute-forcing
# 15 Exploits e Metasploit
# 16 Malwares, Shellcode e ofuscação 1
# 17 Malwares, Shellcode e ofuscação 2
# 18 Malwares, Shellcode e ofuscação 3
# 19 Malware analysis
# 20 Linux Post Exploitation e Pivoting
# 21 Windows Post Exploitation
# 22 Ataques Man-in-the-middle
# 23 DoS, DDoS, e Botnet
# 24 Wireless Hacking 1
# 25 Wireless Hacking 2
# 26 Wireless Hacking 3
# 27 Wireless Hacking 4 e IoT
# 28 Privacidade e Anonimato
# 29 Introdução ao Android Pentest
# 30 Hacking Gadgets
# 31 Introdução ao Bug Bounty
# 32 Conduzindo um Pentest
# Projetos Python

------------------------------------------------





SSD = Armazena dados permanente, mesmo sem energia. 
RAM = Armazena dados temporariamente enquanto o PC está ligado. Usado para acessar rapidamente info em uso.


Periféricos (I/O) = I Input / O output


touch texto.txt  #cria pasta em branco


adduser skoqui
su skoqui



r = read 		= 4
w = write		= 2	
x = execute		= 1

--- | --- | ---
usr |group|alluser




chown skoqui:skoqui arquivo.txt
chmod 777 arquivo.txt #permissão para todos
chmod 000 arquivo.txt #apenas root pode entrar
chmod +x programa #permissão de execuçao para todos


top  #lista os processos do sistema em uso
ps x #lista processos do sistema
ps x | grep nome



kill -9 id 



route -n
arp -an

free 
free -m


-------------------


md5sum arquivo.txt   


nc -zv localhost 1-90 			#precisa do apache online




echo $PATH
cd Download/
mv ngrok /bin

ngrok tcp 456
ngrok html 80




nano ./ngrok2

tunnels: 
	tunnel_1: 
		proto: http
		addr: 80
	tunnel_2:
		proto: tcp
		addr: 123
	tunnel_3:
		proto: tcp
		addr: 321


ngrok start --all #abre mais conexoes no ngrok feitas acima




















---------------------------------------------BASH--------------------------------------------------------

#SCRIPT BASH


nano meuscript.sh
#!/bin/bash

echo "Escreva o nome do arquivo a ser salvo"
read arquivo

ls
pwd

echo "Salvando saída do ifconfigo dentro do arquivo $arquivo"
ifconfig > $arquivo


----------------------------------------------------------------------------
#
nano meuscript2.sh

echo "O que quer imprimir na tela? Routes(r)/Ifconfig(i)?"

read comando

if [ "$comando"="i" ]
then
ifconfig
fi

if [ "$comando"="r" ]
then
	route -n
fi


----------------------------------------------------------------------------
#imprime 0 até 10 (com tempo/sleep 2 seg)

nano meuscript3.sh

for ((i=0;i<=10;i++))
do
	echo $i
	sleep 2

done


----------------------------------------------------------------------------
#imprime uma lista
nano meuscript4.sh

for animal in "cachorro" "elefante" "bezerro"
do 
	echo $animal

done

----------------------------------------------------------------------------

conjunto=( "cachorro" "vaca" "boi" )


for i in ${conjunto[*]}
do
	echo $i
done


----------------------------------------------------------------------------


nano meuscript5.sh


while sleep 1
do
	pwd
done

----------------------------------------------------------------------------


sair=0

while [ "$sair" != 1 ]
do 
	pwd
	sair=1
done



---------------------------------------------PYTHON--------------------------------------------------------
#Criando uma conexão CLIENTE TCP

import socket  												# Importando o módulo socket

client = socket.socket(socket.AF_INET, socket.SOCK_STREAM)  # Criando um objeto socket com o protocolo TCP
client.connect(("localhost", 8080))  						# Conectando ao servidor

try:
    while True:
        msg = input("Mensagem: ") + "\n"  					# Recebendo a mensagem
        client.send(msg.encode())  							# Enviando a mensagem para o servidor
        data = client.recv(1024)  							# Recebendo a mensagem do servidor
        print("Servidor: " + data.decode())  				# Imprimindo a mensagem do servidor
        if data.decode() == "sair\n" or msg == "sair\n":  	# Se a mensagem for "sair" ou "sair\n" encerra o loop
            break
    client.close()  										# Encerrando a conexão
except Exception as error:  								# Se ocorrer um erro
    print('Houve um erro.')  								# Imprime
    print(error) 											# Imprime o erro




----------------------------------------------------------------------------
#Criando uma conexão CLIENTE UDP

import socket                                               #Importando o modulo socket

client = socket.socket(socket.AF_INET, socket.SOCK_DGRAM)   #Criando um objeto socket com o protocolo UDP
try:                                                        #Tentando conectar
    while True:                                             
        msg = input("Mensagem: ") + "\n"                    #Recebendo a mensagem
        client.sendto(msg.encode(), ("0.0.0.0", 8080))     #Enviando a mensagem para o servidor
        data, sender = client.recvfrom(1024)                 #Recebendo a mensagem do servidor
        print(sender[0] + ": " + data.decode())             #Imprimindo a mensagem do servidor
        if data.decode() == "sair\n" or msg == "sair\n":    #Se a mensagem for "sair" ou "sair\n" encerra o loop
            break 
    client.close()                                           #Encerrando a conexão
except Exception as error:                                   #Se ocorrer um erro 
    print('Houve um erro.')                                 #Imprime 
    print('error')                                          #Imprime 






----------------------------------------------------------------------------
#Servidor TCP


import socket  # Importando o módulo socket

server = socket.socket(socket.AF_INET, socket.SOCK_STREAM)  # Criando o objeto socket com protocolo TCP
server.bind(("0.0.0.0", 8080))  # Vinculando o socket a um endereço e porta
server.listen(1)  # Configurando o servidor para escutar conexões (max 1 conexão simultânea)

print("Servidor aguardando conexão...")

client_socket, client_address = server.accept()  # Aceitando uma conexão do cliente
print(f"Conexão estabelecida com {client_address}")

try:
    while True:
        data = client_socket.recv(1024)  # Recebendo dados do cliente
        if not data:
            break  # Se não houver mais dados, encerra o loop
        print(f"Recebido: {data.decode()}")  # Exibindo a mensagem recebida
        client_socket.send("Mensagem recebida".encode())  # Enviando uma resposta ao cliente
        if data.decode() == "sair\n":  # Se a mensagem for "sair", encerra a conexão
            break
except Exception as error:
    print("Erro:", error)  # Exibe qualquer erro que ocorra

client_socket.close()  # Fecha a conexão com o cliente
server.close()  # Fecha o servidor







----------------------------------------------------------------------------
#Cliente SSH


import paramiko

host = "localhost"
user = "kali"
pwd = "kali"



client = paramiko.SSHCliente()
client.set_missing_host_key_policy(paramiko.AutoAddPolicy())
client.connect(host, username=user, password=pwd)

while True:
    stdin, stdout, stderr = client.exec_command("ls")
    for line in stdout.readlines():
        print(line.strip())


    erros = stderr.readlines()
    if erros:
        print(erros)
















----------------------------------------------------------------------------
#Google Hacking

site:

filetype: #sql backup confidential passwords inc zip exe ebook robots.txt
filetype:xlsx "passwords"
filetype:txt "username" "password"
filetype:env "DB_PASSWORD"
filetype:xlsx "ssn" "dob"
filetype:pdf "Curriculum Vitae"


intitle:"index of" "backup"  #Localiza diretórios ou configurações que podem estar publicamente acessíveis.
intitle:"index of" "private"
intitle:"webcamXP" "live view" #Descobre câmeras, roteadores ou outros dispositivos conectados que estão expostos à internet.
intitle:"index of" site:exemplo.com.br


inurl:".php?id="
inurl:"/admin" login  #Identifica páginas ou sistemas com vulnerabilidades conhecidas.
inurl:"phpinfo.php" 


intitle:"webcamXP" "live view" #Descobre câmeras, roteadores ou outros dispositivos conectados que estão expostos à internet.
inurl:":8080" "Axis"

ext:sql "password"  #Encontra arquivos de bancos de dados ou informações sensíveis sobre eles.
ext:log "error"


"SQL syntax error" OR "mysql_fetch_array"   #Identifica páginas que exibem mensagens de erro com informações sensíveis.
intitle:"Error" "Apache Server"

#links
https://www.exploit-db.com/google-hacking-database
https://who.is/
https://registro.br/
https://iana.org/whois
https://www.yougetsignal.com/
https://crt.sh/


dig globo.com ANY
dig @8.8.8.8 globo.com.br ANY



________________________________________________________________
                        TIPOS-DE-DOMINIO
A = Adress #Exemplo: dominio.com → 192.168.1.1
AAAA = IPv6 Address #Exemplo: dominio.com → 2001:db8::1
CNAME = Canonical Name #Exemplo: dominio.com → mail.dominio.com
NS = NAME SERVER #Exemplo: dominio.com → ns1.dominio.com
ANY = #Retorna toda lista de registro
HINFO = Host Information = #Exemplo: CPU=Intel OS=Linux
________________________________________________________________



________________________
 nano dns_wordlist.txt


 mail
 admin
 advanced
 mysql
 painel
 _______________________


________________________
 nano dns_scan.sh

 for palavra in $( cat dns_wordlist.txt )
 do
    host $palavra.exemplo.com 
done
________________________


dnsenum -f dns_wordlist.txt globo.com.br



#WAF - WEB APLICATION FIREWALL
wafw00f http://dominio.com
nmap -p 80,443 solyd.com.br --script=http-waf-detect
nmap -p 80,443 solyd.com.br --script=http-waf-fingerprint