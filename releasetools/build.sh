#!/bin/sh

base=$(pwd)
for tag in images/*; do
  cd $base/$tag
  docker build -t lsegal/terraform:${tag#images/} .
done
