#!/bin/bash

set -e  # Exit immediately if a command exits with a non-zero status

SCRIPT_DIR=$( cd -- "$( dirname -- "${BASH_SOURCE[0]}" )" &> /dev/null && pwd )

docker build -t hello_server $SCRIPT_DIR

# Get the image hash
IMAGE_HASH=$(docker images --no-trunc --quiet hello_server:latest)

echo "Deploying hello_server with image hash $IMAGE_HASH"

helm upgrade \
  --install \
  --create-namespace \
  --force \
  --namespace demo \
  --set image=hello_server:latest \
  --set servicePort=3080 \
  --set imagePullPolicy=Never `# needed only for local development` \
  --set serviceType=LoadBalancer `# needed only for local development` \
  --set replicaCount=5 \
  --set env.IMAGE_HASH=$IMAGE_HASH `# forces new deployment in case image hash changed` \
  --wait \
  --timeout 40s \
  hello-server \
  $SCRIPT_DIR/../helm_charts/node_app

echo hello_server deployed successfully to https://localhost:3080