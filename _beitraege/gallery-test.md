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

Die Syntax ist sehr einfach:

```markdown
{% gallery %}
/pfad/zum/bild1.jpg | Optionale Beschreibung
/pfad/zum/bild2.jpg | Weitere Beschreibung  
/pfad/zum/bild3.jpg
{% endgallery %}
```

### Beispiel-Galerie

Hier ist eine Beispiel-Galerie mit Team-Bildern:

{% gallery %}
/assets/images/team/jens.png | Jens Edler - Projektleitung
/assets/images/team/lisa.png | Lisa Weber - UX Design
/assets/images/team/maria.png | Maria González - Entwicklung
/assets/images/team/sarah.png | Sarah Müller - Content Strategy
/assets/images/team/stephan.png | Stephan Koch - Technische Leitung
/assets/images/team/tatjana.png | Tatjana Richter - Community Management
{% endgallery %}

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