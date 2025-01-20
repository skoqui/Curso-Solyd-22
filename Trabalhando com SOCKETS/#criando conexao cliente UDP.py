#Criando uma conexão CLIENTE UDP

import socket                                               #Importando o modulo socket

client = socket.socket(socket.AF_INET, socket.SOCK_DGRAM)   #Criando um objeto socket com o protocolo UDP
try:                                                        #Tentando conectar
    while True:                                             
        msg = input("Mensagem: ") + "\n"                    #Recebendo a mensagem
        client.sendto(msg.encode(), ("localhost", 8080))     #Enviando a mensagem para o servidor
        data, sender = client.recvfrom(1024)                 #Recebendo a mensagem do servidor
        print(sender[0] + ": " + data.decode())             #Imprimindo a mensagem do servidor
        if data.decode() == "sair\n" or msg == "sair\n":    #Se a mensagem for "sair" ou "sair\n" encerra o loop
            break 
    client.close()                                           #Encerrando a conexão
except Exception as error:                                   #Se ocorrer um erro 
    print('Houve um erro.')                                 #Imprime 
    print('error')                                          #Imprime 


