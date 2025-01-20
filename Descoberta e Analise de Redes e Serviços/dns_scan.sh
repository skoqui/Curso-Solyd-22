 nano dns_scan.sh

 for palavra in $( cat dns_wordlist.txt )
 do
    host $palavra.exemplo.com 
done