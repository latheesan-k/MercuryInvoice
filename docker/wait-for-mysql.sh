#!/bin/bash

while [ $(docker ps | grep -c "healthy.*mercury-invoice-mysql$") == 0 ]
do
  echo "Waiting for mysql server to come online ..."
  sleep 5s
done
