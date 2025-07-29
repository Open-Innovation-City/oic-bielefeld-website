---
layout: post
title: "Bildergalerie Test"
date: 2025-01-28
category: "Test"
teaser: "Test der neuen Bildergalerie-Funktionalität mit verschiedenen Bildformaten und Layouts."
author: "Jens Edler"
---

## Neue Bildergalerie Funktionalität

Diese Seite demonstriert die neue Bildergalerie-Funktionalität. Redakteure können jetzt einfach mehrere Bilder in einem Pinterest-ähnlichen Layout darstellen.

### Verwendung der Galerie

Die Syntax für GitHub Pages:

```markdown
{% include gallery.html 
   images="bild1.jpg|Beschreibung 1,bild2.jpg|Beschreibung 2,bild3.jpg" 
   folder="/assets/images/ordner/" %}
```

### Beispiel-Galerie

Hier ist eine Beispiel-Galerie mit Team-Bildern:

{% include gallery.html 
   images="sommerfest_2025_1.jpeg,sommerfest_2025_2.jpeg,sommerfest_2025_3.jpeg,sommerfest_2025_4.jpeg,sommerfest_2025_5.jpeg,sommerfest_2025_6.jpeg,sommerfest_2025_7.jpeg,sommerfest_2025_8.jpeg,sommerfest_2025_9.jpeg,sommerfest_2025_10.jpeg,sommerfest_2025_11.jpeg,sommerfest_2025_12.jpeg,sommerfest_2025_13.jpeg,sommerfest_2025_14.jpeg,sommerfest_2025_15.jpeg,sommerfest_2025_16.jpeg,sommerfest_2025_17.jpeg,sommerfest_2025_18.jpeg,sommerfest_2025_19.jpeg,sommerfest_2025_20.jpeg,sommerfest_2025_21.jpeg,sommerfest_2025_22.jpeg,sommerfest_2025_23.jpeg" folder="/assets/images/events/sommerfest_2025/" %}

### Features der Galerie

- **Pinterest-Style Layout**: Automatisches Masonry-Grid für optimale Darstellung
- **Responsive Design**: Passt sich an alle Bildschirmgrößen an
- **Lightbox Navigation**: Pfeile und Tastatur-Navigation zwischen Bildern  
- **Touch-Gesten**: Wischen auf Mobilgeräten
- **Bildunterschriften**: Optionale Beschreibungen pro Bild
- **Performance**: Lazy Loading und Preloading der nächsten Bilder

### Einzelbilder

Normale Bilder funktionieren weiterhin wie gewohnt und öffnen sich einzeln in der Lightbox:

![Logo](/assets/images/logo.svg)

Die neue Galerie-Funktionalität erweitert die bestehende Lightbox um Multi-Bild-Navigation, ohne die Funktionalität für Einzelbilder zu beeinträchtigen.

## Technische Details

- **Jekyll Plugin**: Automatische HTML-Generierung aus Markdown
- **CSS Grid/Flexbox**: Modernes, responsives Layout
- **JavaScript Enhanced**: Progressive Enhancement für alle Features
- **Touch-optimiert**: Swipe-Gesten und größere Touch-Targets
- **Accessibility**: Tastatur-Navigation und Screen-Reader Support
