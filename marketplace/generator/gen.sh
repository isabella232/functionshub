#!/bin/sh

BASEPATH="/home/spio/ZHAW/splab/research/lambda/snafu.gitlab"
REGPATH="../app/api/sensors/functions"

./gen.py $BASEPATH
#mv fake.functions $REGPATH
cp fake.functions $REGPATH
