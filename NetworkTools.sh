#!/bin/bash 
echo "Qual Scan Deseja?"
echo "1 - Hosts"
echo "2 - Portas"
echo "3 - Scan Completo"
echo "4 - Instruções"
read resp
case $resp in "1")
                echo "escreva os 3 blocos de IP"
read pip
                echo "Scaneando..."
          for ip in $(seq  1 254);
          do
                ping -c 1 $pip.$ip | grep "64 bytes" | cut -d ":" -f 1 | cut -d " " -f 4 ;
done
;;
"2")
                echo "escreva o IP desejado"
read porta
                echo "Scaneando..."
           nmap -v $porta | grep "open";
;;
"3")
                echo "escreva os 3 blocos de IP"
read pip1
                echo "Scaneando..."
          for ip2 in $(seq  1 5);
          do
                ping -c 1 $pip1.$ip2 | grep "64 bytes" | cut -d ":" -f 1 | cut -d " " -f 4 ;
done
          if [$pip1.$ip2 != " "]
then
                nmap -v  $pip1.$ip2 | grep "open";
fi
;;
"4")
                echo "escreva a sequencia de ip desejada sem o 4 grupo, Ex: 192.168.0"
;;
esac
