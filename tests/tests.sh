#!/bin/bash

set -euo pipefail

docker run --rm "${DOCKER_IMAGE}:${TAG}" npx haraka -v

docker run -p25:25 --name test -d --rm "${DOCKER_IMAGE}:${TAG}" > /dev/null
sleep 2
"${PWD}"/root/healthcheck.sh
docker stop test > /dev/null
