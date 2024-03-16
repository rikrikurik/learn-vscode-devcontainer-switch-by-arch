# Workaround to switch docker-compose file by CPU architecture for VSCode devcontainer

This repository provides a sample of workaround for switching the docker-compose file by architecture for VSCode devcontainer.
It includes a devcontainer.json configuration and a select-docker-compose.sh script that copies the appropriate docker-compose file based on the architecture (x86_64 or arm64).

## Keypoint

To use `initializeCommand` in devcontainer.json

### devcontainer.json

```json
{
	"name": "sample_architecture_aware_devcontainer",
	"initializeCommand": ".devcontainer/select-docker-compose.sh",
	"dockerComposeFile": "docker-compose.yml",
	(...)
}
```

```bash
#!/bin/bash
set -eu

ARCH=$(uname -m)

if [ "$ARCH" = "x86_64" ]; then
  \cp -f .devcontainer/docker-compose-x86_64.yml .devcontainer/docker-compose.yml
elif [ "$ARCH" = "arm64" ]; then
  \cp -f .devcontainer/docker-compose-arm64.yml .devcontainer/docker-compose.yml
else
  echo "Unsupported architecture"
  exit 1
fi
```

