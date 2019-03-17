#!/bin/sh

for tag in images/*; do
  docker push lsegal/terraform:${tag#images/}
done
