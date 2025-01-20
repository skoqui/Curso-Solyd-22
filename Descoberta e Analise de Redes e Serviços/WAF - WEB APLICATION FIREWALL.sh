#WAF - WEB APLICATION FIREWALL
wafw00f http://dominio.com
nmap -p 80,443 solyd.com.br --script=http-waf-detect
nmap -p 80,443 solyd.com.br --script=http-waf-fingerprint