#!/usr/bin/env bash

find ${PWD} -iname ".*" -type f -maxdepth 1 | xargs -I % ln -s % ~


