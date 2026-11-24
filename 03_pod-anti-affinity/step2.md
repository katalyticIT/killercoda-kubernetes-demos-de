## Schritt 2: Web-Pod per Pod Affinity beim Cache-Pod platzieren

Nun soll ein Web-Pod **`pod-web-co`** gestartet werden – und zwar zwingend auf **demselben Node**, auf dem bereits ein Pod mit dem Label `app=cache` läuft.

### 1. Manifest ansehen

Prüfe `pod-web-co.yaml`. Unter `spec.affinity.podAffinity` definiert `topologyKey: kubernetes.io/hostname`, dass der gesuchte Cache-Pod denselben Hostnamen (also denselben Node) haben muss:

```bash
cat pod-web-co.yaml
```{{exec}}

### 2. Web-Pod starten

Wende das Manifest an:

```bash
kubectl apply -f pod-web-co.yaml
```{{exec}}

### 3. Gemeinsame Platzierung überprüfen

Vergleiche die Spalte `NODE` beider Pods. Unabhängig davon, welchen Node der Scheduler in Schritt 1 für `pod-cache` gewählt hat, läuft `pod-web-co` nun auf **genau demselben Node**:

```bash
kubectl get pods -o wide
```{{exec}}

### 4. Logs von `pod-web-co` kontrollieren

Bestätige über die Log-Ausgabe des Containers den ausführenden Node:

```bash
kubectl logs pod-web-co
```{{exec}}
