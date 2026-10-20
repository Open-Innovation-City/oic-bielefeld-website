# Product

<!-- impeccable:product-schema 1 -->

## Platform

web

## Users

Primär: Bielefelder Bürger*innen, Vereine und zivilgesellschaftliche Initiativen, die Veranstaltungen, Projekte und Mitmach-Methoden der Open Innovation City (OIC) entdecken und daran teilnehmen wollen (Events besuchen, Blogbeiträge lesen, sich für den Newsletter anmelden, Methodenkoffer nutzen).

Sekundär: städtische Fachbereiche, politische Gremien und Kooperationspartner, die sich über laufende Projekte und Ergebnisse informieren oder Kontakt für Kooperationen aufnehmen.

## Product Purpose

Die Website ist die öffentliche Plattform der Open Innovation City Bielefeld, einer Initiative der Stadt Bielefeld. Sie macht sichtbar, wie offene Innovation in der Stadt konkret stattfindet: laufende Projekte, Veranstaltungen, Methoden und das Team dahinter. Erfolg bedeutet, dass Bürger*innen und Zivilgesellschaft den Weg zu Teilnahme (Events, Workshops, Newsletter, Methodenkoffer) finden und dass Projekte/Ergebnisse für Verwaltung und Partner nachvollziehbar dokumentiert sind.

## Positioning

Der Unterschied zu einer generischen Smart-City-/Digitalisierungs-Seite ist die offene Innovationsmethodik selbst als Markenkern: Die OIC versteht sich nicht als "Digitalisierung von oben", sondern öffnet Denk- und Experimentierräume, in denen Stadtgesellschaft aktiv mitgestaltet. Dieser Methodenanspruch (Open Innovation Hour, Methodenkoffer, offene Formate) ist das eigentliche Produkt, nicht nur einzelne Digitalisierungsprojekte.

## Operating Context

- Content-getriebene Jekyll-Site, Inhalte werden über YAML-Daten (`_data/team.yml`, `_data/projects.yml`, `_data/events.yml`) und Markdown-Collections (`_beitraege/`, `_methoden/`, `autoren/`) gepflegt, auch von nicht-technischen Redakteur*innen über GitHub (siehe `REDAKTIONSLEITFADEN.md`).
- Laufende Formate: monatliche Open Innovation Hour, themenspezifische Veranstaltungen (z. B. "KI und Zivilgesellschaft"), ein wachsender Methodenkoffer mit Schritt-für-Schritt-Anleitungen, Event-Anmeldung über Pretix.
- Deutschsprachig, kommunaler Kontext (Stadt Bielefeld), Zielgruppe reicht von interessierten Laien bis zu Fachpublikum.

## Capabilities and Constraints

- Statisches Jekyll 4.3.2 Setup ohne Build-Pipeline für JS-Frameworks; Inhalte/Design-Tokens zentral in `assets/css/main.css` und `assets/js/main.js`.
- Eigene clientseitige Volltextsuche (Pagefind), Newsletter-Modal mit URL-Deep-Linking, Konfetti-Belohnung auf Blogbeiträgen, Kategorie-Filter auf der Blogübersicht.
- Content Security Policy beschränkt erlaubte externe Quellen (Pretix, YouTube, jsdelivr) – neue externe Einbindungen erfordern CSP-Anpassung.
- Methoden-Collection (`_methoden/`) nutzt einen "coming soon"-Platzhalter-Mechanismus, bis ein Beitrag final freigegeben wird.

## Brand Commitments

- Name "Open Innovation City Bielefeld" / Kurzform "OIC Bielefeld", Trägerschaft "Eine Initiative der Stadt Bielefeld".
- Bestehendes Farbsystem (Design Tokens): Primär-Türkis `#00b2bb`, Primär-Gelb `#fff564`, Sekundär-Blau `#666cde`, Sekundär-Grün `#a5e35f`, Sekundär-Hellblau `#78d3fa`, Sekundär-Pink `#fa2d6e`.
- Bestehendes Layout-Idiom: schwebende/standard Navbar mit adaptivem Hell/Dunkel-Theme je Sektionshintergrund, Team- und Projekt-Karten mit gestaffelten Einblend-Animationen.

## Evidence on Hand

- Reale, gepflegte Inhalte: 6 Teammitglieder (`_data/team.yml`), laufende Projekte mit Status-Tracking (`_data/projects.yml`, z. B. "Digitaler Zwilling Sennestadt", "Passantenfrequenzmessung"), echte Veranstaltungen (`_data/events.yml`), Blogbeiträge (`_beitraege/`) und ein entstehender Methodenkoffer (`_methoden/`).
- Keine erfundenen Testimonials, Kund*innen oder Kennzahlen vorhanden oder zu ergänzen – alle Projekt-/Event-Angaben stammen aus den YAML-Datendateien und müssen dort gepflegt bleiben, nicht in Designtexten erfunden werden.

## Product Principles

1. Beteiligung vor Präsentation: Jede neue Fläche sollte einen klaren nächsten Schritt zur Teilnahme bieten (Event, Newsletter, Methode, Kontakt).
2. Methode ist Marke: Offene, nachvollziehbare Innovationsprozesse sind die eigentliche Differenzierung – nicht Hochglanz-Digitalisierungsclaims.
3. Redaktionelle Zugänglichkeit: Inhalte müssen von nicht-technischen Redakteur*innen über strukturierte YAML/Markdown-Dateien pflegbar bleiben.
4. Kommunale Verlässlichkeit: Als städtische Initiative muss die Seite seriös, barrierefrei und sachlich korrekt bleiben; keine erfundenen Belege oder Übertreibungen.

## Accessibility & Inclusion

CLAUDE.md dokumentiert bereits Barrierefreiheits-Features (ARIA-Rollen, Tastaturnavigation, `prefers-reduced-motion`-Unterstützung, Screenreader-Live-Regions). Als Website einer Kommune gilt implizit der Anspruch auf Barrierefreiheit nach WCAG/BITV-Niveau; keine zusätzlichen, über CLAUDE.md hinausgehenden Anforderungen wurden bestätigt.
