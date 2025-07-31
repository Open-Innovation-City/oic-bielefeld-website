# Pretix-Integration: Evaluation und Konzeptionierung

## Projektziel

Entwicklung einer Lösung zur direkten Integration von Pretix-Event-Anmeldungen in Beitragsseiten der OIC-Website, um den Umweg über externe Pretix-Seiten zu vermeiden und die User Experience zu verbessern.

## Durchgeführte Evaluation

### 1. API-Dokumentation analysiert
- Umfassende REST API für Event-Management verfügbar
- Token- und OAuth-Authentifizierung unterstützt
- Webhook-System für Event-Benachrichtigungen
- Keine expliziten Widget/Embedding-Dokumentation in der API-Übersicht

### 2. Entwicklerdokumentation geprüft
- Plugin-Entwicklung und Core-Development-Konzepte dokumentiert
- Spezifische Embedding-Details nicht in der allgemeinen Entwicklerdokumentation gefunden

### 3. Umfassende Web-Recherche durchgeführt
- Offizielle Widget-Dokumentation gefunden
- Community-Diskussionen und GitHub-Issues analysiert
- WordPress-Plugin als Referenz-Implementierung identifiziert
- CORS- und Security-Aspekte evaluiert

## Verfügbare Integrationsmöglichkeiten

### 1. JavaScript-Widget (⭐ Empfehlung)

**Beschreibung:** Offizielles Pretix-Widget für Website-Integration

**Vorteile:**
- ✅ Offiziell von Pretix unterstützt
- ✅ Einfache HTML/JS-Integration 
- ✅ Automatische Lokalisierung (Deutsch verfügbar)
- ✅ Responsive Design
- ✅ Nahtlose Integration in Jekyll-Struktur
- ✅ Keine Backend-Entwicklung erforderlich
- ✅ Automatische Updates von Pretix
- ✅ Mobile-optimiert und barrierefrei

**Nachteile:**
- ⚠️ CORS-Einschränkungen bei strict Security Policies
- ⚠️ Externe JavaScript-Abhängigkeit
- ⚠️ Design-Anpassungen begrenzt
- ⚠️ Lädt zusätzliche Ressourcen

**Technische Implementation:**
```html
<!-- Im <head> Bereich -->
<link rel="stylesheet" href="https://pretix.eu/widget/v2.css">
<script src="https://pretix.eu/widget/v2.de.js" async></script>

<!-- An der gewünschten Position -->
<pretix-widget event="https://pretix.eu/oic-bielefeld/event-name/"></pretix-widget>
```

**Konfigurationsoptionen:**
- `voucher`: Gutschein-Code vorausfüllen
- `disable-vouchers`: Gutschein-Eingabe deaktivieren
- `items`: Produkte nach ID filtern
- `categories`: Spezifische Kategorien anzeigen
- `disable-iframe`: iFrame-Modus deaktivieren

### 2. iFrame-Einbindung

**Beschreibung:** Direkte Einbettung der Pretix-Checkout-Seite

**Vorteile:**
- ✅ Schnelle Implementierung
- ✅ Vollständige Pretix-Funktionalität
- ✅ Keine JavaScript-Konflikte

**Nachteile:**
- ❌ PayPal/Stripe funktionieren nicht in iFrames
- ❌ Begrenzte Anpassungsmöglichkeiten
- ❌ Mobile UX-Probleme
- ❌ Schlechte Design-Integration
- ❌ SEO-Nachteile

**Nicht empfohlen** aufgrund der erheblichen Funktionseinschränkungen.

### 3. Custom API-Integration

**Beschreibung:** Eigene Checkout-Implementierung über Pretix REST API

**Vorteile:**
- ✅ Maximale Kontrolle über UX
- ✅ Vollständige Design-Integration

**Nachteile:**
- ❌ Sehr komplexe Implementierung 
- ❌ Viele Pretix-Features fehlen (Preis-/Verfügbarkeitsberechnung)
- ❌ Nicht praktikabel für statische Sites
- ❌ Hoher Wartungsaufwand

**Nicht empfohlen** für statische Jekyll-Websites.

## Empfohlene Lösung: JavaScript-Widget

### Warum das Widget die beste Lösung ist

1. **Nahtlose Integration** in bestehende Jekyll-Architektur
2. **Keine Backend-Entwicklung** nötig - funktioniert mit statischen Sites
3. **Automatische Lokalisierung** und Updates von Pretix
4. **Bewährt** - wird bereits von vielen Organisationen genutzt
5. **Mobile-optimiert** und barrierefrei
6. **Wartungsarm** - automatische Updates durch Pretix

### Technische Umsetzungsstrategie

#### Phase 1: Datenstruktur erweitern (1 Tag)

Erweiterung der `_data/events.yml`:
```yaml
- title: "Workshop Digitalisierung"
  description: "Workshop zur digitalen Transformation..."
  date: "2024-08-15"
  # Bestehende Felder...
  
  # Neue Pretix-Integration Felder:
  pretix_event_url: "https://pretix.eu/oic-bielefeld/digitalisierung/"
  pretix_widget: true
  widget_items: "123,124"  # Optional: spezifische Tickets
  booking_url: null  # Widget ersetzt externen Link
```

#### Phase 2: Jekyll-Templates erstellen (1-2 Tage)

**1. Widget-Include erstellen (`_includes/pretix-widget.html`):**
```liquid
{% if include.event_url %}
<div class="pretix-widget-container">
  <pretix-widget 
    event="{{ include.event_url }}"
    {% if include.items %}items="{{ include.items }}"{% endif %}
    {% if include.voucher %}voucher="{{ include.voucher }}"{% endif %}>
  </pretix-widget>
</div>
{% endif %}
```

**2. Layout-Integration (`_includes/head.html`):**
```html
<!-- Pretix Widget Ressourcen -->
<link rel="stylesheet" href="https://pretix.eu/widget/v2.css">
<script src="https://pretix.eu/widget/v2.de.js" async></script>
```

**3. Event-Template anpassen:**
```liquid
{% if event.pretix_widget %}
  <!-- Widget einbinden -->
  {% include pretix-widget.html 
     event_url=event.pretix_event_url 
     items=event.widget_items %}
{% elsif event.booking_url %}
  <!-- Fallback: Externer Link -->
  <a href="{{ event.booking_url }}" target="_blank" class="btn btn-primary">
    {{ event.link_text | default: "Anmelden" }}
  </a>
{% endif %}
```

#### Phase 3: Styling und Performance-Optimierung (1 Tag)

**CSS-Anpassungen (`assets/css/main.css`):**
```css
.pretix-widget-container {
  margin: 2rem 0;
  border-radius: 8px;
  overflow: hidden;
  box-shadow: 0 2px 8px rgba(0,0,0,0.1);
}

/* Responsive Widget-Styling */
@media (max-width: 768px) {
  .pretix-widget-container {
    margin: 1rem -1rem;
    border-radius: 0;
  }
}
```

**Performance-Optimierungen:**
- Widget-Ressourcen async laden
- Preconnect zu Pretix-Domains
- Conditional Loading nur bei Events mit Widget

### Migrationsplan

#### Schritt 1: Pretix-Konfiguration (1 Tag)
- Test-Event in Pretix anlegen
- Widget-Einstellungen konfigurieren:
  - Event → Einstellungen → Widget
  - Sprache: Deutsch
  - Mobile-Optimierung aktivieren
  - Design-Anpassungen vornehmen

#### Schritt 2: Entwicklungsumgebung (1 Tag)
- Jekyll-Templates und Includes erstellen
- Lokale Tests mit `bundle exec jekyll serve`
- Cross-Browser-Kompatibilität prüfen

#### Schritt 3: Pilotprojekt (2-3 Tage)
- Ein Event als Test umstellen
- User Testing durchführen
- Performance und UX evaluieren
- Notwendige Anpassungen vornehmen

#### Schritt 4: Vollständige Migration (1-2 Wochen)
- Schrittweise alle Events umstellen
- Alte `booking_url`-Links als Fallback beibehalten
- Monitoring und Optimierung

### Mögliche Herausforderungen und Lösungen

#### CORS-Probleme
**Problem:** Widget nicht kompatibel mit strict Content Security Policies
**Lösung:** 
- CSP anpassen für Pretix-Domains
- Fallback: Widget öffnet Checkout in neuem Tab bei CORS-Problemen

#### Design-Integration
**Problem:** Widget-Design passt nicht zum Website-Layout
**Lösung:**
- CSS-Container für Widget-Styling
- Pretix-Widget-Konfiguration für Farbanpassungen
- Custom CSS für responsive Verhalten

#### Performance-Impact
**Problem:** Zusätzliche externe Ressourcen verlangsamen die Seite
**Lösung:**
- Async Loading der Widget-Ressourcen
- Lazy Loading für nicht-sichtbare Widgets
- CDN-Nutzung für Pretix-Ressourcen

#### Jekyll-Entwicklung CORS-Issues
**Problem:** Lokale Entwicklung mit `jekyll serve` hat CORS-Probleme
**Lösung:** 
- `http://localhost:4000` statt `http://127.0.0.1:4000` verwenden
- Site.url in `_config.yml` entsprechend konfigurieren

### Erwartete Vorteile

#### User Experience
- **Nahtlose Anmeldung** ohne Seitenwechsel
- **Konsistentes Design** mit der Hauptwebsite
- **Mobile-optimierte** Anmeldeerfahrung
- **Reduzierte Abbruchrate** durch weniger Weiterleitungen

#### Technische Vorteile
- **Wartungsarm** durch automatische Pretix-Updates
- **SEO-freundlich** durch bessere Page Experience
- **Analytics-Integration** möglich für besseres Tracking
- **Skalierbar** für zukünftige Events

#### Business-Impact
- **Höhere Conversion Rate** durch bessere UX
- **Professionellerer Auftritt** durch einheitliches Design
- **Bessere Mobile Experience** für steigende Mobile-Nutzung
- **Einfachere Content-Pflege** durch Jekyll-Integration

### Geschätzter Aufwand

**Gesamtaufwand:** 3-4 Entwicklungstage

**Aufschlüsselung:**
- Konzeption und Setup: 0.5 Tage
- Template-Entwicklung: 1.5 Tage
- Styling und Integration: 1 Tag
- Testing und Optimierung: 1 Tag

**ROI:** Sehr hoch - deutlich bessere User Experience bei geringem Entwicklungsaufwand

### Nächste Schritte

1. **Pretix-Test-Event** anlegen und Widget-Konfiguration testen
2. **Jekyll-Templates** in Entwicklungsumgebung implementieren
3. **Pilotprojekt** mit einem Live-Event durchführen
4. **Performance und Analytics** messen
5. **Vollständige Migration** aller Events

### Referenzen und Dokumentation

- **Pretix Widget Dokumentation:** https://docs.pretix.eu/guides/widget/
- **Pretix API Dokumentation:** https://docs.pretix.eu/dev/api/index.html
- **WordPress-Plugin Referenz:** https://github.com/pretix/pretix-widget-wordpress
- **Jekyll Performance Optimierung:** https://jekyllrb.com/docs/performance/

---

**Evaluation durchgeführt am:** 31. Juli 2025  
**Erstellt für:** OIC Bielefeld Website (Jekyll)  
**Status:** Empfehlung zur Umsetzung genehmigt