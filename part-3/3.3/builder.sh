#!/bin/sh

GITHUB_REPO="$1"
DOCKER_HUB_REPO="$2"

# Extract the repository name for local directory naming
REPO_NAME=$(echo "$GITHUB_REPO" | cut -d "/" -f 2)

git clone "https://github.com/${GITHUB_REPO}.git"

cd "${REPO_NAME}" || exit

docker build -t "${DOCKER_HUB_REPO}" .

docker login

docker push "${DOCKER_HUB_REPO}"

echo "Done."
