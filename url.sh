#!/bin/bash

export kalicontainer="docker run --rm -it -v $(pwd):/recon quickrecon "

$kalicontainer dirhunt $1 >> ./dirhunt.txt

$kalicontainer nikto -ask=no -h $1 2>&1 | tee "./nikto.txt"

$kalicontainer gobuster dir -u $1 -w /usr/share/seclists/Discovery/Web-Content/big.txt -e -k -l -s "200,204,301,302,307,403,500" -x "txt,html,php,asp,aspx,jsp,js,csv,zip,tar" -o "/recon/gobuster.txt"

