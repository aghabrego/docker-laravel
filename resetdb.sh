#!/bin/bash

# clear all the caches
./cacheclear.sh
# Reset database, re-run migrations
./cmd.sh php artisan migrate:fresh
# Seed data
./cmd.sh php artisan db:seed
