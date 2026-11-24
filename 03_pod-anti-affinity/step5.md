## Schritt 5: Deployment und Pods löschen

Lösche abschließend das Deployment `ha-frontend` sowie die beiden einzelnen Pods `pod-cache` und `pod-web-co`:

```bash
kubectl delete deployment ha-frontend
kubectl delete pod pod-cache pod-web-co
```{{exec}}

Kontrolliere, dass keine Pods mehr im `default`-Namespace laufen:

```bash
kubectl get pods
```{{exec}}
