#!/bin/bash
set -eu

ARCH=$(uname -m)

(
  cwd=$(cd $(dirname ${0}) && pwd)

  if [ "$ARCH" = "x86_64" ]; then
    \cp -f .devcontainer/docker-compose-x86_64.yml .devcontainer/docker-compose.yml
  elif [ "$ARCH" = "arm64" ]; then
    \cp -f .devcontainer/docker-compose-arm64.yml .devcontainer/docker-compose.yml
  else
    echo "Unsupported architecture"
    exit 1
  fi
)
