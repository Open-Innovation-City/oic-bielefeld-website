# Newsletter Template Guide

## 📧 Über das Template

Das Newsletter-Template ist perfekt auf das Design Ihrer OIC-Website abgestimmt und wurde speziell für E-Mail-Clients optimiert. Es verwendet ausschließlich inline CSS und table-basiertes Layout für maximale Kompatibilität.

## 🎨 Design-Features

- **Responsive Design** - Funktioniert auf Desktop und Mobilgeräten
- **OIC Farbschema** - Verwendet die gleichen Farben wie Ihre Website
- **Professioneller Header** - Mit Gradient-Hintergrund im OIC-Stil
- **Strukturierte Inhalte** - Klare Abschnitte für verschiedene Themen
- **Highlight-Boxen** - Für wichtige Informationen
- **Call-to-Action Buttons** - Für Links zu weiteren Inhalten
- **Vollständiger Footer** - Mit Kontaktdaten und Abmelde-Link

## 📝 Template verwenden

### 1. Template öffnen
Öffnen Sie die Datei `newsletter-template.html` in einem Text-Editor oder HTML-Editor.

### 2. Platzhalter ersetzen
Ersetzen Sie alle Platzhalter in eckigen Klammern `[...]` mit Ihren Inhalten:

#### Header-Bereich:
- `[DATUM - z.B. Juni 2024]` → Aktuelles Datum/Monat

#### Inhalts-Bereiche:
- `[HAUPTÜBERSCHRIFT]` → Titel Ihres Newsletters
- `[EINLEITUNGSTEXT]` → Begrüßung und Einführung
- `[ÜBERSCHRIFT ABSCHNITT 1/2/3]` → Titel der verschiedenen Abschnitte
- `[INHALT ABSCHNITT 1/2/3]` → Texte der verschiedenen Abschnitte
- `[LISTENPUNKT 1/2/3]` → Aufzählungspunkte (optional)
- `[WICHTIGE INFORMATION]` → Text für Highlight-Box
- `[ABSCHLUSSTEXT]` → Verabschiedung und Ausblick

#### Call-to-Action Button:
- `[LINK-URL]` → URL zu Ihrer Website oder einem Artikel
- `[BUTTON-TEXT]` → Text auf dem Button (z.B. "Mehr erfahren")

### 3. Beispiel-Inhalt

```html
<!-- Statt: -->
<h2>[HAUPTÜBERSCHRIFT]</h2>

<!-- Schreiben Sie: -->
<h2>Neues aus dem OIC Bielefeld - Juni 2024</h2>
```

```html
<!-- Statt: -->
<p>[EINLEITUNGSTEXT]</p>

<!-- Schreiben Sie: -->
<p>Liebe Innovationsbegeisterte, herzlich willkommen zu unserem Juni-Newsletter! 
   Diesen Monat haben wir spannende Neuigkeiten aus der Welt der offenen Innovation für Sie.</p>
```

## 🔗 Abmelde-Link erklärt

Der Abmelde-Link ist bereits vorkonfiguriert und erstellt automatisch eine E-Mail mit:

**An:** info@oic-bielefeld.de  
**Betreff:** Newsletter abbestellen  
**Text:** Vorausgefüllte höfliche Abmeldeanfrage

### Technischer Aufbau:
```html
mailto:info@oic-bielefeld.de?subject=Newsletter%20abbestellen&body=Hallo%20OIC%20Team%2C%0A%0Abitte%20entfernen%20Sie%20meine%20E-Mail-Adresse%20aus%20dem%20Newsletter-Verteiler.%0A%0AVielen%20Dank%21%0A%0AMit%20freundlichen%20Gr%C3%BC%C3%9Fen
```

## 📱 Mobile Optimierung

Das Template ist automatisch für Mobilgeräte optimiert:
- Maximale Breite von 600px
- Responsive Tabellen-Layout
- Große, berührungsfreundliche Buttons
- Optimierte Schriftgrößen

## ✅ Verwendung in Newsletter-Tools

### Schritt 1: HTML kopieren
Kopieren Sie den kompletten HTML-Code aus `newsletter-template.html`

### Schritt 2: In Ihr Tool einfügen
Fügen Sie den Code in das HTML-Template-Feld Ihres Newsletter-Tools ein

### Schritt 3: Inhalte anpassen
Bearbeiten Sie die Platzhalter direkt in Ihrem Newsletter-Tool

### Schritt 4: Vorschau testen
Nutzen Sie die Vorschau-Funktion Ihres Tools, um das Ergebnis zu prüfen

## 🎯 Best Practices

### Texte schreiben:
- **Kurze Absätze** - Maximal 3-4 Sätze pro Absatz
- **Persönliche Ansprache** - "Sie" statt "ihr" verwenden
- **Klare Struktur** - Wichtigste Infos zuerst
- **Call-to-Action** - Maximal 1-2 Buttons pro Newsletter

### Links verwenden:
- **Vollständige URLs** - Immer mit `https://` beginnen
- **Beschreibende Linktexte** - Nicht "hier klicken" sondern "Projekt ansehen"
- **Interne Links** - Verweisen Sie auf Ihre Website oder Beiträge

### Länge beachten:
- **Optimal:** 200-500 Wörter pro Newsletter
- **Maximum:** 800 Wörter
- **Highlight-Box:** Maximal 1-2 pro Newsletter

## 🧪 Testen vor dem Versand

### Empfohlene Tests:
1. **Gmail** - Größter E-Mail-Anbieter
2. **Outlook** - Geschäftskunden
3. **Apple Mail** - iPhone/iPad Nutzer
4. **Thunderbird** - Desktop-Client
5. **Mobile Ansicht** - Smartphone-Test

### Test-Checkliste:
- [ ] Alle Platzhalter ersetzt?
- [ ] Links funktionieren?
- [ ] Buttons sind klickbar?
- [ ] Abmelde-Link funktioniert?
- [ ] Kontaktdaten aktuell?
- [ ] Mobile Ansicht okay?
- [ ] Rechtschreibung geprüft?

## 🔧 Anpassungen vornehmen

### Farben ändern:
Die Hauptfarben sind im Code fest definiert:
- **Türkis:** `#00b2bb`
- **Blau:** `#666cde`
- **Gelb:** `#fff564`
- **Dunkelgrau:** `#2c3e50`

### Schriftarten:
Das Template verwendet web-sichere Schriftarten:
```css
font-family: 'Segoe UI', Tahoma, Geneva, Verdana, sans-serif;
```

### Kontaktdaten anpassen:
Ändern Sie im Footer-Bereich:
- Adresse
- Telefonnummer  
- E-Mail-Adresse
- Website-URL
- Öffnungszeiten

## 📋 Checkliste für den ersten Newsletter

- [ ] Template heruntergeladen
- [ ] Platzhalter durch eigene Inhalte ersetzt
- [ ] Kontaktdaten im Footer angepasst
- [ ] Links getestet
- [ ] In Newsletter-Tool eingefügt
- [ ] Vorschau in verschiedenen E-Mail-Clients getestet
- [ ] Test-E-Mail an sich selbst gesendet
- [ ] Rechtschreibung und Grammatik geprüft
- [ ] Newsletter versendet! 🚀

## 💡 Inhaltliche Anregungen

### Mögliche Newsletter-Abschnitte:
- **Aktuelles** - Neuigkeiten aus dem OIC
- **Projektspot** - Vorstellung eines aktuellen Projekts
- **Team-News** - Neue Mitarbeiter oder Erfolge
- **Veranstaltungen** - Kommende Events und Workshops
- **Tool-Tipp** - Nützliche Tools für Innovation
- **Community** - Partnerschaften und Kooperationen
- **Ausblick** - Was kommt als nächstes?

### Regelmäßige Rubriken:
- **Zahl des Monats** - Statistische Highlights
- **Zitat des Monats** - Inspirierende Aussagen
- **Hinter den Kulissen** - Einblicke in die Arbeit
- **Lesetipp** - Interessante Artikel oder Bücher

---

**Viel Erfolg mit Ihrem Newsletter!** 📧

Bei Fragen zum Template können Sie gerne ein Issue im Repository erstellen.