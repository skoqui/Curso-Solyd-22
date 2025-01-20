#Cliente SSH

import paramiko

host = 'localhost'
port = 22
username = 'kali'
password = 'kali'

ssh = paramiko.SSHClient()
ssh.set_missing_host_key_policy(paramiko.AutoAddPolicy())
ssh.connect(host, port, username, password)

while True:
    stdin, stdout, stderr = ssh.exec_command('ls')
    for line in stdout.readlines():
        print(line.strip())
        
    erros = stderr.readlines()
    if len(erros) > 0:
        print('Houve um erro.')
        print(erros)
        break
        
