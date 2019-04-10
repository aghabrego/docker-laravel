#!/bin/bash

./cmd.sh -c node -r npm install -g --no-bin-links --unsafe-perm node-sass
./cmd.sh -c node -r npm install -g --unsafe-perm cross-env
./cmd.sh -c node -r npm install -g --unsafe-perm @vue/cli

./cmd.sh -c node -r mkdir /var/www/html/node_modules
./cmd.sh -c node -r cp -r /usr/local/lib/node_modules/node-sass /var/www/html/node_modules
./cmd.sh -c node -r cp -r /usr/local/lib/node_modules/cross-env /var/www/html/node_modules
./cmd.sh -c node -r chown -R 1000:1000 /var/www/html

./cmd.sh -c node npm install
./cmd.sh -c node npm run dev