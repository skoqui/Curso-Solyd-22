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
