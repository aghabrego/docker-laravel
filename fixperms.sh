#!/usr/bin/env bash

sudo chgrp -R 82 ./bootstrap/cache
sudo chgrp -R 82 ./storage
sudo chmod -R g+w ./bootstrap/cache
sudo chmod -R g+w ./storage