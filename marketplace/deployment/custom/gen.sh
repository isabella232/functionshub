#!/bin/sh

BASEPATH="/opt"
REGPATH="/var/www/html/api/sensors/functions"

./gen.py $BASEPATH
mv fake.functions $REGPATH
