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
  target_audience: "Alle Bürger*innen"
  cost: "Kostenlos"
  booking_url: "https://pretix.eu/..."  # Optional
  link_text: "Jetzt anmelden"  # Optional, Button-Text anpassen
  featured: true  # oder false
  topic: "ki-zivilgesellschaft"  # Optional, für thematische Seiten
```

### Button-Text anpassen:
Mit dem `link_text` Parameter kannst du den Text auf dem Anmelde-Button individuell gestalten:
- **Standard:** Wenn kein `link_text` angegeben ist, steht "Anmelden" auf dem Button
- **Individuell:** Du kannst jeden beliebigen Text verwenden, z.B.:
  - `link_text: "Jetzt anmelden"`
  - `link_text: "Mehr erfahren"`
  - `link_text: "Tickets sichern"`
  - `link_text: "Teilnehmen"`

**Hinweis:** Die Icon-Zeile wurde aus der Event-Struktur entfernt. Die SVG-Icons werden nicht mehr in den Event-Kacheln verwendet.

### Thematische Event-Gruppierung (Topic):
Mit dem `topic`-Parameter kannst du Events thematisch gruppieren für spezialisierte Landing-Pages:

**Verfügbare Topics:**
- `"ki-zivilgesellschaft"`: Für KI und Zivilgesellschaft Events (erscheinen auf `/ki/`)
- `"digitalisierung"`: Für Digitalisierungs-Events  
- `"innovation"`: Für Innovations-Workshops

**Wichtige Hinweise:**
- **Optional:** Events ohne Topic erscheinen auf der Haupt-Events-Seite
- **Mit Topic:** Events erscheinen sowohl auf der Haupt-Seite als auch auf der thematischen Seite
- **Vergangene Events:** Werden automatisch in einem separaten "Erfolgreiche MeetUps" Bereich angezeigt
- **Neue Topics:** Können für zukünftige Landing-Pages hinzugefügt werden

**Beispiel KI-Event:**
```yaml
- title: "KI Workshop für Vereine"
  description: "Lerne, wie KI deine Vereinsarbeit unterstützen kann"
  date: "2025-09-15"
  # ... andere Felder ...
  topic: "ki-zivilgesellschaft"  # Erscheint auf /ki/
```

### Event ausblenden:
Setze `#` vor jede Zeile des Events (siehe auskommentiertes Beispiel in der Datei).

## Blog-Beiträge schreiben

**Verzeichnis:** `_beitraege/`

### Neuen Beitrag erstellen:
1. Erstelle eine neue Datei: `dateiname.md` (z.B. `mein-neuer-beitrag.md`)
2. Benutze für den Dateinamen nut Kleinschreibung. Statt Leerzeiche bitte Bindestriche benutzen.
3. Verwende folgende Vorlage:

```markdown
---
title: "Titel des Beitrags"
teaser: "Kurze Zusammenfassung für die Übersicht (1-2 Sätze)"
authors:
  - "Ihr Name"
categories:
  - "Tools"  # oder "Events", "Projekte", etc. (siehe Abschnitt "Kategorien zuweisen")
date: 2025-07-24
header_image: "/assets/images/bildname.png"  # Optional
header_image_credit: "© Fotograf Name / Quelle"  # Optional
---

## Hauptüberschrift

Hier beginnt Ihr Beitrag...

### Unterüberschrift

Weiterer Text...
```

### Autor:innen angeben

Für neue Beiträge bitte `authors` verwenden (genau wie bei `categories` als Liste):

**Eine Autorin oder ein Autor:**
```yaml
authors:
  - "Maria Gonçalves"
```

**Mehrere Autor:innen:**
```yaml
authors:
  - "Maria Gonçalves"
  - "Jens Edler"
```

**Kompatibilität für ältere Beiträge:**
`author: "Name"` funktioniert weiterhin als Fallback.

**Wichtige Hinweise:**
- Die Namen müssen exakt mit den Namen in `_data/team.yml` übereinstimmen
- Bei mehreren Autor:innen werden auf der Beitragsseite automatisch mehrere Autor-Karten angezeigt
- In der Beitragsübersicht werden mehrere Namen als `Autor:innen` angezeigt

### Kategorien zuweisen

Jeder Beitrag sollte mindestens eine Kategorie haben. Die Kategorie erscheint als Tag auf der Beitragskarte und kann auf der Beitragsseite (`/beitraege/`) gefiltert werden.

Kategorien werden immer als Liste angegeben – auch bei nur einer Kategorie:

**Eine Kategorie:**
```yaml
categories:
  - "Events"
```

**Mehrere Kategorien:**
Wenn ein Beitrag zu mehreren Themen passt, füge einfach weitere Einträge hinzu:
```yaml
categories:
  - "Netzwerk"
  - "Open Innovation City"
```

**Wichtige Hinweise:**
- Beiträge mit mehreren Kategorien werden bei **jeder** ihrer Kategorien im Filter angezeigt
- Auf der Beitragskarte werden bei mehreren Kategorien alle als separate Tags angezeigt
- Verwende möglichst bestehende Kategorien, damit die Filter übersichtlich bleiben

**Verfügbare Kategorien:**
- `"Events"` – Veranstaltungen und Event-Ankündigungen
- `"KI und Zivilgesellschaft"` – Beiträge zur KI-Reihe
- `"Tools"` – Tool-Vorstellungen und Anleitungen
- `"Projekte"` – Projektvorstellungen und -updates
- `"Open Innovation City"` – Beiträge zum OIC-Programm
- `"Netzwerk"` – Netzwerk-Themen und Kooperationen
- `"Formate"` – Unsere Veranstaltungsformate
- `"Innovationszirkel"` – Beiträge zum Innovationszirkel
- `"Open Innovation Hour"` – Beiträge zur Open Innovation Hour
- `"Rückblick"` – Rückblicke und Jahresberichte

**Neue Kategorien** können jederzeit vergeben werden – sie erscheinen automatisch als neuer Filter-Button auf der Beitragsseite.

**Filter-Links teilen:**
Du kannst einen direkten Link zu einer gefilterten Ansicht teilen, z.B.:
`https://oic-bielefeld.de/beitraege/?filter=events`

Der Filter-Wert ist der Kategoriename in Kleinbuchstaben mit Bindestrichen statt Leerzeichen (z.B. `ki-und-zivilgesellschaft`).

### Header-Bild mit Copyright-Hinweis

**Neu seit Januar 2025:** Du kannst jetzt eine Quellenangabe für Header-Bilder hinzufügen!

Der Copyright-Hinweis erscheint dezent in der unteren rechten Ecke des Header-Bilds.

**Einfache Quellenangabe:**
```yaml
header_image_credit: "© Max Mustermann"
```

**Mit Link (z.B. zu Unsplash):**
```yaml
header_image_credit: "© [Max Mustermann](https://unsplash.com/@max) / Unsplash"
```

**Wichtige Hinweise:**
- Der Copyright-Hinweis ist **optional** - nur angeben wenn nötig
- Links werden in Markdown-Syntax geschrieben: `[Linktext](URL)`
- Der Hinweis passt sich automatisch an mobile Geräte an

### Praktischer Tipp:
**Vorlage kopieren:** Öffne `_beitraege/diese-website-wurde-mit-ki-erstellt.md`, kopiere den Inhalt und passe ihn für deinen neuen Beitrag an.

### Event-Ankündigungen und Rückschauen verknüpfen

**Neu seit Oktober 2025:** Du kannst Event-Ankündigungen und Rückschauen elegant miteinander verknüpfen, ohne die Beitragsübersicht zu überladen!

#### Workflow für Event-Beiträge:

**1. Event-Ankündigung erstellen:**
Erstelle wie gewohnt einen Beitrag zur Event-Ankündigung:
```markdown
---
title: "KI Workshop für Vereine"
teaser: "Lerne, wie KI deine Vereinsarbeit unterstützen kann"
author: "Sarah Mueller"
category: "Events"
date: 2025-08-15
---

Details zum Event, Anmeldeformular, etc.
```

**2. Nach dem Event: Rückschau erstellen:**
Erstelle einen neuen Beitrag mit dem Suffix "-rueckschau":
```markdown
---
title: "KI Workshop für Vereine - Rückschau"
teaser: "Ein inspirierender Abend mit vielen praktischen Einblicken"
author: "Sarah Mueller"
category: "Events"
date: 2025-08-20
related_post: "ki-workshop-vereine"
is_retrospective: true
---

Rückblick auf das Event, Bilder, Zusammenfassung, etc.
```

**3. Verknüpfung herstellen:**
Füge im **Original-Beitrag** (Ankündigung) folgende Zeile hinzu:
```yaml
retrospective_post: "ki-workshop-vereine-rueckschau"
```

#### Wichtige Parameter:

- **`is_retrospective: true`**: Markiert den Beitrag als Rückschau
  - Rückschauen erscheinen **nicht** in der Beitragsübersicht `/beitraege/`
  - Sie sind nur über die Verlinkung oder direkte URL erreichbar

- **`related_post: "dateiname"`**: Verlinkt zurück zur Ankündigung
  - Zeigt automatisch ein Banner "📅 Event-Ankündigung" mit Link

- **`retrospective_post: "dateiname"`**: Verlinkt zur Rückschau
  - Zeigt automatisch ein Banner "📸 Event-Rückschau verfügbar" mit Link

#### Vollständiges Beispiel:

**Event-Ankündigung** (`ki-workshop-vereine.md`):
```markdown
---
title: "KI Workshop für Vereine"
teaser: "Lerne, wie KI deine Vereinsarbeit unterstützen kann"
author: "Sarah Mueller"
category: "Events"
date: 2025-08-15
retrospective_post: "ki-workshop-vereine-rueckschau"
---

## Workshop Details
Am 15. August veranstalten wir...

{% include pretix-widget.html event="ki-workshop" %}
```

**Event-Rückschau** (`ki-workshop-vereine-rueckschau.md`):
```markdown
---
title: "KI Workshop für Vereine - Rückschau"
teaser: "Ein inspirierender Abend mit vielen praktischen Einblicken"
author: "Sarah Mueller"
category: "Events"
date: 2025-08-20
related_post: "ki-workshop-vereine"
is_retrospective: true
---

## Highlights des Abends
Der Workshop war ein voller Erfolg...

{% include gallery.html
   images="workshop1.jpg|Teilnehmende bei der Arbeit,workshop2.jpg|Präsentation der Ergebnisse"
   folder="/assets/images/events/ki-workshop/" %}
```

#### Vorteile:

✅ **Übersichtliche Beitragsseite**: Nur Ankündigungen erscheinen in der Liste
✅ **Keine verlorenen Inhalte**: Rückschauen sind über Banner und URL erreichbar
✅ **Automatische Banner**: Bidirektionale Verlinkung wird automatisch angezeigt
✅ **Flexibel**: Du entscheidest, für welche Events du Rückschauen erstellst

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

![Alt-Text](/assets/images/bild.png)
![Alt-Text](/assets/images/bild.png "Bildunterschrift für das Bild")

> Zitat oder wichtiger Hinweis
```

### Silbentrennung bei langen Wörtern steuern
Bei langen Wörtern wie z.B. Passantenfrequenzmessung kann es vorkommen, dass diese zu lang für die vollständige Darstellung sind. Mit dem HTML-Schnipsel `&shy;` könnt ihr vorgeben, an welcher Stelle ein Wort mit Bindestrich umgebrochen werden kann. Dazu muss der HTML-Schnipsel an die gewünschte Stelle im Wort eingesetzt werden. Das Wort wird dann im Bedarfsfall automatisch getrennt.

#### Praktisches Beispiel:
```markdown
Passanten&shy;frequenz&shy;messung
```

## Bilder einfügne

### Bilder ohne Bildunterschrift:
```markdown
![Alt-Text für Barrierefreiheit](/assets/images/mein-bild.jpg)
```

### Bilder mit Bildunterschrift:
```markdown
![Alt-Text für Barrierefreiheit](/assets/images/mein-bild.jpg "Diese Bildunterschrift wird angezeigt")
```

**Wichtige Hinweise:**
- **Alt-Text** (zwischen `[]`): Für Barrierefreiheit und Screenreader - kurze Beschreibung des Bildinhalts
- **Bildunterschrift** (zwischen `""`): Wird als sichtbare Bildunterschrift unter dem Bild angezeigt
- **Lightbox**: Beim Klick auf das Bild wird die Bildunterschrift auch in der vergrößerten Ansicht gezeigt
- **Optional**: Wenn keine Bildunterschrift gewünscht ist, einfach den Teil mit `"..."` weglassen

### Praktisches Beispiel:
```markdown
![Teilnehmer*innen beim Workshop](/assets/images/workshop-2025.jpg "Intensive Diskussionen in der Gruppenarbeitsphase")
```

**Ergebnis:**
- Das Bild wird normal angezeigt
- Darunter erscheint kursiv: *"Intensive Diskussionen in der Gruppenarbeitsphase"*  
- In der Lightbox (vergrößerte Ansicht) wird dieselbe Bildunterschrift angezeigt

## Bildergalerien erstellen

**Neu seit Januar 2025:** Du kannst jetzt einfach Bildergalerien in Blog-Beiträgen einbinden!

### Galerie-Syntax:

**Option 1: Automatisch (alle Bilder aus Ordner)** ⭐ Empfohlen für viele Bilder
```markdown
{% include gallery.html folder="/assets/images/events/workshop-2025/" %}
```

**Option 2: Manuell (spezifische Bilder mit Beschreibungen)**
```markdown
{% include gallery.html
   images="bild1.jpg|Beschreibung 1,bild2.jpg|Beschreibung 2,bild3.jpg"
   folder="/assets/images/events/workshop-2025/" %}
```

**Parameter:**
- `folder`: **Pflichtfeld** - Pfad zum Ordner mit den Bildern
- `images`: Optional - Komma-getrennte Liste von Dateinamen mit optionalen Beschreibungen (getrennt durch `|`)

### Automatischer Modus (neu seit Oktober 2025):
Wenn du **nur den Ordner** angibst, werden automatisch **alle Bilder** aus diesem Ordner geladen:
- ✅ **Einfacher:** Nur Ordner-Pfad angeben, fertig!
- ✅ **Keine Liste:** Bildnamen müssen nicht aufgezählt werden
- ✅ **Sortierung:** Bilder werden alphabetisch sortiert
- 💡 **Tipp:** Nummeriere Dateien für gewünschte Reihenfolge: `01-eröffnung.jpg`, `02-workshop.jpg` etc.

### Manueller Modus (klassisch):
Wenn du **spezifische Bilder** auswählst oder **individuelle Beschreibungen** brauchst:
- ✅ **Kontrolle:** Du bestimmst exakt, welche Bilder erscheinen
- ✅ **Bildunterschriften:** Individuelle Beschreibungen mit `|` Trenner
- ✅ **Reihenfolge:** Bilder erscheinen in der angegebenen Reihenfolge

### Wichtige Hinweise:
- **Bildunterschriften automatisch:** Ohne Beschreibungen werden Dateinamen als Caption genutzt (`workshop-raum.jpg` → "Workshop raum")
- **Bilder hochladen:** Lade alle Bilder zuerst in `assets/images/` hoch
- **Pfade kopieren:** Rechtsklick auf das Bild → "Link kopieren" für den korrekten Pfad
- **Mehrere Galerien:** Du kannst mehrere Galerien auf einer Seite einbinden - jede wird separat in der Lightbox angezeigt

### Galerie-Features:
- **Automatisches Layout:** Pinterest-ähnliche Anordnung der Thumbnails
- **Lightbox-Navigation:** Klick auf Bild öffnet Vollansicht mit Pfeilen
- **Responsive:** Passt sich an Handy, Tablet und Desktop an
- **Touch-Unterstützung:** Wischen zwischen Bildern auf Mobilgeräten

### Beispiel einer Event-Galerie:

**Automatisch (alle Bilder aus Ordner):**
```markdown
Hier sind Impressionen von unserem Workshop:

{% include gallery.html folder="/assets/images/events/workshop-2025/" %}
```

**Manuell (mit individuellen Beschreibungen):**
```markdown
Hier sind Impressionen von unserem Workshop:

{% include gallery.html
   images="eröffnung.jpg|Begrüßung der Teilnehmer*innen,gruppenarbeit.jpg|Intensive Diskussionen in Kleingruppen,präsentation.jpg|Vorstellung der Ergebnisse,networking.jpg"
   folder="/assets/images/events/workshop-2025/" %}
```

**Mehrere Galerien auf einer Seite:**
```markdown
## Vormittagssession

{% include gallery.html folder="/assets/images/events/workshop-2025/vormittag/" %}

## Nachmittagssession

{% include gallery.html folder="/assets/images/events/workshop-2025/nachmittag/" %}
```
👉 Jede Galerie wird in der Lightbox separat behandelt - keine Vermischung!

## Event-Anmeldungen einbinden (Pretix-Widgets)

**Neu seit Juli 2025:** Du kannst jetzt Anmeldeformulare direkt in Blog-Beiträge einbinden!

### Widget-Syntax:
```markdown
{% include pretix-widget.html event="ki-zivil-4" %}
```

### Erweiterte Optionen:
```markdown
{% include pretix-widget.html event="ki-zivil-4" items="123,124" voucher="GUTSCHEIN2025" %}
```

**Parameter:**
- `event`: **Pflichtfeld** - Name des Events in Pretix (z.B. "ki-zivil-4")
- `items`: Optional - Spezifische Ticket-IDs anzeigen (komma-getrennt)
- `voucher`: Optional - Gutschein-Code vorausfüllen
- `disable-vouchers`: Optional - Gutschein-Eingabe verstecken (Wert: "true")

### Event-Namen herausfinden:
1. Gehe zu deinem Event in Pretix (https://pretix.eu/OIC-BIE/)
2. Die URL zeigt den Event-Namen: `https://pretix.eu/OIC-BIE/ki-workshop-2025/`
3. **Event-Name:** `ki-workshop-2025`

### Praktisches Beispiel:
```markdown
---
title: "KI Workshop für die Zivilgesellschaft"
teaser: "Lerne, wie künstliche Intelligenz deine Vereinsarbeit unterstützen kann"
author: "Sarah Mueller"
category: "Events"
date: 2025-08-15
---

## Workshop Details

Am 15. August 2025 veranstalten wir einen spannenden Workshop zum Thema "KI in der Zivilgesellschaft". 

### Anmeldung

Melde dich jetzt direkt an:

{% include pretix-widget.html event="ki-zivil-4" %}

### Weitere Informationen

Der Workshop findet im Innovation Office statt...
```

### Widget-Features:
- **Direkte Anmeldung** ohne Weiterleitung zu externer Seite
- **Automatisch responsive** für Handy, Tablet und Desktop
- **Deutsche Übersetzung** bereits eingebaut
- **Sichere Bezahlung** über Pretix-System
- **Konsistentes Design** passend zur Website

### Wichtige Hinweise:
- **Nur bei Bedarf:** Das Widget lädt nur CSS/JS wenn es verwendet wird
- **Keine Konfiguration nötig:** Funktioniert sofort nach Einbindung
- **Kompatibel mit Galerien:** Kann mit Bildergalerien kombiniert werden
- **Mobile-optimiert:** Funktioniert einwandfrei auf allen Geräten

## Zitate einbinden

Du kannst stilvolle Zitate in Blog-Beiträge einbinden. Das Zitat wird in einer hervorgehobenen Box mit großem Anführungszeichen angezeigt.

### Zitat-Syntax:
```markdown
{% include quote.html
   text="Der Zitat-Text kommt hier rein."
   author="Name des Urhebers" %}
```

**Parameter:**
- `text`: **Pflichtfeld** - Der Text des Zitats
- `author`: Optional - Name der Person oder Quelle (z.B. "Albert Einstein" oder "Frei nach Douglas Adams")

### Praktisches Beispiel:
```markdown
---
title: "Innovation und Kreativität"
author: "Maria Schmidt"
category: "Insights"
date: 2025-10-20
---

## Die Kraft der Innovation

Innovation beginnt oft mit einem einfachen Gedanken.

{% include quote.html
   text="Innovation unterscheidet zwischen einem Anführer und einem Verfolger."
   author="Steve Jobs" %}

In diesem Artikel schauen wir uns an, wie...
```

### Design-Features:
- **Hervorgehobene Box:** Weißer Hintergrund mit Schatten und blauem Akzent
- **Großes Anführungszeichen:** Türkisfarbenes dekoratives Element
- **Kursiver Text:** Elegant formatierter Zitattext
- **Quellenangabe:** Rechtsbündig unter dem Zitat (optional)
- **Responsive:** Passt sich an alle Bildschirmgrößen an

### Wichtige Hinweise:
- **Anführungszeichen nicht nötig:** Das große dekorative Anführungszeichen wird automatisch hinzugefügt
- **Längere Zitate:** Funktioniert auch für mehrzeilige Zitate
- **Ohne Urheber:** Lasse `author` einfach weg, wenn die Quelle unbekannt ist

**Beispiel ohne Urheber:**
```markdown
{% include quote.html
   text="Die beste Zeit, einen Baum zu pflanzen, war vor 20 Jahren. Die zweitbeste Zeit ist jetzt." %}
```

## CTA-Buttons einbinden

Du kannst auffällige Call-to-Action-Buttons in Blog-Beiträge einfügen - zum Beispiel für Downloads, externe Links oder Anmeldungen. Der Button sieht genauso aus wie auf der Startseite (gelb-grüner Gradient mit Hover-Animation).

### Button-Syntax:

**Einfacher Button:**
```markdown
{% include cta-button.html text="Zum Projekt" url="https://example.com" %}
```

**Download-Button (mit Download-Icon):**
```markdown
{% include cta-button.html text="PDF herunterladen" url="/assets/downloads/datei.pdf" download=true %}
```

**Button öffnet neuen Tab:**
```markdown
{% include cta-button.html text="Externe Seite besuchen" url="https://example.com" new_tab=true %}
```

**Parameter:**
- `text`: **Pflichtfeld** - Text auf dem Button
- `url`: **Pflichtfeld** - Linkziel (interner Pfad oder externe URL)
- `download`: Optional - Zeigt ein Download-Icon und löst den Browser-Download aus
- `new_tab`: Optional - Öffnet den Link in einem neuen Tab

### Praktisches Beispiel:
```markdown
---
title: "Handreichung Wirkungsorientierung"
author: "Maria Gonçalves"
category: "Methoden"
date: 2026-01-28
---

## Unsere Handreichung

Die Handreichung bietet eine praxisnahe Einführung...

{% include cta-button.html text="Download Handreichung" url="/assets/downloads/handreichung.pdf" download=true %}

{% include cta-button.html text="Download Anhang" url="/assets/downloads/anhang.docx" download=true %}
```

### Design-Features:
- **Gelb-grüner Gradient:** Gleicher Look wie auf der Startseite
- **Hover-Animation:** Button vergrößert sich leicht und leuchtet auf
- **Download-Icon:** Wird automatisch bei `download=true` angezeigt
- **Zentriert:** Button wird automatisch mittig dargestellt
- **Responsive:** Passt sich an alle Bildschirmgrößen an

### Wichtige Hinweise:
- **Sparsam einsetzen:** CTA-Buttons sind Blickfänger - nicht zu viele pro Beitrag verwenden
- **Klarer Text:** Der Button-Text sollte die Aktion beschreiben ("PDF herunterladen", "Jetzt anmelden")
- **Download-Dateien:** Müssen vorher in `assets/downloads/` hochgeladen werden
- **Kombination möglich:** Kann mit Galerien, Zitaten und Pretix-Widgets kombiniert werden

## YouTube-Videos einbetten

Du kannst einfach YouTube-Videos in Blog-Beiträge einbinden. Das Video wird als interaktives Thumbnail angezeigt und lädt erst beim Klick.

### Video-Syntax:
```markdown
{% include youtube.html id="VIDEO_ID" title="Titel des Videos" %}
```

**Parameter:**
- `id`: **Pflichtfeld** - Die YouTube Video-ID (der Teil nach `v=` in der URL)
- `title`: Optional - Titel des Videos (wird als Beschreibung angezeigt)

### Video-ID herausfinden:
1. Öffne das Video auf YouTube
2. Kopiere die URL: `https://www.youtube.com/watch?v=dQw4w9WgXcQ`
3. **Video-ID:** `dQw4w9WgXcQ` (der Teil nach `v=`)

### Praktisches Beispiel:
```markdown
---
title: "Workshop Dokumentation"
author: "Maria Schmidt"
category: "Events"
date: 2025-08-15
---

## Rückblick auf unseren KI-Workshop

Hier ist die Aufzeichnung unseres Workshops:

{% include youtube.html id="dQw4w9WgXcQ" title="KI Workshop für Vereine - Vollständige Aufzeichnung" %}

### Was du gelernt hast

Im Workshop haben wir verschiedene KI-Tools vorgestellt...
```

### Video-Features:
- **Datenschutzfreundlich:** YouTube lädt erst beim Klick (kein automatisches Tracking)
- **Thumbnail-Vorschau:** Zeigt automatisch das YouTube-Thumbnail
- **Responsive Design:** Passt sich an alle Bildschirmgrößen an
- **Accessible:** Unterstützt Screenreader und Tastaturnavigation
- **Performance-optimiert:** Lädt keine YouTube-Scripts im Hintergrund

### Wichtige Hinweise:
- **Nur öffentliche Videos:** Das Video muss auf YouTube öffentlich verfügbar sein
- **Copyright beachten:** Nur Videos einbetten, für die du die Rechte hast
- **Kombination möglich:** Videos können mit Galerien und Pretix-Widgets kombiniert werden

**Ausführliche Referenz:** [Markdown Cheat Sheet](https://www.markdownguide.org/cheat-sheet/)

## Suchfunktion

**Neu seit März 2026:** Die Website hat eine Suchfunktion unter `/suche/`, die alle Inhalte der Website durchsuchbar macht.

### Was wird gefunden?

Die Suche indexiert automatisch:
- ✅ Alle **Blog-Beiträge** (`/beitraege/…`)
- ✅ **Statische Seiten** (Startseite, KI-Seite, Impressum etc.)
- ❌ Autoren-Profilseiten (bewusst ausgeschlossen)
- ❌ Die Beitrags-Übersicht selbst (bewusst ausgeschlossen)

### Was musst du als Redakteur*in tun?

**Nichts.** Der Suchindex wird bei jedem Deployment automatisch neu aufgebaut. Neue Beiträge erscheinen nach dem nächsten Push in den Suchergebnissen.

### Wie sieht ein gutes Suchergebnis aus?

Pagefind zeigt pro Ergebnis:
- Das **Vorschaubild** des Beitrags (sofern vorhanden)
- Den **Titel**
- Einen kurzen **Textauszug** mit hervorgehobenen Suchbegriffen

Damit Beiträge gut in der Suche gefunden werden:
- Schreibe einen aussagekräftigen **Titel** (wird prominent angezeigt)
- Nutze wichtige **Schlüsselwörter** im Beitragstext (nicht nur im Teaser)
- Ein **Header-Bild** verbessert die visuelle Darstellung im Suchergebnis

### Suche verlinken

Du kannst direkt auf die Suchseite mit vorausgefülltem Suchbegriff verlinken – z.B. in einem Beitrag oder einer E-Mail:

```
https://oic-bielefeld.de/suche/
```

(Pagefind unterstützt derzeit keine vorausgefüllten Suchbegriffe per URL-Parameter.)

### Wichtige Hinweise

- Der Suchindex wird **nicht** bei lokaler Entwicklung automatisch aktualisiert — dafür muss `npx pagefind --site _site` manuell ausgeführt werden (Aufgabe der Entwicklung, nicht der Redaktion)
- Die Suche funktioniert **vollständig im Browser** — keine Daten werden an externe Dienste gesendet (DSGVO-konform)

## Newsletter-Anmeldung per Link

**Neu seit November 2025:** Du kannst jetzt direkte Links zur Newsletter-Anmeldung erstellen!

### Wofür ist das nützlich?

Mit direkten Newsletter-Links kannst du:
- **E-Mails versenden** mit direktem Link zur Anmeldung
- **Social Media Posts** erstellen, die direkt zur Anmeldung führen
- **QR-Codes** für Events generieren
- **Externe Kampagnen** starten

### Link-Formate:

**Option 1: URL-Parameter** ⭐ Empfohlen für E-Mails
```
https://oic-bielefeld.de/?newsletter=true
https://oic-bielefeld.de/beitraege/?newsletter=true
https://oic-bielefeld.de/events/?newsletter=true
```

**Option 2: Hash-Fragment** (kürzer)
```
https://oic-bielefeld.de/#newsletter
https://oic-bielefeld.de/events/#newsletter
```

### Was passiert?

Wenn jemand auf einen dieser Links klickt:
1. Die Website öffnet sich normal
2. Das Newsletter-Anmeldeformular erscheint automatisch als Overlay
3. Die Person kann sich direkt anmelden
4. Das Overlay lässt sich mit ESC oder durch Klick außerhalb schließen

### Praktisches Beispiel für E-Mail:

```
Liebe Interessierte,

bleiben Sie auf dem Laufenden über unsere neuesten Events und Projekte!

👉 Jetzt zum Newsletter anmelden: https://oic-bielefeld.de/?newsletter=true

Viele Grüße
Ihr OIC Team
```

### Wichtige Hinweise:

- ✅ **Funktioniert auf allen Seiten** der Website
- ✅ **Kombination möglich** mit bestehenden Links (z.B. `/events/?newsletter=true`)
- ✅ **Keine zusätzliche Konfiguration** nötig
- ✅ **Mobile-optimiert** funktioniert auf allen Geräten

### QR-Code erstellen:

1. Gehe zu einem QR-Code-Generator (z.B. [qr-code-generator.com](https://www.qr-code-generator.com/))
2. Gib die URL ein: `https://oic-bielefeld.de/?newsletter=true`
3. Generiere und lade den QR-Code herunter
4. Verwende ihn auf Flyern, Präsentationen oder Veranstaltungen

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

## Kommunikationsgrundlagen
Für die Kommunikation gelten folgende Grundregeln, die sich z.T. aus unseren CD-Manual ergeben:
1. Sofern möglich nutzen wir immer deutsche Bezeichnungen. Wir vermeiden Fremdwörter, Anglizismen oder Fachbegriffe. Ist das nicht möglich, erklären wir die Begriffe im Text.
2. Wir gendern alle Texte. Dafür nutzen wir nach Möglichkeit die geschlechtsneutrale Form. Ist das nicht möglich, nutzen wir den Gender-Stern.
3. Wir nutzen kurze, vollständige Sätze, um die Lesbarkeit und Textverständlichkeit zu erhöhen.
4. Wir nutzen aktive Sprache und vermeiden Passiv-Konstruktionen. "Das Team entwickelt eine neue App." anstelle von "Eine neue App wird vom Team entwickelt."
5. Wir kennzeichnen mit KI generierte Inhalte. Dafür reicht eine Satz am Ende des jeweiligen Inhalts, z.B. "Dieser Text wurde mit Hilfe von KI in einfache Sprache übertragen."

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

### Wann welchen Workflow nutzen?
- **Kleine Korrekturen** (Tippfehler, E-Mail ändern): Direkter Weg
- **Neue Inhalte** (Blog-Posts, Events, neue Teammitglieder): Pull Request
- **Bei Unsicherheit:** Immer Pull Request verwenden

### Kommunikation:
- Pull Request Link per E-Mail/Stackfield an Reviewer senden
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

### Reviews
- Neue Inhalte können von allen Teammitgleidern reviewed und gemerged werden
- Bei neuen Funktionen sollten Stephan und Jens gegenseitig Reviews durchführen 

### Eskalation:
Bei technischen Problemen oder Konflikten: jens.edler@bielefeld.de

---

*Letzte Änderung: Februar 2026 | Version 1.5*
