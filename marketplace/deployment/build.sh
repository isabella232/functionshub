#!/bin/sh

rm -rf _build
mkdir -p _build
cp -r ../index.html ../app ../generator Dockerfile _build
cp -r custom _build
cd _build
docker build -t functionhub .
