# Redaktionsleitfaden - OIC Bielefeld Website

Dieser Leitfaden erklärt, wie Sie Inhalte auf der OIC Bielefeld Website bearbeiten können. Die Website wird über GitHub verwaltet - keine Sorge, das ist einfacher als es klingt!

## Übersicht: Wie funktioniert die Website?

Die Website basiert auf Jekyll und nutzt strukturierte Daten:
- **Teammitglieder** werden in `_data/team.yml` verwaltet
- **Events** werden in `_data/events.yml` verwaltet  
- **Blog-Beiträge** werden als Markdown-Dateien in `_beitraege/` gespeichert

Alle Änderungen werden über GitHub gemacht und automatisch auf der Website veröffentlicht.

## GitHub Grundlagen

### Anmelden und Navigieren
1. Gehen Sie zu https://github.com/jensedler/oic-bielefeld-website
2. Melden Sie sich mit Ihrem GitHub-Account an
3. Sie sehen die Verzeichnisstruktur der Website

### Dateien bearbeiten
1. Klicken Sie auf eine Datei, um sie zu öffnen
2. Klicken Sie auf das Stift-Symbol (✏️) oben rechts
3. Nehmen Sie Ihre Änderungen vor
4. Scrollen Sie nach unten zu "Commit changes"

## Teammitglieder bearbeiten

**Datei:** `_data/team.yml`

### Neues Teammitglied hinzufügen:
```yaml
- name: "Max Mustermann"
  role: "Position/Titel"
  image: "/assets/images/team/max.png"
  expertise:
    - "Fachgebiet 1"
    - "Fachgebiet 2" 
    - "Fachgebiet 3"
  email: "max.mustermann@bielefeld.de"
  animation_delay: 0.7
```

### Wichtige Hinweise:
- **Bild hochladen:** Laden Sie das Teamfoto in `assets/images/team/` hoch
- **Animation Delay:** Erhöhen Sie den Wert um 0.1 für jedes neue Mitglied
- **Format:** Halten Sie sich genau an die Struktur (Einrückungen beachten!)

### Teammitglied bearbeiten:
Finden Sie den entsprechenden Eintrag und ändern Sie die gewünschten Felder.

## Events anlegen

**Datei:** `_data/events.yml`

### Neues Event hinzufügen:
```yaml
- title: "Titel des Events"
  description: "Beschreibung des Events..."
  date: "2025-08-15"
  time: "18:00"
  duration: "2 Stunden"
  location: "Innovation Office, Niederwall 23"
  category: "Workshop"  # oder "Vortrag", "Meetup", etc.
  icon: "/assets/images/icons/workshop.svg"
  target_audience: "Alle Bürger*innen"
  cost: "Kostenlos"
  booking_url: "https://pretix.eu/..."  # Optional
  featured: true  # oder false
```

### Verfügbare Icons:
- `/assets/images/icons/workshop.svg`
- `/assets/images/icons/presentation.svg`
- `/assets/images/icons/dialog.svg`
- `/assets/images/icons/data.svg`
- `/assets/images/icons/hackathon.svg`
- `/assets/images/icons/startup.svg`

### Event ausblenden:
Setzen Sie `#` vor jede Zeile des Events (siehe auskommentiertes Beispiel in der Datei).

## Blog-Beiträge schreiben

**Verzeichnis:** `_beitraege/`

### Neuen Beitrag erstellen:
1. Erstellen Sie eine neue Datei: `dateiname.md` (z.B. `mein-neuer-beitrag.md`)
2. Verwenden Sie folgende Vorlage:

```markdown
---
title: "Titel des Beitrags"
teaser: "Kurze Zusammenfassung für die Übersicht (1-2 Sätze)"
author: "Ihr Name"
category: "Tools"  # oder "Events", "Projekte", etc.
date: 2025-07-24
header_image: "/assets/images/bildname.png"  # Optional
---

## Hauptüberschrift

Hier beginnt Ihr Beitrag...

### Unterüberschrift

Weiterer Text...
```

### Praktischer Tipp:
**Vorlage kopieren:** Öffnen Sie `_beitraege/diese-website-wurde-mit-ki-erstellt.md`, kopieren Sie den Inhalt und passen Sie ihn für Ihren neuen Beitrag an.

## Markdown Grundlagen

Markdown ist eine einfache Formatierungssprache:

```markdown
# Hauptüberschrift
## Unterüberschrift  
### Kleine Überschrift

**Fett gedruckt**
*Kursiv*

- Aufzählungspunkt 1
- Aufzählungspunkt 2

1. Nummerierte Liste
2. Zweiter Punkt

[Link Text](https://example.com)

![Bildtext](/assets/images/bild.png)

> Zitat oder wichtiger Hinweis
```

**Ausführliche Referenz:** [Markdown Cheat Sheet](https://www.markdownguide.org/cheat-sheet/)

## Bilder hochladen

**Verzeichnis:** `assets/images/`

### Bildempfehlungen:
- **Teamfotos:** 400x400 Pixel, quadratisch, PNG/JPG
- **Header-Bilder:** 1200x600 Pixel, PNG/JPG
- **Event-Icons:** Nutzen Sie die vorhandenen SVG-Icons
- **Maximale Dateigröße:** 500 KB pro Bild

### Upload-Prozess:
1. Navigieren Sie zu `assets/images/`
2. Wählen Sie das passende Unterverzeichnis (`team/` für Teamfotos)
3. Klicken Sie "Add file" → "Upload files"
4. Ziehen Sie Ihre Bilder in das Upload-Feld
5. Committen Sie die Änderungen

## Arbeitsweisen

### Schneller Weg (Direkt committen):
1. Datei bearbeiten
2. Bei "Commit changes" einen aussagekräftigen Titel eingeben
3. "Commit directly to the main branch" wählen
4. "Commit changes" klicken
✅ **Änderungen sind sofort live!**

### Sicherer Weg (Pull Request):
1. Datei bearbeiten  
2. Bei "Commit changes" einen aussagekräftigen Titel eingeben
3. "Create a new branch" wählen
4. "Propose changes" klicken
5. "Create pull request" klicken
6. Warten auf Review und Freigabe
✅ **Änderungen werden erst nach Review veröffentlicht**

## Praktische Tipps

### ✅ Dos:
- **Immer Vorlagen kopieren** und anpassen statt von null anfangen
- **Aussagekräftige Commit-Nachrichten** schreiben ("Team: Lisa Meyer hinzugefügt")
- **Preview verwenden:** GitHub zeigt Ihnen eine Vorschau der Markdown-Formatierung
- **Kleine Schritte:** Lieber mehrere kleine Änderungen als eine große

### ❌ Don'ts:
- **Nie mehrere Dateien gleichzeitig** stark verändern
- **Struktur nicht ändern:** Einrückungen und Format beibehalten
- **Keine Sonderzeichen** in Dateinamen (nutzen Sie Bindestriche)

### Häufige Fehler vermeiden:
- **YAML-Syntax:** Achten Sie auf korrekte Einrückungen in `.yml`-Dateien
- **Datums-Format:** Immer `YYYY-MM-DD` verwenden (z.B. `2025-07-24`)
- **Anführungszeichen:** Bei Texten mit Sonderzeichen Anführungszeichen verwenden

## Checkliste vor dem Veröffentlichen

- [ ] Rechtschreibung und Grammatik geprüft
- [ ] Alle Links funktionieren
- [ ] Bilder sind hochgeladen und korrekt verlinkt
- [ ] Datum im korrekten Format
- [ ] E-Mail-Adressen sind korrekt
- [ ] Aussagekräftige Commit-Nachricht geschrieben

## Bei Problemen

1. **Syntax-Fehler:** Vergleichen Sie Ihre Einträge mit funktionierenden Beispielen
2. **Bilder werden nicht angezeigt:** Prüfen Sie den Pfad und ob die Datei hochgeladen wurde
3. **Website lädt nicht:** Warten Sie 2-3 Minuten - GitHub braucht Zeit zum Veröffentlichen

**Technische Hilfe:** Wenden Sie sich an Jens Edler (jens.edler@bielefeld.de)

---

*Erstellt: Juli 2025 | Version 1.0*