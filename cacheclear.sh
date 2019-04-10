#!/usr/bin/env bash

# clear all the caches
./cmd.sh php artisan cache:clear
./cmd.sh php artisan view:clear
./cmd.sh php artisan clear-compiled
./cmd.sh php artisan log:clear
./cmd.sh php artisan debugbar:clear
