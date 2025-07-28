# Redaktionsleitfaden - OIC Bielefeld Website

Dieser Leitfaden erklärt, wie du Inhalte auf der OIC Bielefeld Website bearbeiten kannst. Die Website wird über GitHub verwaltet - keine Sorge, das ist einfacher als es klingt!

## Übersicht: Wie funktioniert die Website?

Die Website basiert auf Jekyll und nutzt strukturierte Daten:
- **Teammitglieder** werden in `_data/team.yml` verwaltet
- **Events** werden in `_data/events.yml` verwaltet  
- **Blog-Beiträge** werden als Markdown-Dateien in `_beitraege/` gespeichert

Alle Änderungen werden über GitHub gemacht und automatisch auf der Website veröffentlicht.

## GitHub Grundlagen

### Anmelden und Navigieren
1. Gehe zu https://github.com/jensedler/oic-bielefeld-website
2. Melde dich mit deinem GitHub-Account an
3. Du siehst die Verzeichnisstruktur der Website

### Dateien bearbeiten
1. Klicke auf eine Datei, um sie zu öffnen
2. Klicke auf das Stift-Symbol (✏️) oben rechts
3. Nimm deine Änderungen vor
4. Scrolle nach unten zu "Commit changes"

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
- **Bild hochladen:** Lade das Teamfoto in `assets/images/team/` hoch
- **Animation Delay:** Erhöhe den Wert um 0.1 für jedes neue Mitglied
- **Format:** Halte dich genau an die Struktur (Einrückungen beachten!)

### Teammitglied bearbeiten:
Finde den entsprechenden Eintrag und ändere die gewünschten Felder.

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
Setze `#` vor jede Zeile des Events (siehe auskommentiertes Beispiel in der Datei).

## Blog-Beiträge schreiben

**Verzeichnis:** `_beitraege/`

### Neuen Beitrag erstellen:
1. Erstelle eine neue Datei: `dateiname.md` (z.B. `mein-neuer-beitrag.md`)
2. Verwende folgende Vorlage:

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
**Vorlage kopieren:** Öffne `_beitraege/diese-website-wurde-mit-ki-erstellt.md`, kopiere den Inhalt und passe ihn für deinen neuen Beitrag an.

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

## Bildergalerien erstellen

**Neu seit Januar 2025:** Du kannst jetzt einfach Bildergalerien in Blog-Beiträgen einbinden!

### Galerie-Syntax:
```markdown
{% gallery %}
/assets/images/folder/bild1.jpg | Beschreibung für Bild 1
/assets/images/folder/bild2.jpg | Beschreibung für Bild 2  
/assets/images/folder/bild3.jpg
{% endgallery %}
```

### Wichtige Hinweise:
- **Beschreibungen sind optional:** Mit `|` kannst du Bildunterschriften hinzufügen
- **Bilder hochladen:** Lade alle Bilder zuerst in `assets/images/` hoch
- **Pfade kopieren:** Rechtsklick auf das Bild → "Link kopieren" für den korrekten Pfad

### Galerie-Features:
- **Automatisches Layout:** Pinterest-ähnliche Anordnung der Thumbnails
- **Lightbox-Navigation:** Klick auf Bild öffnet Vollansicht mit Pfeilen
- **Responsive:** Passt sich an Handy, Tablet und Desktop an
- **Touch-Unterstützung:** Wischen zwischen Bildern auf Mobilgeräten

### Beispiel einer Event-Galerie:
```markdown
Hier sind Impressionen von unserem Workshop:

{% gallery %}
/assets/images/events/workshop-2025/eröffnung.jpg | Begrüßung der Teilnehmer*innen
/assets/images/events/workshop-2025/gruppenarbeit.jpg | Intensive Diskussionen in Kleingruppen
/assets/images/events/workshop-2025/präsentation.jpg | Vorstellung der Ergebnisse
/assets/images/events/workshop-2025/networking.jpg
{% endgallery %}
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
1. Navigiere zu `assets/images/`
2. Wähle das passende Unterverzeichnis (`team/` für Teamfotos)
3. Klicke "Add file" → "Upload files"
4. Ziehe deine Bilder in das Upload-Feld
5. Committe die Änderungen

### Neue Ordner für Bilder erstellen:
1. Navigiere zu `assets/images/`
2. Klicke "Create new file"
3. Gib ein: `neuer-ordner/platzhalterdatei.md`
   - GitHub erstellt automatisch den Ordner "neuer-ordner"
   - Die Platzhalterdatei kannst du später löschen
4. Klicke "Commit new file"
5. **Jetzt kannst du Bilder in den neuen Ordner hochladen:**
   - Gehe in den neuen Ordner
   - "Add file" → "Upload files"
   - Nach dem Upload die Platzhalterdatei löschen

### Empfohlene Ordnerstruktur:
```
assets/images/
├── team/          # Teamfotos
├── events/        # Event-Bilder und Galerien
├── projekte/      # Projekt-Screenshots
├── blog/          # Blog-Header-Bilder
└── icons/         # Icons (bereits vorhanden)
```

### Tipp für Event-Galerien:
Erstelle Unterordner für jedes Event:
```
assets/images/events/
├── workshop-2025-01/
│   ├── foto1.jpg
│   ├── foto2.jpg
│   └── foto3.jpg
├── hackathon-2025/
└── innovation-meetup-feb/
```

## Arbeitsweisen

### Schneller Weg (Direkt committen):
1. Datei bearbeiten
2. Bei "Commit changes" einen aussagekräftigen Titel eingeben
3. "Commit directly to the main branch" wählen
4. "Commit changes" klicken
✅ **Änderungen sind sofort live!**

### Sicherer Weg (Pull Request):

#### Für Redakteurinnen (Änderungen vorschlagen):
1. Datei bearbeiten  
2. Bei "Commit changes" einen aussagekräftigen Titel eingeben
3. "Create a new branch" wählen
4. "Propose changes" klicken
5. "Create pull request" klicken
6. **Reviewerin informieren:** Schicke den Link zum Pull Request an die zuständige Person

#### Für Reviewerinnen (Änderungen prüfen und freigeben):
1. **Pull Request öffnen:** Klicke auf den Link oder gehe zu "Pull requests" im Repository
2. **Änderungen prüfen:** 
   - Klicke auf "Files changed" um zu sehen, was geändert wurde
   - Grüne Zeilen = neu hinzugefügt, rote Zeilen = gelöscht
   - Prüfe Rechtschreibung, Inhalt und Format
3. **Kommentare hinterlassen:** Bei Fragen oder Anmerkungen klicke auf die Zeilennummer und schreibe einen Kommentar
4. **Freigeben oder Änderungen anfordern:**
   - ✅ **Freigeben:** "Review changes" → "Approve" → "Submit review"
   - ❌ **Änderungen nötig:** "Review changes" → "Request changes" → Begründung schreiben → "Submit review"
5. **Merge (Veröffentlichen):** Nach Freigabe klicke "Merge pull request" → "Confirm merge"
6. **Aufräumen:** "Delete branch" klicken (der temporäre Branch wird nicht mehr gebraucht)

✅ **Änderungen werden erst nach Review und Merge veröffentlicht**

## Pull Request Workflow im Team

### Rollen definieren:
- **Redakteurinnen:** Sarah, Lisa, Maria, Tatjana (erstellen Inhalte)
- **Reviewer:** Jens, Stephan (prüfen und geben frei)

### Wann welchen Workflow nutzen?
- **Kleine Korrekturen** (Tippfehler, E-Mail ändern): Direkter Weg
- **Neue Inhalte** (Blog-Posts, Events, neue Teammitglieder): Pull Request
- **Bei Unsicherheit:** Immer Pull Request verwenden

### Kommunikation:
- Pull Request Link per E-Mail/Slack an Reviewer senden
- Bei dringenden Änderungen explizit erwähnen
- Reviewerin antwortet innerhalb von 24h (Werktage)

## Praktische Tipps

### ✅ Dos:
- **Immer Vorlagen kopieren** und anpassen statt von null anfangen
- **Aussagekräftige Commit-Nachrichten** schreiben ("Team: Lisa Meyer hinzugefügt")
- **Preview verwenden:** GitHub zeigt dir eine Vorschau der Markdown-Formatierung
- **Kleine Schritte:** Lieber mehrere kleine Änderungen als eine große

### ❌ Don'ts:
- **Nie mehrere Dateien gleichzeitig** stark verändern
- **Struktur nicht ändern:** Einrückungen und Format beibehalten
- **Keine Sonderzeichen** in Dateinamen (nutzen Sie Bindestriche)

### Häufige Fehler vermeiden:
- **YAML-Syntax:** Achte auf korrekte Einrückungen in `.yml`-Dateien
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

1. **Syntax-Fehler:** Vergleiche deine Einträge mit funktionierenden Beispielen
2. **Bilder werden nicht angezeigt:** Prüfe den Pfad und ob die Datei hochgeladen wurde
3. **Website lädt nicht:** Warte 2-3 Minuten - GitHub braucht Zeit zum Veröffentlichen

**Technische Hilfe:** Wende dich an Jens (jens.edler@bielefeld.de)

---

## Rollen und Zuständigkeiten

### Redakteurinnen:
- **Sarah:** Events und Innovationsthemen
- **Lisa:** Office-Updates und allgemeine Inhalte  
- **Maria:** Community und Partnerschaften
- **Tatjana:** Smart City und Technologie-Posts

### Reviewer/Admins:
- **Jens:** Hauptverantwortlicher, finale Freigaben
- **Stephan:** Technische Reviews, bei Jens' Abwesenheit

### Eskalation:
Bei technischen Problemen oder Konflikten: jens.edler@bielefeld.de

---

*Erstellt: Juli 2025 | Version 1.1*