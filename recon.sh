#!/bin/bash

#Subdomains Recon by BLaZZes10

#check parameters
if [ "$#" -ne 1 ]; then
	echo "Introduce el archivo con los subdominios"
fi

for x in $(cat $1); do
	if [ $(curl -k -o /dev/null --silent --head --write-out '%{http_code}' $x) -ne "000" ]; then
		echo -n "$x -> " ; curl -k -o /dev/null --silent --head --write-out '%{http_code}' $x
		printf "\n"
	fi
done
