#!/bin/bash

if kubectl get deployment ha-frontend >/dev/null 2>&1; then
  echo "Das Deployment 'ha-frontend' existiert noch. Bitte lösche es."
  exit 1
fi

for POD in pod-cache pod-web-co; do
  if kubectl get pod "$POD" >/dev/null 2>&1; then
    echo "Der Pod '$POD' ist noch vorhanden. Bitte lösche ihn."
    exit 1
  fi
done

exit 0
