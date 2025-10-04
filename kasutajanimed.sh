#!/bin/bash

fail="nimeed.txt

#funtsioon, mis muudab tähed väikeseks ja asendab täpitähed
asenda_tahed(){
	echo "$1" | tr '[:upper:]' '[:lower:]' | sed -e 's/ö/o/g/' -e 's/ä/a/g/' -e 's/õ/o/g/' -e 's/ü/u/g/'
#loome faili rida realt
while read enimi pnimi sugu; do
	#töötleme ees- ja perenimed ära
	eesnimi=$(asenda_tahed "$enimi")
	perenimi=$(asenda_tahed "$pnimi")

	#loome kasutajanime ees- ja perekonnanimest
	kasutajanimi="${eesnimi}.${perenimi}"

	#väljastame tulemuse
	echo "$kasutajanimi"
done < "$fail"
