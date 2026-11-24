#!/bin/bash

PHASE=$(kubectl get pod pod-cache -o jsonpath='{.status.phase}' 2>/dev/null)
LABEL=$(kubectl get pod pod-cache -o jsonpath='{.metadata.labels.app}' 2>/dev/null)

if [ "$PHASE" != "Running" ]; then
  echo "Der Pod 'pod-cache' läuft noch nicht (aktueller Status: ${PHASE:-nicht gefunden})."
  exit 1
fi

if [ "$LABEL" != "cache" ]; then
  echo "Der Pod 'pod-cache' muss das Label 'app=cache' tragen."
  exit 1
fi

exit 0
