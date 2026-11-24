#!/bin/bash

REPLICAS=$(kubectl get deployment ha-frontend -o jsonpath='{.spec.replicas}' 2>/dev/null)
PENDING=$(kubectl get pods -l app=frontend --field-selector=status.phase=Pending -o jsonpath='{.items[*].metadata.name}' 2>/dev/null)

if [ "$REPLICAS" != "3" ]; then
  echo "Bitte skaliere das Deployment 'ha-frontend' auf 3 Replikate (aktuell: ${REPLICAS:-nicht gefunden})."
  exit 1
fi

if [ -z "$PENDING" ]; then
  echo "Es sollte genau ein Frontend-Pod im Status 'Pending' sein."
  exit 1
fi

exit 0
