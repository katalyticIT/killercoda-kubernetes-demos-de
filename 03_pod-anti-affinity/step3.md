## Schritt 3: Frontend-Replikate per Pod Anti-Affinity trennen

Für ausfallsichere Anwendungen gilt das Gegenteil: Zwei Instanzen derselben Anwendung sollen **nicht** auf demselben Node laufen. Dafür sorgt **`podAntiAffinity`**.

### 1. Deployment-Manifest ansehen

Wirf einen Blick in `ha-frontend.yaml`. Das Deployment startet **2 Replikate** mit dem Label `app: frontend` und verbietet über `podAntiAffinity`, dass zwei Pods mit `app: frontend` denselben `kubernetes.io/hostname` teilen:

```bash
cat ha-frontend.yaml
```{{exec}}

### 2. Deployment erstellen

Starte das Deployment:

```bash
kubectl apply -f ha-frontend.yaml
```{{exec}}

### 3. Verteilung auf beide Nodes überprüfen

Lass dir alle Pods mit dem Label `app=frontend` anzeigen. Ein Pod läuft auf `controlplane`, der andere auf `node01`:

```bash
kubectl get pods -l app=frontend -o wide
```{{exec}}
