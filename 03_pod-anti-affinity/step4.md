## Schritt 4: Verhalten bei zu vielen Replikaten beobachten

Da `requiredDuringSchedulingIgnoredDuringExecution` eine **harte Regel** ist und unser Cluster nur **zwei Nodes** besitzt, können maximal zwei `ha-frontend`-Pods gleichzeitig laufen. Was passiert beim Skalieren auf **3 Replikate**?

### 1. Deployment auf 3 Replikate skalieren

Erhöhe die Anzahl der Replikate auf `3`:

```bash
kubectl scale deployment ha-frontend --replicas=3
```{{exec}}

### 2. Alle Frontend-Pods überprüfen

Lass dir die Frontend-Pods anzeigen. Zwei Pods befinden sich im Status `Running`, während der dritte Pod im Status **`Pending`** bleibt:

```bash
kubectl get pods -l app=frontend -o wide
```{{exec}}

### 3. Details zum `Pending`-Pod prüfen

Untersuche den nicht eingeplanten Pod mit `kubectl describe`. Im Abschnitt **`Events`** meldet der Scheduler, dass auf keinem Node mehr die Pod-Anti-Affinity-Regel erfüllt werden kann:

```bash
PENDING_POD=$(kubectl get pods -l app=frontend --field-selector=status.phase=Pending -o jsonpath='{.items[0].metadata.name}')
kubectl describe pod "$PENDING_POD"
```{{exec}}

> **Praxistipp:** Soll Kubernetes bei Ressourcenknappheit lieber zwei Replikate auf einem Node erlauben statt den Pod im Status `Pending` zu blockieren, nutzt man stattdessen `preferredDuringSchedulingIgnoredDuringExecution` (Soft Pod Anti-Affinity).
