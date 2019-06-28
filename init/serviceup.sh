#!/bin/bash

# If the site doesn't return a 200, kick the bucket (container)
if curl -s --head https://passwordstrength.ACME.com/ | grep "200 OK" > /dev/null
  then
    echo "200 OK" > /dev/null
  else
    cd /tools/docker/PasswordStrength/
    /usr/local/bin/docker-compose -f ./docker-compose.yml up -d --build
fi
