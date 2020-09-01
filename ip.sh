#!/bin/bash


export reportdir="recon/$1/nmap"
export kalicontainer="docker run --rm -it -v $(pwd):/$reportdir quickrecon "
#export kalicontainer=" "

mkdir -p $reportdir
#docker run --rm -it reconbox nmap 

$kalicontainer nmap -A --osscan-guess --version-all -p- -T4 -oA "$reportdir/nmap_tcp_full-$1" $1
$kalicontainer nmap -sU -A --top-ports=25 --version-all -oA "$reportdir/nmap_udp_top25-$1" $1

#nmap {nmap_extra} -sV -p {port} --script="banner,(cups* or ssl*) and not (brute or broadcast or dos or external or fuzzer)" -oN "{scandir}/{protocol}_{port}_cups_nmap.txt" -oX "{scandir}/xml/{protocol}_{port}_cups_nmap.xml" {address}

#dirsearch -u {scheme}://{address}:{port}/ -t 16 -r -e txt,html,php,asp,aspx,jsp -f -w /usr/share/seclists/Discovery/Web-Content/big.txt --plain-text-report="{scandir}/{protocol}_{port}_{scheme}_dirsearch_big.txt"'
#dirsearch -u {scheme}://{address}:{port}/ -t 16 -r -e txt,html,php,asp,aspx,jsp -f -w /usr/share/wordlists/dirbuster/directory-list-2.3-medium.txt --plain-text-report="{scandir}/{protocol}_{port}_{scheme}_dirsearch_dirbuster.txt"
