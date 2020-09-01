#!/bin/bash

export kali="docker run --rm -it -v $(pwd):/data quickrecon "
export IP="192.168.1.206"
export URL="http://192.168.1.206:3000"


mkdir recon


#docker run --rm -it reconbox nmap 

$kali nmap -A --osscan-guess --version-all -p- -T4 -oA "/data/recon/nmap_tcp_full" $IP

$kali nmap -sU -A --top-ports=20 --version-all -oA "/data/recon/nmap_udp_top20" $IP

$kali dirhunt $URL > recon/dirhunt

$kali nikto -ask=no -h $IP 2>&1 | tee "recon/nikto"

$kali gobuster dir -u $URL -w /usr/share/seclists/Discovery/Web-Content/big.txt -e -k -l -s "200,204,301,302,307,403,500" -x "txt,html,php,asp,aspx,jsp,js,csv,zip,tar" -o "/data/recon/gobuster"

docker run --rm -t trailofbits/twa -vw $1 

#nmap {nmap_extra} -sV -p {port} --script="banner,(cups* or ssl*) and not (brute or broadcast or dos or external or fuzzer)" -oN "{scandir}/{protocol}_{port}_cups_nmap.txt" -oX "{scandir}/xml/{protocol}_{port}_cups_nmap.xml" {address}

#dirsearch -u {scheme}://{address}:{port}/ -t 16 -r -e txt,html,php,asp,aspx,jsp -f -w /usr/share/seclists/Discovery/Web-Content/big.txt --plain-text-report="{scandir}/{protocol}_{port}_{scheme}_dirsearch_big.txt"'
#dirsearch -u {scheme}://{address}:{port}/ -t 16 -r -e txt,html,php,asp,aspx,jsp -f -w /usr/share/wordlists/dirbuster/directory-list-2.3-medium.txt --plain-text-report="{scandir}/{protocol}_{port}_{scheme}_dirsearch_dirbuster.txt"




