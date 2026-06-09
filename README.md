# V-SLAM: Visual Simultaneous Localization and Mapping

**Vertiefungsarbeit – Visual Computing (SS 2026) | Hochschule München**  
**Thema 9: V-SLAM Algorithmen** | Gruppe 9 | Branch: `japheth`

---

## Inhalt der Webseite

Diese interaktive Quarto-Webseite behandelt **Visual SLAM (Simultaneous Localization and Mapping)** – die Schlüsseltechnologie, die es autonomen Systemen und AR-Headsets ermöglicht, sich in unbekannten Umgebungen zu lokalisieren und gleichzeitig eine Karte aufzubauen.

| Seite | Datei | Inhalt |
|---|---|---|
| Einführung | `index.qmd` | Motivation, Use-Cases, Geschichte (Timeline), Überblick |
| Theorie | `theorie.qmd` | Kameramodell, ORB-Features, RANSAC, Bundle Adjustment, Loop Closure |
| ORB-SLAM3 | `orb-slam3.qmd` | Systemarchitektur, drei Threads, Atlas, IMU-Integration |
| Methoden | `methoden.qmd` | Vergleichstabelle, Benchmark, Radar-Diagramm, Deep Learning SLAM |
| Demo & Quiz | `demo.qmd` | 3D-Karten-Simulation (Babylon.js), Feature-Matching, Loop-Closure-Demo, 5-Fragen-Quiz |

---

## Lokale Vorschau

### Voraussetzungen

| Tool | Version | Installation |
|---|---|---|
| [Quarto](https://quarto.org/docs/get-started/) | ≥ 1.4 | [quarto.org](https://quarto.org/docs/get-started/) |
| Python | ≥ 3.10 | [python.org](https://www.python.org/downloads/) |
| pip-Pakete | — | siehe unten |

### Schritt 1 – Repository klonen

```bash
git clone https://github.com/<dein-username>/vslam-report.git
cd vslam-report
git checkout japheth
```

### Schritt 2 – Python-Abhängigkeiten installieren

```bash
pip install jupyter matplotlib numpy pandas scipy
```

### Schritt 3 – Quarto installieren

Lade den Installer von [quarto.org/docs/get-started/](https://quarto.org/docs/get-started/) herunter und führe ihn aus. Danach:

```bash
quarto check
```

### Schritt 4 – Webseite rendern und öffnen

```bash
quarto preview
```

Quarto startet automatisch einen lokalen Webserver und öffnet die Seite im Browser (Standard: `http://localhost:4295`).

Für eine statische HTML-Ausgabe:

```bash
quarto render
```

Die gerenderten Dateien befinden sich danach im Ordner `_site/`.

---

## Deployment auf GitHub Pages (automatisch)

Das Repository nutzt **GitHub Actions** für automatisches Deployment:

1. **Repository forken** (Button oben rechts auf GitHub)

2. **Workflow-Berechtigungen aktivieren:**
   - `Settings → Actions → General → Workflow permissions`
   - „Read and write permissions" auswählen → Save
   - Tab „Actions" → „I understand my workflows, go ahead and enable them"

3. **GitHub Pages aktivieren:**
   - `Settings → Pages → Build and deployment`
   - Branch: `gh-pages` auswählen → Save
   - *(Der Branch `gh-pages` wird beim ersten Workflow-Durchlauf erstellt)*

4. **Push auf `main` oder `japheth`** triggert automatisch den Build.

Die fertige Seite ist unter folgendem URL erreichbar:
```
https://<dein-username>.github.io/vslam-report/
```

---

## Projektstruktur

```
vslam-report/
├── _quarto.yml          # Quarto-Website-Konfiguration (Navigation, Theme)
├── custom.scss          # Benutzerdefinierte CSS-Stile
├── index.qmd            # Startseite: Einführung + Geschichte
├── theorie.qmd          # Mathematische Grundlagen
├── orb-slam3.qmd        # ORB-SLAM3 im Detail
├── methoden.qmd         # Verwandte Methoden + Vergleich
├── demo.qmd             # Interaktive Demo + Quiz
├── references.bib       # BibTeX-Literaturverzeichnis (18 Quellen)
├── README.md            # Diese Datei
└── .github/
    └── workflows/
        └── publish.yml  # GitHub Actions: Auto-Deploy auf gh-pages
```

---

## Technologien

| Technologie | Verwendung |
|---|---|
| [Quarto](https://quarto.org) | Website-Framework, Rendering von QMD-Dateien |
| Python + matplotlib | Statische Diagramme (Benchmark, Trajektorien, Feature-Extraktion) |
| Python + numpy | Simulationen (RANSAC, Bundle Adjustment, Loop Closure) |
| [Babylon.js](https://www.babylonjs.com/) | Interaktive 3D-Karten-Simulation |
| JavaScript | Quiz-Logik, interaktive UI-Elemente |
| SCSS | Benutzerdefiniertes Styling (Hero-Banner, Timeline, Tabellen) |
| BibTeX / IEEE CSL | Automatisches Literaturverzeichnis |

---

## Bekannte Einschränkungen

- **Quarto muss installiert sein**, um die Seite lokal zu rendern (kein reines HTML-Repo)
- Die **3D-Babylon.js-Visualisierung** benötigt eine aktive Internetverbindung für das CDN
- Python-Plots werden beim `quarto render` serverseitig erzeugt; für `quarto preview` muss Jupyter verfügbar sein

---

## Literatur (Auswahl)

- Campos et al. (2021): *ORB-SLAM3* – IEEE Transactions on Robotics
- Mur-Artal & Tardós (2017): *ORB-SLAM2* – IEEE Transactions on Robotics
- Hartley & Zisserman (2004): *Multiple View Geometry in Computer Vision*
- Engel et al. (2014): *LSD-SLAM* – ECCV
- Fischler & Bolles (1981): *RANSAC* – Communications of the ACM

Vollständiges Literaturverzeichnis: [`references.bib`](references.bib)

---

*Visual Computing – Hochschule München | Fakultät für Informatik und Mathematik | SS 2026*
