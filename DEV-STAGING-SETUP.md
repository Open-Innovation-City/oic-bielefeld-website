# Development & Staging Setup für OIC Bielefeld Website

## Übersicht

Dieses Dokument beschreibt zwei Setups:
1. **Lokale Entwicklungsumgebung** für schnelle Iterationen
2. **Staging-Umgebung** über separates GitHub Repository

## 1. Lokale Entwicklungsumgebung

### Voraussetzungen

Du hast bereits alles installiert:
- Ruby (über dein bestehendes Setup)
- Bundler 
- Jekyll 4.3.2
- Alle Gems aus der Gemfile

### Quick Start

```bash
# In dein Projektverzeichnis wechseln
cd /Users/jensedler/Documents/GitHub/oic-bielefeld-website

# Dependencies installieren (falls noch nicht geschehen)
bundle install

# Development Server starten
bundle exec jekyll serve --livereload --drafts --incremental
```

**Was passiert:**
- Website läuft auf `http://localhost:4000`
- **Livereload**: Änderungen werden automatisch im Browser aktualisiert
- **Drafts**: Entwürfe (mit `published: false`) werden angezeigt
- **Incremental**: Nur geänderte Dateien werden neu generiert (schneller)

### Erweiterte Optionen

```bash
# Mit anderem Port (falls 4000 belegt)
bundle exec jekyll serve --livereload --port 4001

# Mit Host-Binding (für Zugriff von anderen Geräten im Netzwerk)
bundle exec jekyll serve --livereload --host 0.0.0.0

# Nur Build ohne Server
bundle exec jekyll build

# Mit detailliertem Logging
bundle exec jekyll serve --livereload --verbose
```

### Performance-Tipps

1. **Incremental Build nutzen**: `--incremental` bei größeren Sites
2. **Drafts ausschließen**: Ohne `--drafts` für bessere Performance
3. **Exclude optimieren**: In `_config.yml` mehr Ordner ausschließen:
   ```yaml
   exclude:
     - README.md
     - Gemfile
     - Gemfile.lock
     - node_modules
     - vendor
     - CLAUDE.md
     - .git
     - .sass-cache
     - .jekyll-cache
   ```

### Troubleshooting

**Problem: `Address already in use`**
```bash
# Anderen Port verwenden
bundle exec jekyll serve --livereload --port 4001
```

**Problem: Livereload funktioniert nicht**
```bash
# Browser-Cache leeren oder Inkognito-Modus verwenden
# Prüfen ob Livereload-Script geladen wird (Developer Tools)
```

**Problem: CSS/JS Änderungen werden nicht übernommen**
```bash
# Jekyll Cache löschen
bundle exec jekyll clean
bundle exec jekyll serve --livereload
```

## 2. Staging-Umgebung Setup

### Warum separates Repository?

GitHub Pages unterstützt nur **ein** Publishing Source pro Repository. Für Staging brauchen wir deshalb ein separates Repository.

### Schritt 1: Staging Repository erstellen

1. **Neues Repository auf GitHub erstellen:**
   - Name: `oic-bielefeld-website-staging`
   - Private oder Public (deine Wahl)
   - **Wichtig**: Keine README, .gitignore oder License hinzufügen

2. **GitHub Pages für Staging aktivieren:**
   - Repository Settings → Pages
   - Source: "Deploy from a branch"
   - Branch: `main` (oder `gh-pages`)
   - Folder: `/ (root)`

### Schritt 2: Git-Workflow einrichten

```bash
# In dein bestehendes Projektverzeichnis
cd /Users/jensedler/Documents/GitHub/oic-bielefeld-website

# Staging Remote hinzufügen
git remote add staging https://github.com/DEIN-USERNAME/oic-bielefeld-website-staging.git

# Remotes prüfen
git remote -v
# origin    https://github.com/DEIN-USERNAME/oic-bielefeld-website.git (fetch)
# origin    https://github.com/DEIN-USERNAME/oic-bielefeld-website.git (push)
# staging   https://github.com/DEIN-USERNAME/oic-bielefeld-website-staging.git (fetch)
# staging   https://github.com/DEIN-USERNAME/oic-bielefeld-website-staging.git (push)
```

### Schritt 3: Staging-Branch erstellen

```bash
# Staging Branch erstellen
git checkout -b staging

# Staging-spezifische Konfiguration (optional)
# Staging-URL in _config.yml anpassen
```

**Optional: Staging-Config erstellen**
```bash
# _config_staging.yml erstellen für staging-spezifische Settings
cp _config.yml _config_staging.yml
```

In `_config_staging.yml` anpassen:
```yaml
url: "https://DEIN-USERNAME.github.io/oic-bielefeld-website-staging"
baseurl: "/oic-bielefeld-website-staging"  # Falls nötig

# Staging-spezifische Einstellungen
google_analytics: ""  # Kein Analytics auf Staging
environment: "staging"
```

### Schritt 4: Deployment-Workflow

#### Einfacher Workflow:
```bash
# 1. Feature in eigenem Branch entwickeln
git checkout -b feature/neue-funktion

# 2. Lokal testen
bundle exec jekyll serve --livereload

# 3. Nach Staging pushen zum Testen
git checkout staging
git merge feature/neue-funktion
git push staging staging:main  # Push zu Staging-Repo

# 4. Staging-URL testen: https://DEIN-USERNAME.github.io/oic-bielefeld-website-staging

# 5. Nach Freigabe zu Production
git checkout main
git merge feature/neue-funktion
git push origin main  # Push zu Live-Site
```

#### Erweiteter Workflow mit separater Config:
```bash
# Mit Staging-Config deployen
git checkout staging

# Staging-Config verwenden
bundle exec jekyll build --config _config.yml,_config_staging.yml

# Manuell commit und push
git add _site
git commit -m "Staging deployment"
git push staging staging:main
```

### Schritt 5: Automatisierung (Optional)

Erstelle ein Script `deploy-staging.sh`:
```bash
#!/bin/bash

echo "🚀 Deploying to staging..."

# Zu Staging Branch wechseln
git checkout staging

# Mit main Branch mergen
git merge main

# Mit Staging-Config builden (optional)
# bundle exec jekyll build --config _config.yml,_config_staging.yml

# Zu Staging pushen
git push staging staging:main

echo "✅ Deployed to staging!"
echo "🔗 Check: https://DEIN-USERNAME.github.io/oic-bielefeld-website-staging"

# Zurück zu main
git checkout main
```

Script ausführbar machen:
```bash
chmod +x deploy-staging.sh
./deploy-staging.sh
```

## 3. Empfohlener Workflow

### Für kleine Änderungen:
1. **Lokal entwickeln** mit `bundle exec jekyll serve --livereload`
2. **Direkt zu main** pushen (wie bisher)

### Für größere Features/Layout-Änderungen:
1. **Feature Branch** erstellen: `git checkout -b feature/name`
2. **Lokal entwickeln** und testen
3. **Zu Staging** pushen: `./deploy-staging.sh`
4. **Mit Kolleginnen reviewen** über Staging-URL
5. **Zu Production** mergen: `git checkout main && git merge feature/name && git push`

## 4. URLs und Zugriff

- **Lokal**: `http://localhost:4000`
- **Staging**: `https://DEIN-USERNAME.github.io/oic-bielefeld-website-staging`
- **Production**: `http://oic-bielefeld.de`

## 5. Tipps & Best Practices

### Git-Workflow Tipps:
- **Feature Branches**: Verwende beschreibende Namen (`feature/team-page-redesign`)
- **Commit Messages**: Deutsch ist ok, bleib konsistent
- **Kleine Commits**: Lieber häufiger committen

### Staging-Tipps:
- **Regelmäßig synchronisieren**: Staging sollte nah an main bleiben
- **Content-Unterschiede**: Staging kann Test-Content haben
- **URLs testen**: Absolute Links überprüfen (wegen baseurl)

### Performance:
- **Livereload**: Nur lokal verwenden, nie auf Server
- **Cache**: Bei Problemen `bundle exec jekyll clean`
- **Incremental**: Nutzen bei größeren Sites

### Team-Zusammenarbeit:
- **Staging-URLs teilen**: Einfach Link schicken
- **Screenshots**: Bei kleinen Änderungen oft schneller
- **Feedback-Workflow**: GitHub Issues oder direktes Feedback

## 6. Troubleshooting

### Staging-Probleme:
**Staging-Site lädt nicht:**
- GitHub Pages Settings prüfen
- Branch-Name in Settings korrekt?
- DNS-Propagation abwarten (bis 10 Minuten)

**CSS/JS fehlt auf Staging:**
- `baseurl` in `_config_staging.yml` prüfen
- Relative vs. absolute Pfade in Templates

**Staging ist veraltet:**
```bash
git checkout staging
git merge main
git push staging staging:main
```

### Lokale Probleme:
**Port belegt:**
```bash
# Anderen Port verwenden
bundle exec jekyll serve --livereload --port 4001
```

**Gems fehlen:**
```bash
bundle install
```

**Jekyll Version Probleme:**
```bash
bundle update jekyll
```

Das Setup gibt dir maximale Flexibilität: Schnelle lokale Iteration für dich, öffentliche Staging-URLs für Team-Feedback, und deine bestehende Production-Pipeline bleibt unverändert!