#!/bin/bash
# PHP container by default
CONTAINER=php

# user to run the command as
USER=

# check for winpty for users on windows git bash
WPTY=
if [ -x "$(command -v winpty)" ]; then
	WPTY='winpty'
fi

die() {
    printf '%s\n' "$1" >&2
    exit 1
}

while :; do
    case $1 in
        -c|--container)
            if [ "$2" ]; then
                CONTAINER=$2
                shift
            else
                die 'ERROR: "--container" requires a non-empty option argument.'
            fi
            ;;
        -r|--root)
            USER='-u root'
            ;;
        -u|--user)
            if [ "$2" ]; then
                USER="-u $2"
                shift
            else
                die 'ERROR: "--user" requires a non-empty option argument.'
            fi
            ;;
        *)               # Default case: No more options, so break out of the loop.
            break
    esac
    shift
done

# grab all arguments after the initial options have been parsed
$WPTY docker-compose exec -T $USER $CONTAINER bash -c '"$@"' -- "$@"