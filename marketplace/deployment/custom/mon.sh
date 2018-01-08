#!/bin/sh

while true
do
	inotifywait -r /opt/functions-local
	cd /opt/generator
	./gen.sh
done
