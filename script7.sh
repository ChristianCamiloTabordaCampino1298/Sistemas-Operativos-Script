#!/bin/bash

NUMPROCESOS=$(ps ax | tail -n +2 | wc -l)
PORLIBRAM=$(free | grep Memoria | awk '{print  $4/$2 *100}')
PORLIBHD=$(df | grep root | awk '{print $5}' | cut -c 1-2)

echo ${NUMPROCESOS}
curl --silent --request POST --header "X-THINGSPEAKAPIKEY:UUMX3P19OGAN5SM5" --data "field1=${NUMPROCESOS}&field2=${PORLIBRAM}&field3=${PORLIBHD}" http://api.thingspeak.com/update

