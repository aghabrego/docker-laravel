#!/bin/bash

# check for winpty for users on windows git bash
WPTY=
if [ -x "$(command -v winpty)" ]; then
	WPTY='winpty'
fi

$WPTY docker-compose exec ${1:-php} bash