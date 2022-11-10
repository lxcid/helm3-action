#!/bin/sh

set -e

if [[ ! -z ${KUBE_CONFIG_DATA+x} ]]; then
  # Extract the base64 encoded config data and write this to the KUBECONFIG
  echo "$KUBE_CONFIG_DATA" | base64 -d > /tmp/config
  export KUBECONFIG=/tmp/config
  echo "Set KUBECONFIG to /tmp/config"
fi

sh -c "helm $*"
