#!/bin/bash

WEB_PHASE=$(kubectl get pod pod-web-co -o jsonpath='{.status.phase}' 2>/dev/null)
CACHE_NODE=$(kubectl get pod pod-cache -o jsonpath='{.spec.nodeName}' 2>/dev/null)
WEB_NODE=$(kubectl get pod pod-web-co -o jsonpath='{.spec.nodeName}' 2>/dev/null)
POD_AFF=$(kubectl get pod pod-web-co -o jsonpath='{.spec.affinity.podAffinity.requiredDuringSchedulingIgnoredDuringExecution}' 2>/dev/null)

if [ -z "$POD_AFF" ]; then
  echo "Der Pod 'pod-web-co' verwendet keine 'podAffinity'-Regel."
  exit 1
fi

if [ "$WEB_PHASE" != "Running" ] || [ -z "$CACHE_NODE" ] || [ "$WEB_NODE" != "$CACHE_NODE" ]; then
  echo "Der Pod 'pod-web-co' muss im Status 'Running' auf demselben Node wie 'pod-cache' ($CACHE_NODE) laufen."
  exit 1
fi

exit 0
