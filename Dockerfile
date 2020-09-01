FROM kalilinux/kali-rolling
RUN apt update && apt install -y amass python3 python3-pip seclists nmap gobuster nikto curl jq dig nc
RUN pip3 install dirhunt
ENV DIRS_LARGE /usr/share/seclists/Discovery/Web-Content/raft-large-directories.txt
ENV DIRS_SMALL /usr/share/seclists/Discovery/Web-Content/raft-small-directories.txt
ENV FILES_LARGE /usr/share/seclists/Discovery/Web-Content/raft-large-files.txt
ENV FILES_SMALL /usr/share/seclists/Discovery/Web-Content/raft-small-files.txt
ENV BIG /usr/share/seclists/Discovery/Web-Content/big.txt

