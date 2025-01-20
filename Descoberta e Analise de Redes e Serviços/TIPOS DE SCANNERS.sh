'''
TCP Connect Scan
O que faz: Tenta estabelecer uma conexão completa com a porta.
Prós: Confiável, detecta portas abertas e fechadas.
Contras: Fácil de ser detectado por sistemas de monitoramento. 
nmap -sT <alvo>


SYN Scan (Half-open Scan)
O que faz: Envia um pacote SYN e espera uma resposta SYN-ACK (porta aberta) ou RST (porta fechada), sem completar a conexão.
Prós: Discreto, rápido e difícil de detectar.
Contras: Pode ser bloqueado por firewalls e sistemas IDS.
nmap -sS <alvo>


UDP Scan
O que faz: Envia pacotes UDP para portas e observa a resposta. Se não houver resposta, a porta está aberta.
Prós: Útil para escanear portas UDP, difíceis de detectar.
Contras: Lento e pode ser filtrado por firewalls.
nmap -sU <alvo>


FIN Scan
O que faz: Envia pacotes FIN (para fechar uma conexão) e espera a resposta (RST se fechada).
Prós: Discreto, difícil de detectar.
Contras: Pode ser ignorado por sistemas de segurança bem configurados.
nmap -sF <alvo>


Xmas Scan
O que faz: Envia pacotes com as bandeiras FIN, URG e PSH ativadas (como uma "árvore de natal").
Prós: Discreto, pode passar despercebido por alguns firewalls.
Contras: Pode ser detectado por sistemas IDS/IPS.
nmap -sX <alvo>


ACK Scan
O que faz: Envia pacotes ACK para determinar se há uma filtragem de pacotes.
Prós: Pode identificar se há um firewall ou filtro de pacotes.
Contras: Não revela se as portas estão abertas ou fechadas, apenas se estão filtradas.
nmap -sA <alvo>


Window Scan
O que faz: Usa o valor da janela TCP para determinar se a porta está aberta ou fechada.
Prós: Pode passar despercebido por alguns sistemas de proteção.
Contras: Requer um bom entendimento dos detalhes do protocolo TCP e pode ser filtrado.
nmap -sW <alvo>


Stealth Scan
O que faz: Usa técnicas como SYN, FIN ou Xmas para evitar a detecção durante a varredura.
Prós: Difícil de detectar, mantém o anonimato.
Contras: Pode ser bloqueado por firewalls ou sistemas IDS.
nmap -sS <alvo>

'''