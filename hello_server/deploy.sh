#!/bin/bash

SCRIPT_DIR=$( cd -- "$( dirname -- "${BASH_SOURCE[0]}" )" &> /dev/null && pwd )

docker build -t hello_server $SCRIPT_DIR

helm upgrade \
  --install \
  --create-namespace \
  --force \
  --namespace demo \
  --set image=hello_server:latest \
  --set servicePort=3080 \
  --set imagePullPolicy=Never `# needed only for local development` \
  --set serviceType=LoadBalancer `# needed only for local development` \
  --wait \
  --timeout 40s \
  hello-server \
  $SCRIPT_DIR/../helm_charts/node_app

echo hello_server deployed successfully to https://localhost:3080