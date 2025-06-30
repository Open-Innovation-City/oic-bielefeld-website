# Newsletter Generator - Anleitung

## 🚀 Über den Newsletter Generator

Der Newsletter Generator automatisiert die Erstellung von Newslettern aus Ihren Beiträgen. Er scannt Ihre `_beitraege/` und erstellt professionelle Newsletter-HTML-Dateien.

## 🛠️ Installation & Setup

### 1. Python Dependencies installieren

```bash
# Im Website-Verzeichnis
pip install -r requirements.txt

# Oder manual:
pip install PyYAML markdown
```

### 2. Script ausführbar machen (Linux/Mac)

```bash
chmod +x newsletter-generator.py
```

## 📧 Newsletter erstellen

### Einfache Nutzung:

```bash
python newsletter-generator.py
```

### Mit Optionen:

```bash
# Beiträge der letzten 60 Tage berücksichtigen
python newsletter-generator.py --since-days 60

# Anderes Website-Verzeichnis
python newsletter-generator.py --base-path /pfad/zu/website/
```

## 🎯 Workflow im Detail

### 1. **Script starten**
```bash
$ python newsletter-generator.py
🚀 OIC Newsletter Generator
========================================
📁 Lade Beiträge...
✅ 8 Beiträge gefunden
🗓️  Suche Beiträge seit: 01.06.2024
✅ 3 aktuelle Beiträge gefunden
```

### 2. **Beiträge auswählen**
```
📄 Verfügbare Beiträge (3):
============================================================
[ 1] KI-Tool revolutioniert die Bürgerbeteiligung
     📅 30.06.2024 | 👤 Stephan Berkowitz | 🏷️ Tools
     💭 Ein innovatives KI-Tool unterstützt die Stadt Bielefeld dabei...

[ 2] Smart City Projekt gestartet  
     📅 15.06.2024 | 👤 Maria Gonçalves | 🏷️ Projekte
     💭 Neues Pilotprojekt zur intelligenten Stadtentwicklung...

[ 3] Innovation Workshop Rückblick
     📅 10.06.2024 | 👤 Sarah Bollmann | 🏷️ Events
     💭 Erfolgreicher Workshop mit 50 Teilnehmern...

Auswahl-Optionen:
• Einzelne Nummern: 1,3,5
• Bereiche: 1-3  
• Alle: 'all' oder 'alle'
• Keine: 'none' oder Enter

➤ Beiträge auswählen: 1,3
```

### 3. **Newsletter wird generiert**
```
✅ 2 Beiträge ausgewählt:
   • KI-Tool revolutioniert die Bürgerbeteiligung
   • Innovation Workshop Rückblick

🔄 Generiere Newsletter mit 2 Beiträgen...

✅ Newsletter erfolgreich generiert!
📄 Datei: /pfad/zu/website/_site/newsletter/newsletter-2024-06.html
🌐 URL: /newsletter/newsletter-2024-06.html

💡 Tipp: Öffnen Sie die Datei in einem Browser zur Vorschau
```

## 📋 Auswahl-Syntaxen

| Eingabe | Bedeutung |
|---------|-----------|
| `1` | Beitrag Nr. 1 |
| `1,3,5` | Beiträge Nr. 1, 3 und 5 |
| `1-3` | Beiträge Nr. 1 bis 3 |
| `1,3-5,7` | Beitrag 1, Beiträge 3-5, Beitrag 7 |
| `all` oder `alle` | Alle verfügbaren Beiträge |
| `none` oder Enter | Keine Auswahl, Abbruch |

## 🎨 Was wird generiert?

### Newsletter-Struktur:
1. **Header** mit OIC-Branding und aktuellem Datum
2. **Einleitung** mit Begrüßung und Zusammenfassung
3. **Beitrags-Abschnitte** mit:
   - Titel des Beitrags
   - Anreißertext (teaser)
   - "Beitrag lesen" Button mit Link
   - Meta-Infos (Datum, Autor, Kategorie)
4. **Abschluss** mit Verabschiedung
5. **Footer** mit Kontaktdaten und Abmelde-Link

### Beispiel-Output:
```html
<!-- Automatisch generiert: -->
<h3>KI-Tool revolutioniert die Bürgerbeteiligung</h3>
<p>Ein innovatives KI-Tool unterstützt die Stadt Bielefeld dabei, 
   Bürgerfeedback effizienter zu sammeln und auszuwerten...</p>
<a href="https://oic-bielefeld.de/beitraege/beispiel-ki-tool/">
   Beitrag lesen
</a>
<p>📅 30.06.2024 | 👤 Stephan Berkowitz | 🏷️ Tools</p>
```

## 📁 Ausgabe-Dateien

### Datei-Pfad:
```
_site/newsletter/newsletter-YYYY-MM.html
```

### Datei-Namen:
- `newsletter-2024-06.html` (automatisch nach Monat)
- Custom Namen möglich durch Code-Anpassung

## ⚙️ Konfiguration

### Command-Line Optionen:

```bash
python newsletter-generator.py --help

optional arguments:
  -h, --help           show this help message and exit
  --since-days DAYS    Beiträge der letzten N Tage (Standard: 30)
  --base-path PATH     Basis-Pfad der Jekyll-Website (Standard: .)
```

### Beispiele:

```bash
# Nur Beiträge der letzten Woche
python newsletter-generator.py --since-days 7

# Beiträge der letzten 3 Monate  
python newsletter-generator.py --since-days 90

# Andere Website
python newsletter-generator.py --base-path /pfad/zu/anderer/website/
```

## 🔧 Anpassungen

### Newsletter-Template ändern:
Das Script nutzt `newsletter-template.html`. Änderungen dort wirken sich direkt auf die Ausgabe aus.

### Datum-Format anpassen:
```python
# In newsletter-generator.py, Zeile ~180
date_str = post['date_obj'].strftime('%d.%m.%Y')  # Deutsch
# oder
date_str = post['date_obj'].strftime('%Y-%m-%d')  # ISO-Format
```

### Intro-Text anpassen:
```python
# In generate_newsletter_content(), Zeile ~230
intro_text = f"""
Ihr individueller Begrüßungstext hier...
"""
```

## 🐛 Troubleshooting

### Häufige Probleme:

**Problem:** `ModuleNotFoundError: No module named 'yaml'`
**Lösung:** `pip install PyYAML`

**Problem:** `Keine Beiträge gefunden`
**Lösung:** 
- Prüfen Sie, ob `_beitraege/` Verzeichnis existiert
- Prüfen Sie, ob `.md` Dateien Front Matter haben

**Problem:** `Ungültige YAML Syntax`
**Lösung:**
- Prüfen Sie Front Matter in Beiträgen
- Keine Tabs verwenden, nur Leerzeichen
- Strings mit Sonderzeichen in Anführungszeichen

**Problem:** `Template nicht gefunden`
**Lösung:**
- Stellen Sie sicher, dass `newsletter-template.html` im Hauptverzeichnis liegt
- Verwenden Sie `--base-path` Parameter wenn nötig

### Debug-Modus:
```python
# Am Anfang von newsletter-generator.py hinzufügen:
import logging
logging.basicConfig(level=logging.DEBUG)
```

## 🚀 Erweiterte Nutzung

### 1. **Integration in Jekyll Build**
```bash
# In Ihrem Build-Script
python newsletter-generator.py --since-days 30
bundle exec jekyll build
```

### 2. **Automatisierung mit Cron**
```bash
# Wöchentlicher Newsletter (crontab -e)
0 9 * * 1 cd /pfad/zu/website && python newsletter-generator.py --since-days 7
```

### 3. **Integration mit GitHub Actions**
```yaml
# .github/workflows/newsletter.yml
name: Generate Newsletter
on:
  workflow_dispatch:  # Manual trigger
jobs:
  newsletter:
    runs-on: ubuntu-latest
    steps:
    - uses: actions/checkout@v3
    - name: Setup Python
      uses: actions/setup-python@v4
      with:
        python-version: '3.9'
    - name: Install dependencies
      run: pip install -r requirements.txt
    - name: Generate Newsletter
      run: python newsletter-generator.py --since-days 30
```

## 📈 Weitere Features (Erweiterungen)

### Mögliche Erweiterungen:
- **E-Mail-Versand** via SMTP
- **PDF-Export** für Archivierung
- **Template-Varianten** für verschiedene Newsletter-Typen
- **Automatische Kategorisierung** nach Themen
- **Statistiken** über Newsletter-Performance
- **Slack/Teams Integration** für Benachrichtigungen

---

**Viel Erfolg mit Ihrem automatisierten Newsletter!** 📧

Bei Problemen oder Verbesserungsvorschlägen erstellen Sie gerne ein Issue im Repository.