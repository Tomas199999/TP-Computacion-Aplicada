#!/bin/bash

if [[ "$1" == "-help" ]]; then
	echo "Uso: $0 <ORIGEN> <DESTINO>"
	exit 0

elif [[ $# -ne 2 ]]; then
	echo "El numero de argumentos es invalido, se deben pasar la ruta de origen y el destino del backup"
	exit 1
fi

ORIGEN="$1"
DESTINO="$2"

if [[ ! -d "$ORIGEN" || ! -d "$DESTINO" ]]; then
	echo "Error: Origen o destino inexistentes"
	exit 1
fi

FECHA=$(date +%Y%m%d)
BACKUP=$(basename "$ORIGEN")bkp"$FECHA".tar.gz

tar -czf "$2/$BACKUP" -C "$ORIGEN" .

if [[ -f "$2/$BACKUP" ]]; then
	echo "Backup realizado correctamente."
	exit 0
else
	echo "Hubo un error al realizar el backup."
	exit 1
fi
