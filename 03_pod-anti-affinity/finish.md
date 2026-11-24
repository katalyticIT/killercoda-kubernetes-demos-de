# Übung abgeschlossen!

Du hast **Pod Affinity** und **Pod Anti-Affinity** erfolgreich eingesetzt, um Pods relativ zueinander im Cluster zu steuern.

## Gesamtüberblick der Schulungsreihe

| Mechanismen | Bezugspunkt | Typischer Einsatzfall |
|---|---|---|
| **`nodeSelector` & Node Affinity** | **Node-Labels** | Workloads an bestimmte Hardware, Räume oder Zonen binden |
| **Taints & Tolerations** | **Node-Sperren** | Dedizierte Nodes vor unerwünschten Pods schützen |
| **Pod Affinity** | **Pod-Labels** (gleiche Topologie) | Eng gekoppelte Dienste (z. B. App + Cache) auf demselben Node bündeln |
| **Pod Anti-Affinity** | **Pod-Labels** (getrennte Topologie) | Replikate für Hochverfügbarkeit auf verschiedene Nodes verteilen |
