#!/bin/bash

export KONG_IMAGE=kong-ent-js

export KONG_LICENSE_DATA=`cat ../license.json`

export DEPLOYMENT="kong_jsplugin"

docker-compose -f deployments/$DEPLOYMENT/docker-compose.yml -f base/upstreams_basic.yml up -d
