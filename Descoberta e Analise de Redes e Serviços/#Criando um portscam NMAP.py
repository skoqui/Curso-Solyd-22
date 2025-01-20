#Criando um portscam NMAP

import socket

host = "google.com"
port = 7801


client = socket.socket(socket.AF_INET, socket.SOCK_STREAM)
client.settimeout(0.5)
code = client.connect_ex(("google.com", port))
print(code)

if code == 0:
    print("[+] {} open".format(port))
else:
    print("[-] {} closed".format(port)) 

client.close