#Servidor TCP


import socket                                               # Importando o módulo socket

server = socket.socket(socket.AF_INET, socket.SOCK_STREAM)  # Criando o objeto socket com protocolo TCP
server.bind(("0.0.0.0", 8080))                              # Vinculando o socket a um endereço e porta
server.listen(1)                                            # Configurando o servidor para escutar conexões (max 1 conexão simultânea)

print("Servidor aguardando conexão...")

client_socket, client_address = server.accept()             # Aceitando uma conexão do cliente
print(f"Conexão estabelecida com {client_address}")

try:
    while True:
        data = client_socket.recv(1024)                     # Recebendo dados do cliente
        if not data:
            break                                           # Se não houver mais dados, encerra o loop
        print(f"Recebido: {data.decode()}")                 # Exibindo a mensagem recebida
        client_socket.send("Mensagem recebida".encode())    # Enviando uma resposta ao cliente
        if data.decode() == "sair\n":                       # Se a mensagem for "sair", encerra a conexão
            break
except Exception as error:
    print("Erro:", error)                                   # Exibe qualquer erro que ocorra

client_socket.close()                                       # Fecha a conexão com o cliente
server.close()                                              # Fecha o servidor


