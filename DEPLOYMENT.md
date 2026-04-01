# OIC Website Deployment Guide

Diese Anleitung zeigt, wie Sie die OIC Bielefeld Website für Ihre Stadt anpassen und deployen können.

## 🏁 Schnellstart

### 1. Repository clonen

```bash
# Repository forken auf GitHub, dann:
git clone https://github.com/IHR-USERNAME/oic-bielefeld-website.git
cd oic-bielefeld-website

# Umbenennen für Ihre Stadt
mv oic-bielefeld-website oic-IHRE-STADT-website
cd oic-IHRE-STADT-website
```

### 2. Lokale Entwicklungsumgebung einrichten

```bash
# Ruby und Bundler installieren (falls nicht vorhanden)
# macOS:
brew install ruby
gem install bundler

# Ubuntu/Debian:
sudo apt-get install ruby-full build-essential
gem install bundler

# Dependencies installieren
bundle install

# Lokalen Server starten
bundle exec jekyll serve
# Website ist unter http://localhost:4000 erreichbar
```

## 🎨 Website anpassen

### 3. Grundkonfiguration anpassen

Bearbeiten Sie `_config.yml`:

```yaml
# Site Settings
title: "Open Innovation City IHRE-STADT"
description: "Gemeinsam gestalten wir die Zukunft unserer Stadt durch offene Innovation und kreative Zusammenarbeit."
url: "https://oic-ihre-stadt.de"

# Site data
email: info@oic-ihre-stadt.de
phone: "+49 XXX XXXXXXX"
address: 
  street: "Ihre Straße XX"
  city: "XXXXX Ihre Stadt"
opening_hours: "Mo-Fr 9:00-17:00 Uhr"

# Social Media
social:
  twitter: "ihr-twitter-handle"
  linkedin: "ihr-linkedin-profil"
  github: "ihr-github-account"
```

### 4. Team-Daten anpassen

Bearbeiten Sie `_data/team.yml`:

```yaml
- name: "Ihr Name"
  role: "Leiter OIC Ihre Stadt"
  image: "/assets/images/team/ihr-foto.jpg"
  expertise:
    - "Offene Innovationen"
    - "Design Thinking"
    - "Ihr Expertise-Bereich"
  email: "ihr.name@ihre-stadt.de"
  animation_delay: 0.1

# Weitere Teammitglieder hinzufügen...
```

### 5. Projekt-Daten anpassen

Bearbeiten Sie `_data/projects.yml`:

```yaml
- title: "Ihr Projekt"
  tag: "Smart City"
  description: "Beschreibung Ihres Projekts..."
  status: "Im Live-Betrieb"
  responsible: "Ihr Name"
  date: "2024"
  link: "https://ihr-projekt.de"  # Optional
```

### 6. Event-Daten anpassen

Bearbeiten Sie `_data/events.yml`:

```yaml
- title: "Ihr Event"
  date: "2024-07-15"
  time: "18:00"
  location: "Ihr Veranstaltungsort"
  description: "Beschreibung Ihres Events..."
  target_audience: "Für alle Interessierten"
  booking_url: "https://ihr-buchungslink.de"
```

## 🖼️ Bilder und Logo anpassen

### 7. Logo ersetzen

Ersetzen Sie die Dateien in `/assets/images/`:

```bash
# Ihre Logos (empfohlene Größen):
/assets/images/logo.svg          # Haupt-Logo (SVG bevorzugt)
/assets/images/logo-light.png    # Helles Logo für dunkle Hintergründe (300x100px)
/assets/images/logo-dark.png     # Dunkles Logo für helle Hintergründe (300x100px)
```

### 8. Team-Fotos hinzufügen

```bash
# Team-Fotos (empfohlene Größe: 400x400px, quadratisch):
/assets/images/team/ihr-name.jpg
/assets/images/team/teammitglied2.jpg
# etc.
```

### 9. Header-Bilder (optional)

```bash
# Für Beitragsseiten (empfohlene Größe: 1200x600px):
/assets/images/header-projekt.jpg
/assets/images/header-event.jpg
# etc.
```

## 🚀 GitHub Pages Deployment

### 10. GitHub Repository erstellen

1. Gehen Sie zu [GitHub](https://github.com) und loggen Sie sich ein
2. Klicken Sie auf "New repository"
3. Repository-Name: `oic-ihre-stadt-website`
4. Setzen Sie auf "Public" (für GitHub Pages kostenlos)
5. Klicken Sie "Create repository"

### 11. Code zu GitHub pushen

```bash
# Remote Origin setzen
git remote set-url origin https://github.com/IHR-USERNAME/oic-ihre-stadt-website.git

# Oder neues Repository:
git remote add origin https://github.com/IHR-USERNAME/oic-ihre-stadt-website.git

# Code pushen
git add .
git commit -m "Initial setup for OIC Ihre Stadt"
git push -u origin main
```

### 12. GitHub Pages aktivieren (mit Suchfunktion)

Die Website enthält eine Pagefind-Suchfunktion, die einen eigenen Build-Schritt benötigt. Dafür ist eine **GitHub Actions Workflow-Datei** notwendig – „Deploy from a branch" reicht nicht aus.

**Schritt 1 – Workflow-Datei erstellen:** Erstelle `.github/workflows/deploy.yml`:

```yaml
name: Deploy to GitHub Pages

on:
  push:
    branches: [main]

permissions:
  contents: read
  pages: write
  id-token: write

jobs:
  build-and-deploy:
    runs-on: ubuntu-latest
    environment:
      name: github-pages
      url: ${{ steps.deployment.outputs.page_url }}
    steps:
      - uses: actions/checkout@v4

      - uses: ruby/setup-ruby@v1
        with:
          ruby-version: '3.2'
          bundler-cache: true

      - name: Jekyll Build
        run: bundle exec jekyll build

      - name: Pagefind Index generieren
        run: npx pagefind --site _site

      - uses: actions/configure-pages@v4

      - uses: actions/upload-pages-artifact@v3
        with:
          path: _site

      - uses: actions/deploy-pages@v4
        id: deployment
```

**Schritt 2 – GitHub Pages auf Actions umstellen:**
1. Gehen Sie zu Settings → Pages
2. Unter "Source" wählen Sie **"GitHub Actions"** (nicht „Deploy from a branch")
3. Speichern

🎉 **Ihre Website ist nun live** und die Suche wird bei jedem Push automatisch neu indexiert.

## 🌐 Eigene Domain verwenden (optional)

### 13. Custom Domain einrichten

1. Kaufen Sie eine Domain (z.B. `oic-ihre-stadt.de`)
2. Erstellen Sie eine Datei `CNAME` im Repository-Root:

```bash
echo "oic-ihre-stadt.de" > CNAME
git add CNAME
git commit -m "Add custom domain"
git push
```

3. Bei Ihrem Domain-Provider DNS-Einstellungen konfigurieren:

```
# A Records für GitHub Pages:
185.199.108.153
185.199.109.153
185.199.110.153
185.199.111.153

# Oder CNAME Record:
ihr-username.github.io
```

4. In GitHub Settings > Pages > Custom domain: `oic-ihre-stadt.de` eingeben

## 📝 Inhalte erstellen und verwalten

### 14. Neue Beiträge erstellen

Erstellen Sie Dateien in `_beitraege/`:

```markdown
---
title: "Ihr Beitragstitel"
teaser: "Kurze Beschreibung des Beitrags..."
authors:
  - "Ihr Name"  # Muss mit team.yml übereinstimmen
category: "Tools"   # Tools, Projekte, oder News
date: 2024-06-30
header_image: "/assets/images/header-beitrag.jpg"  # Optional
---

## Ihr Inhalt

Hier schreiben Sie Ihren Beitrag in **Markdown**.

### YouTube-Videos einbinden

{% include youtube.html id="VIDEO_ID" title="Video Titel" %}

### Bilder einbinden

![Bildbeschreibung](/assets/images/ihr-bild.jpg)
```

### 15. Workflow für Updates

```bash
# Lokale Änderungen testen
bundle exec jekyll serve

# Änderungen committen und pushen
git add .
git commit -m "Beschreibung der Änderungen"
git push

# GitHub Pages deployt automatisch (dauert 1-2 Minuten)
```

## 🛠️ Erweiterte Anpassungen

### 16. Farben anpassen

In `assets/css/main.css` die CSS-Variablen ändern:

```css
:root {
  --primary-turquoise: #00b2bb;    /* Hauptfarbe */
  --primary-yellow: #fff564;       /* Akzentfarbe */
  --secondary-blue: #666cde;       /* Sekundärfarbe */
  /* ... weitere Farben */
}
```

### 17. Navigation anpassen

In `_config.yml` die Navigation bearbeiten:

```yaml
navigation:
  - name: "Start"
    link: "#hero"
  - name: "Über uns"
    link: "#about"
  - name: "Ihr Bereich"
    link: "#ihr-bereich"
  # ... weitere Menüpunkte
```

## 📋 Checkliste für Go-Live

- [ ] `_config.yml` vollständig angepasst
- [ ] Team-Daten in `_data/team.yml` aktualisiert
- [ ] Projekt-Daten in `_data/projects.yml` angepasst
- [ ] Event-Daten in `_data/events.yml` eingepflegt
- [ ] Logos und Bilder ausgetauscht
- [ ] Lokale Tests erfolgreich (`bundle exec jekyll serve`)
- [ ] GitHub Repository erstellt und Code gepusht
- [ ] GitHub Actions Workflow erstellt (`.github/workflows/deploy.yml`)
- [ ] GitHub Pages Source auf "GitHub Actions" umgestellt
- [ ] Website unter GitHub Pages URL erreichbar
- [ ] Suchfunktion unter `/suche/` getestet
- [ ] Custom Domain konfiguriert (falls gewünscht)
- [ ] Erste Beiträge erstellt
- [ ] Impressum und Datenschutz angepasst (`impressum.md`, `datenschutz.md`)

## 🆘 Hilfe und Support

### Häufige Probleme

**Problem:** Jekyll Build schlägt fehl
**Lösung:** Prüfen Sie die Syntax in YAML-Dateien (keine Tabs verwenden!)

**Problem:** Bilder werden nicht angezeigt
**Lösung:** Pfade prüfen, sollten mit `/assets/images/` beginnen

**Problem:** Team-Mitglied wird nicht angezeigt
**Lösung:** Name in `team.yml` muss exakt mit `authors` (oder Legacy-`author`) im Beitrag übereinstimmen

### Weitere Hilfe

- [Jekyll Dokumentation](https://jekyllrb.com/docs/)
- [GitHub Pages Dokumentation](https://docs.github.com/en/pages)
- [Markdown Syntax](https://www.markdownguide.org/basic-syntax/)

## 🔄 Updates und Wartung

Um Updates vom Original-Repository zu erhalten:

```bash
# Original Repository als Upstream hinzufügen
git remote add upstream https://github.com/jensedler/oic-bielefeld-website.git

# Updates vom Original holen
git fetch upstream
git merge upstream/main

# Konflikte lösen und pushen
git push origin main
```

---

**Viel Erfolg mit Ihrer OIC Website!** 🚀

Bei Fragen oder Problemen können Sie gerne ein Issue im Original-Repository erstellen.
