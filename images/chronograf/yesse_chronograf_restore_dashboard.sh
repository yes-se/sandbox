#!/bin/bash

backup_file=yesse_chronograf_dashboard.backup

if [ ! -f "$backup_file" ]
then
	echo "$backup_file does not exist"
	exit 1
fi

DST=http://localhost:8888/chronograf/v1/dashboards

cat "$backup_file" | jq -r '.dashboards[]|@json' |while IFS= read -r dashboard; do echo $dashboard > f; curl -X POST -H "Accept: application/json" -d @f $DST; done
