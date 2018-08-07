#! /bin/bash

jq -s '.[0] * .[1]' "$@"
