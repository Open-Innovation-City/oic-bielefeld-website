---
name: Open Innovation City Bielefeld
description: Städtische Open-Innovation-Plattform mit Graffiti-Hero, Verlaufs-CTAs und Pillenform-Interaktion
colors:
  civic-turquoise: "#00b2bb"
  workshop-yellow: "#fff564"
  dialogue-blue: "#666cde"
  growth-green: "#a5e35f"
  sky-blue: "#78d3fa"
  signal-pink: "#fa2d6e"
  ink: "#2c3e50"
  ink-muted: "#666666"
  paper: "#ffffff"
  paper-dim: "#f8f9fa"
  alert-amber: "#ff6b35"
typography:
  display:
    fontFamily: "'Open Sans', sans-serif"
    fontSize: "4.5rem"
    fontWeight: 700
    lineHeight: 1.2
  headline:
    fontFamily: "'Open Sans', sans-serif"
    fontSize: "2.5rem"
    fontWeight: 600
    lineHeight: 1.2
  title:
    fontFamily: "'Open Sans', sans-serif"
    fontSize: "1.5rem"
    fontWeight: 600
    lineHeight: 1.2
  body:
    fontFamily: "'Open Sans', sans-serif"
    fontSize: "1.1rem"
    fontWeight: 400
    lineHeight: 1.6
  label:
    fontFamily: "'Open Sans', sans-serif"
    fontSize: "0.9rem"
    fontWeight: 600
rounded:
  pill: "50px"
  lg: "16px"
  md: "8px"
  sm: "1px"
  circle: "50%"
spacing:
  xs: "0.5rem"
  sm: "1rem"
  md: "2rem"
  lg: "3rem"
  xl: "6rem"
components:
  button-primary:
    backgroundColor: "linear-gradient(45deg, {colors.workshop-yellow}, {colors.growth-green})"
    textColor: "{colors.ink}"
    rounded: "{rounded.pill}"
    padding: "1.2rem 2.5rem"
  button-secondary:
    backgroundColor: "rgba(255, 255, 255, 0.2)"
    textColor: "#ffffff"
    rounded: "{rounded.pill}"
    padding: "1.2rem 2.5rem"
  card-default:
    backgroundColor: "{colors.paper}"
    textColor: "{colors.ink}"
    rounded: "{rounded.lg}"
    padding: "2rem"
  filter-chip-active:
    backgroundColor: "linear-gradient(135deg, {colors.civic-turquoise} 0%, {colors.dialogue-blue} 100%)"
    textColor: "#ffffff"
    rounded: "{rounded.pill}"
    padding: "0.65rem 1.5rem"
---

# Design System: Open Innovation City Bielefeld

## Overview

**Creative North Star: "Die offene Werkstattwand"**

Die OIC-Website liest sich wie ein digitales Mitmach-Brett einer kommunalen Werkstatt: ein Farbverlauf-Hero mit Graffiti-Overlay begrüßt mit Street-Art-Spielfreude, aber darunter sitzt ein ruhiges, vertrauenswürdiges Karten-System in Weiß und Türkis. Die Site balanciert zwei Register – verspielt an den Einstiegspunkten (Hero, CTA-Buttons, Konfetti-Belohnung am Ende eines Blogbeitrags), sachlich und aufgeräumt überall dort, wo tatsächlich gelesen oder entschieden wird (Projektkarten, Team-Profile, Blogtexte).

Dichte ist moderat bis locker: große Schnitträume (`padding: 6rem 0` zwischen Sektionen), großzügige Kartenabstände, viel Weißraum auf hellem Grund. Bewegung ist durchgehend sanft und gedämpft (`cubic-bezier(0.4, 0, 0.2, 1)`, 0.3–0.4s), nie abrupt, und respektiert `prefers-reduced-motion`. Es gibt keine explizite Anti-Referenz; das System beschreibt bewusst, was tatsächlich gebaut ist, nicht eine Abgrenzung von etwas anderem.

**Key Characteristics:**
- Farbverlauf-Flächen (Hero, Kontakt-Sektion, Event-Buttons, Filter-Chips) als energiegebende Momente, umschlossen von ruhigen weißen Flächen.
- Durchgängig pillenförmige interaktive Elemente (CTA, Filter, Event-Buchung) als wiederkehrende Signatur.
- Karten heben sich bei Hover sanft ab (`translateY(-4px)` + Schattenwechsel) statt hart zu kippen oder zu skalieren.
- Eine einzige Schrift (Open Sans) trägt das ganze System, Hierarchie entsteht über Größe/Gewicht, nicht über Schriftwechsel.
- Ein verstecktes Belohnungsmoment (Konfetti am Beitragsende) signalisiert: fertig gelesen = mitgemacht.

## Colors

Das Palette-Charakter ist hell, gesättigt und freundlich – ein kommunaler Werkstatt-Look, kein Corporate-Blau-Grau.

### Primary
- **Civic-Turquoise** (`#00b2bb`): Trägt Markenidentität – Navbar-Tönung, Team-Namen, Projekt-/Event-Icons, aktive Filter, Links. Erscheint auf jeder Seite, bleibt aber meist dezent (Text, dünne Akzente), nie als große Fläche außer in Verläufen.

### Secondary
- **Workshop-Yellow** (`#fff564`): Der eigentliche Handlungs-Impuls – Basis des primären CTA-Verlaufs, Projekt-Tags, Fokus-Outline (`outline: 2px solid`). Signalisiert "hier geht's weiter".
- **Dialogue-Blue** (`#666cde`): Gegenpart zu Türkis in Verläufen (Hero, Kontakt, Event-Buchungsbutton, aktive Filter) – sorgt für Tiefe in Gradient-Flächen.
- **Growth-Green** (`#a5e35f`): Zweite Hälfte des primären CTA-Verlaufs, markiert "kostenlos"/positive Event-Zustände.
- **Sky-Blue** (`#78d3fa`): Dritter Akzent im Hero-/Illustrations-Register, selten solo eingesetzt.
- **Signal-Pink** (`#fa2d6e`): Dritte Hero-Verlaufsfarbe, markiert zahlungspflichtige Event-Zustände – der energischste Farbton, entsprechend sparsam verwendet.

### Neutral
- **Ink** (`#2c3e50`): Primäre Textfarbe auf hellem Grund, auch Footer-Hintergrund (invertiert).
- **Ink-Muted** (`#666666`): Sekundärtext (Rollen, Meta-Angaben, Fließtext-Nebensätze).
- **Paper** (`#ffffff`): Kartenflächen, Modal-Hintergrund.
- **Paper-Dim** (`#f8f9fa`): Sektionshintergrund für Abwechslung (z. B. Projekte-Sektion) und Badge-Flächen.
- **Alert-Amber** (`#ff6b35` / Hintergrund `#ffe5dc`): Reserviert für dringende Hinweisbanner (Event-Alerts), nicht für Alltagsakzente.

### Named Rules
**The Gradient-Means-Go Rule.** Ein Farbverlauf markiert immer eine Handlungsfläche (Hero, primäre CTA, Event-Buchung, aktiver Filter) – nie eine reine Informationsfläche. Reine Information bleibt auf Weiß/Paper-Dim mit flächigem Türkis-Text.

## Typography

**Display/Body/Label Font:** 'Open Sans' (lokal via `@font-face`, Gewichte 300/400/500/600/700), Fallback `sans-serif`.

**Character:** Eine einzige, gut lesbare Grotesk trägt jede Rolle – freundlich und sachlich zugleich, ohne eine zweite Display-Schrift für "Persönlichkeit" zu bemühen. Persönlichkeit entsteht über Farbe, Form und Bewegung, nicht über Schriftwahl.

### Hierarchy
- **Display** (700, 4.5rem, line-height 1.2): Hero-`h1`, einmal pro Seite, immer weiß mit Textschatten auf Farbverlauf.
- **Headline** (600, 2.5rem, line-height 1.2): Sektionstitel (`h2`), zentriert über jedem Abschnitt.
- **Title** (600, 1.5–2rem): Karten-/Blocktitel (`h3`/`h4`), z. B. Team-Name, Projekttitel.
- **Body** (400, 1.1rem, line-height 1.6): Fließtext, max. ca. 800px Zeilenbreite in zentrierten Lead-Absätzen.
- **Label** (600, 0.85–0.95rem): Tags, Filter-Buttons, Meta-Angaben – häufig in Türkis oder auf Farbverlauf.

### Named Rules
**The One-Family Rule.** Nur 'Open Sans' in allen Gewichten; keine zweite Schriftfamilie für Zitate, Codeblöcke oder Akzenttext.

## Layout

Zentrierter Container (`max-width: 1200px`, `margin: 0 auto`), Sektionen mit großzügigem vertikalem Rhythmus (`padding: 6rem 0`, auf Mobile reduziert). Grids sind durchgängig `repeat(auto-fit, minmax(…, 1fr))` – Team-Karten ab 280px, Projekt-/Event-Karten ab 350px, Kontakt-/Footer-Spalten ab 250px – wodurch sich die Spaltenzahl responsiv ohne feste Breakpoint-Umschaltung anpasst. Haupt-Breakpoints für Feinschliff: 1200px, 900px, 768px (mobile Hauptgrenze), 480px, 320px. Navbar ist fixed/sticky mit zwei konfigurierbaren Stilen (`standard` volle Breite, `island` schwebend ab 50px Scroll) und adaptivem Hell/Dunkel-Theme je Sektionshintergrund.

## Elevation & Depth

Das System ist überwiegend flach im Ruhezustand und reagiert strukturell auf Interaktion: Karten tragen in Ruhe einen leichten Schatten (`--shadow-light`) und heben sich bei Hover sichtbar an (`translateY(-4px)` plus Wechsel zu `--shadow-medium`). Schatten sind also nie rein dekorativ-ambient, sondern immer eine Antwort auf Zustand (Hover, aktiver Filter, Modal). Glas-/Blur-Flächen (`backdrop-filter: blur(...)`) kommen gezielt bei Navbar, Modal-Overlay und Kontakt-Karten zum Einsatz, um "schwebende" Flächen über Farbverlauf-Hintergründen zu erzeugen.

### Shadow Vocabulary
- **shadow-light** (`0 1px 3px rgba(0,0,0,0.06), 0 4px 12px rgba(0,0,0,0.06)`): Ruhezustand von Karten.
- **shadow-medium** (`0 2px 8px rgba(0,0,0,0.08), 0 8px 24px rgba(0,0,0,0.1)`): Hover-Zustand von Karten, Navbar beim Scrollen.
- **shadow-heavy** (`0 4px 12px rgba(0,0,0,0.1), 0 16px 32px rgba(0,0,0,0.12)`): Reserviert für die prominentesten erhobenen Flächen (z. B. Modal: `0 20px 60px rgba(0,0,0,0.3)` als eigener, stärkerer Wert).

### Named Rules
**The Hover-Lift Rule.** Erhöhte Tiefe entsteht ausschließlich als Reaktion auf Hover/Fokus/aktiven Zustand – im Ruhezustand bleibt jede Fläche auf ihrer Basis-Schattenstufe.

## Shapes

Durchgängig weiche, aber unterschiedlich starke Rundungen je Rolle: Buttons und Chips sind vollständig pillenförmig (`border-radius: 50px`), Karten und Modals nutzen einen großzügigen, aber eckigen Radius (`16px`), kleine Badges/Tags nutzen `8px`, Avatare/Icons sind Kreise (`50%`). Es gibt keine scharfen (`0px`) Flächen außer bewusst reduzierten Ausnahmen (z. B. Navbar im Standard-Modus). Rahmen sind selten und dünn (1–2px), meist halbtransparent auf farbigem Grund statt hart schwarz.

## Components

### Buttons
- **Shape:** Pillenform (`border-radius: 50px`), großzügiges Padding (`1.2rem 2.5rem` primär, `0.65–0.75rem 1.5rem` kompakt bei Event-/Filter-Buttons).
- **Primary (`.cta-button`):** Verlauf Workshop-Yellow → Growth-Green, dunkler Text (Ink), weicher gelblicher Schatten; ein Shine-Sweep (`::before`, 0.6s) läuft bei Hover über den Button, zusätzlich `translateY(-2px)` und verstärkter Schatten.
- **Secondary (`.cta-button.secondary`):** Transparent-Weiß (`rgba(255,255,255,0.2)`) mit halbtransparentem weißem Rand – für Flächen auf Farbverlauf-Hintergrund gedacht.
- **Event-Buchung (`.event-book-btn`):** Verlauf Civic-Turquoise → Dialogue-Blue, eigenständige Variante außerhalb der Hero-Farbwelt für transaktionale Buchungsaktionen.
- **Hover / Focus:** Fokusring ist ein deutlicher gelber Outline (`outline: 2px solid var(--primary-yellow)`), nie unsichtbar.

### Chips / Filter (`.filter-btn`)
- **Style (inaktiv):** Weißer Grund, 2px Türkis-Rand, türkiser Text, Pillenform.
- **State (aktiv):** Verlauf Civic-Turquoise → Dialogue-Blue, weißer Text, dezenter Lift (`translateY(-2px)`) plus farbiger Schatten – identisches Verlaufsmuster wie Event-Buchung, um "aktive Auswahl" und "Buchungsaktion" visuell zu verwandten Konzepten zu machen.

### Cards / Containers
- **Corner Style:** `16px` durchgängig für Team-, Projekt-, Prinzip- und Kontakt-Karten sowie Modals.
- **Background:** Paper (weiß) auf hellem Sektionsgrund; `rgba(255,255,255,0.1)` mit Blur auf Farbverlauf-Grund (Kontakt-Karten).
- **Shadow Strategy:** siehe Elevation & Depth – Light im Ruhezustand, Medium bei Hover.
- **Border:** keiner im Ruhezustand; dünne helle Trennlinien nur innerhalb von Karten (z. B. `.project-meta` Top-Border `1px solid #eee`).
- **Internal Padding:** `2rem` Standard, Team-Karten mit separiertem Bild-/Info-Bereich (`1.5rem` Info-Padding).
- **Entry-Animation:** Karten starten `opacity: 0` + leichter Transform-Offset (`translateY(20px)` bzw. `scale(0.9)` bei Projekten) und blenden bei Scroll-Sichtbarkeit (`.visible`-Klasse) sanft ein.

### Navigation
- **Style:** Fixed, halbtransparent mit Blur (`backdrop-filter: blur(20px)`), adaptives Dark-/Light-Theme je nach Sektionshintergrund darunter (`AdaptiveNavigation`-Klasse via Intersection Observer).
- **Scrolled-Zustand:** Stärkerer Blur, farbiger Schatten, dünner Verlaufsstrich (Türkis → Blau) am unteren Rand via `::after`.
- **Island-Variante:** Ab 50px Scroll schwebende, zentrierte, abgerundete (`16px`) Navbar mit Außenabstand; auf Mobile (≤900px) deaktiviert zugunsten voller Breite.

### Modal (Signature Component)
- Zentriertes weißes Panel (`16px` Radius, `max-width: 700px`), dunkler Overlay mit Blur (`rgba(0,0,0,0.7)`, `blur(5px)`), Einblend-Animation (`slideUp`/`fadeIn`, 0.3s). Schließen-Button ist ein Kreis, der bei Hover um 90° rotiert – ein wiederkehrendes verspieltes Mikro-Detail.

## Do's and Don'ts

### Do:
- **Do** Farbverläufe (Türkis↔Blau oder Gelb↔Grün) für jede primäre Handlungsfläche einsetzen – CTA, Buchung, aktiver Filter, Hero.
- **Do** Buttons und Chips konsequent pillenförmig (`50px`) halten; Karten/Modals bei `16px`.
- **Do** Hover-Zustände über sanften Lift (`translateY(-2px)` bis `-4px`) plus Schattenwechsel ausdrücken, mit `cubic-bezier(0.4, 0, 0.2, 1)`-Timing.
- **Do** `prefers-reduced-motion` respektieren – alle Entry-/Hover-Animationen haben eine reduzierte Variante.
- **Do** bei neuen Flächen mit Weiß/Paper-Dim als Lesegrund arbeiten und Farbverläufe auf klar abgegrenzte Handlungs-/Hero-Flächen beschränken.

### Don't:
- **Don't** eine zweite Schriftfamilie einführen – das System trägt sich komplett über 'Open Sans'-Gewichte.
- **Don't** scharfe, ungerundete Ecken (`0px`) für Karten, Buttons oder Modals verwenden – das widerspricht der weichen Werkstatt-Ästhetik.
- **Don't** Schatten als Ruhezustand-Dekoration auf neue Komponenten legen, ohne dass sie auf einen Zustand (Hover/Fokus/aktiv) reagieren.
- **Don't** Signal-Pink oder Sky-Blue großflächig als Hintergrund einsetzen – beide sind als dritter/vierter Akzent in Verläufen gedacht, nicht als eigenständige große Fläche.
