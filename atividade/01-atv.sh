#!/bin/bash 

printf " Utilitário informático!\n"
printf "Nome da Maquina: " 
uname -n
printf "Sistema Operacional: "
awk -F= '/PRETTY_NAME/ {gsub(/"/, "", $2); print $2}' /etc/os-release
printf "Arquitetura: " 
uname -m
printf "Kernel: "
uname -sr