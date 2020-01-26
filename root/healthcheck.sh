#!/bin/bash

set -euo pipefail

exec 5<>/dev/tcp/127.0.0.1/25

if ! echo "EHLO healthcheck" >&5; then
  echo "Error while sending EHLO"
  exit 1
fi

if ! echo "QUIT" >&5; then
  echo "Error while sending QUIT"
  exit 1
fi

if ! RETURN=$(cat <&5); then
  echo "Error while getting answer after EHLO"
  exit 1
fi

if ! echo "${RETURN}" | grep -q 'ESMTP'; then
  echo "Expecting ESMTP ready message got"
  echo "${RETURN}"
  exit 1
fi

if ! echo "${RETURN}" | grep -q '250-SMTPUTF8'; then
  echo "Expecting 250-SMTPUTF8 message got"
  echo "${RETURN}"
  exit 1
fi

if ! echo "${RETURN}" | grep -q '221'; then
  echo "Expecting code 221 message got"
  echo "${RETURN}"
  exit 1
fi
