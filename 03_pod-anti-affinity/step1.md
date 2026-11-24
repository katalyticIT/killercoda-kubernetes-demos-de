## Schritt 1: Basis-Pod `pod-cache` starten

Für **Pod Affinity** benötigt der Scheduler einen Referenz-Pod mit einem passenden **Pod-Label**. Die vorbereiteten YAML-Dateien liegen bereits in deinem Verzeichnis bereit.

### 1. Vorhandene Dateien prüfen und `pod-cache.yaml` ansehen

Sieh dir die Dateien im Verzeichnis sowie das Manifest `pod-cache.yaml` an (beachte das Label `app: cache` unter `metadata.labels`):

```bash
ls -l *.yaml
cat pod-cache.yaml
```{{exec}}

### 2. Cache-Pod starten

Erstelle den Pod `pod-cache`:

```bash
kubectl apply -f pod-cache.yaml
```{{exec}}

### 3. Node-Zuweisung, Labels und Logs prüfen

Kontrolliere, auf welchem Node `pod-cache` eingeplant wurde (der Scheduler wählt automatisch einen der beiden Nodes), und lies das Log aus:

```bash
kubectl get pod pod-cache -o wide --show-labels
kubectl logs pod-cache
```{{exec}}
