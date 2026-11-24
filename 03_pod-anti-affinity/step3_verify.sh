#!/bin/bash

READY=$(kubectl get deployment ha-frontend -o jsonpath='{.status.readyReplicas}' 2>/dev/null)
NODES=$(kubectl get pods -l app=frontend -o jsonpath='{range .items[*]}{.spec.nodeName}{"\n"}{end}' 2>/dev/null | sort -u | wc -l)

if [ "$READY" != "2" ]; then
  echo "Das Deployment 'ha-frontend' muss 2 bereite Replikate haben (aktuell: ${READY:-0})."
  exit 1
fi

if [ "$NODES" -lt 2 ]; then
  echo "Die beiden Frontend-Pods müssen auf zwei unterschiedlichen Nodes laufen."
  exit 1
fi

exit 0
