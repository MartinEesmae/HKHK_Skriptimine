#!/bin/bash
LOGIFAIL="/mnt/c/GitHub-ITS24/teenused.log"
RUN=$1

for teenus in apache2 ssh; do
	if systemctl is-active --quiet $teenus; then
		echo "Teenus $teenus töötab"
	else
		echo "teenus $teenus ei tööta - käivitan .."
		sudo systemctl start "$teenus"

		#kontrollin kas teenus töötab
		if systemctl is-active --quiet "$teenus"; then
			echo "$teenus käivitati edukalt."
			echo "$(date '+%d.%m.%Y %H:%M:%S') - $teenus ei töötanud ja käivitati.Kontrollijaks oli $RUN" >> "$LOGIFAIL"
		else
			echo "Viga; $teenus ei käivitunud"
		fi
	fi


echo $RUN
done
