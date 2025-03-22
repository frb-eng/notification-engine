#!/bin/bash

set -e  # Exit immediately if a command exits with a non-zero status

helm upgrade --install ingress-nginx ingress-nginx \
  --repo https://kubernetes.github.io/ingress-nginx \
  --namespace ingress-nginx --create-namespace
