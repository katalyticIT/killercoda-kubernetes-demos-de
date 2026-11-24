# Pod-zu-Pod-Scheduling: Pod Affinity & Pod Anti-Affinity

In den ersten beiden Teilen hast du Pods anhand von **Node-Eigenschaften** (Labels und Taints) gesteuert. Oft hängt die optimale Platzierung eines Pods jedoch davon ab, **welche anderen Pods bereits auf einem Node laufen**:

- **Pod Affinity:** Zieht Pods zueinander – ideal für eng gekoppelte Dienste (z. B. Web-App und lokaler Cache), um Netzwerklatenzen zu minimieren.
- **Pod Anti-Affinity:** Hält Pods voneinander fern – ideal für **Hochverfügbarkeit**, damit Replikate eines Deployments nicht gemeinsam auf demselben Node ausfallen.

Als Bezugsrahmen (*Topologie*) dient dabei der **`topologyKey`** – in der Praxis meist `kubernetes.io/hostname` für einzelne Nodes oder `topology.kubernetes.io/zone` für Rechenzentrumszonen.

## Ablauf der Übung

1. **Basis-Pod starten:** Du startest `pod-cache` mit dem Pod-Label `app=cache`.
2. **Pod Affinity testen:** Du startest `pod-web-co`, der automatisch auf demselben Node wie `pod-cache` eingeplant wird.
3. **Pod Anti-Affinity testen:** Du erstellst das Deployment `ha-frontend` mit 2 Replikaten, die sich automatisch auf `controlplane` und `node01` verteilen.
4. **Skalierungsgrenze beobachten:** Du skalierst `ha-frontend` auf 3 Replikate und analysierst, warum der dritte Pod `Pending` bleibt.
5. **Aufräumen:** Du löschst das Deployment und die Pods wieder.

Klicke auf **START**, um die Umgebung zu starten.
