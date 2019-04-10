#!/bin/bash

# make a new .env if not present already
if ! [ -f ./.env ]; then
    cp ./.env.example ./.env
fi

source .env

### CONFIGURATION ###
# how long to wait between container checks
CHECK_DELAY=2

#####################
function isDbReady() {
    docker-compose exec -T php bash -c "mysql -u $DB_USERNAME -p$DB_PASSWORD -h $DB_HOST -D $DB_DATABASE -e '\q'"
}

# make sure the container has completed its setup
function waitForDb() {
    ELAPSED=0
    until isDbReady; do
        sleep $CHECK_DELAY;
        ((ELAPSED=$ELAPSED+$CHECK_DELAY))
        echo "Waited $ELAPSED seconds for database to initialize..."
    done
}

#####################

# Bring containers up
./up.sh

# wait until the db is actually accepting connections
waitForDb;

./cmd.sh composer install
./cmd.sh php artisan key:generate

# Reset database, re-run migrations and re-seed data
./resetdb.sh

#### npm initializations
./fixcrossenv.sh