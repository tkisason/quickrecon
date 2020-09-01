#!/bin/bash


export kalicontainer="docker run --rm -it -v $(pwd):/recon quickrecon "
#export kalicontainer=" "

$kalicontainer nmap -A --osscan-guess --version-all -p- -T4 -oA "/recon/nmap_tcp_full-$1" $1
$kalicontainer nmap -sU -A --top-ports=25 --version-all -T4 -oA "/recon/nmap_udp_top25-$1" $1
docker run --rm -t trailofbits/twa -vw $1 >> ./twa-$1.txt
