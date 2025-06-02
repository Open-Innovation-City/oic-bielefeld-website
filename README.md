# Open Innovation City Bielefeld

Eine moderne, responsive Website für die Open Innovation City Initiative in Bielefeld.

## 🚀 Features

- **Responsive Design** - Funktioniert perfekt auf allen Geräten
- **Moderne Animationen** - Scroll-Animationen und Parallax-Effekte
- **SEO-optimiert** - Vollständige Meta-Tags und strukturierte Daten
- **Accessibility** - Barrierefrei nach WCAG-Standards
- **Performance** - Optimiert für schnelle Ladezeiten
- **Jekyll CMS** - Einfache Content-Verwaltung

## 📁 Projekt-Struktur

```
├── _config.yml              # Jekyll Konfiguration
├── _data/
│   ├── team.yml             # Teammitglieder
│   └── projects.yml         # Projekte
├── _layouts/
│   └── default.html         # Basis-Layout
├── assets/
│   ├── css/main.css         # Hauptstylesheet
│   ├── js/main.js          # JavaScript
│   └── images/             # Bilder und Assets
├── index.html              # Startseite
├── Gemfile                 # Ruby Dependencies
└── README.md              # Diese Datei
```

## 🛠 Installation

### Voraussetzungen

- Ruby (Version 2.7 oder höher)
- Bundler
- Git

### Lokale Entwicklung

1. **Repository klonen:**
   ```bash
   git clone https://github.com/dein-username/oic-bielefeld.git
   cd oic-bielefeld
   ```

2. **Dependencies installieren:**
   ```bash
   bundle install
   ```

3. **Development Server starten:**
   ```bash
   bundle exec jekyll serve
   ```

4. **Website öffnen:**
   - Öffne [http://localhost:4000](http://localhost:4000) im Browser
   - Änderungen werden automatisch neu geladen

### Mit Live-Reload (optional)

```bash
bundle exec jekyll serve --livereload
```

## 📝 Content verwalten

### Teammitglieder hinzufügen

Bearbeite `_data/team.yml`:

```yaml
- name: "Max Mustermann"
  role: "Neue Rolle"
  image: "/assets/images/team/max-mustermann.jpg"
  expertise:
    - "Expertise 1"
    - "Expertise 2"
  email: "max.mustermann@oic-bielefeld.de"
```

### Projekte hinzufügen

Bearbeite `_data/projects.yml`:

```yaml
- title: "Neues Projekt"
  tag: "Kategorie"
  description: "Beschreibung des Projekts..."
  status: "In Entwicklung"
  responsible: "Verantwortliche Person"
```

### Bilder hinzufügen

- **Logo:** `assets/images/logo.svg`
- **Graffiti:** `assets/images/graffiti.svg`
- **Team-Fotos:** `assets/images/team/`

## 🚀 Deployment

### GitHub Pages

1. **Repository auf GitHub erstellen**
2. **Code hochladen:**
   ```bash
   git add .
   git commit -m "Initial commit"
   git push origin main
   ```
3. **GitHub Pages aktivieren:**
   - Gehe zu Settings > Pages
   - Source: "Deploy from a branch"
   - Branch: "main" / Folder: "/ (root)"

### Netlify

1. **Repository mit Netlify verbinden**
2. **Build Settings:**
   - Build command: `bundle exec jekyll build`
   - Publish directory: `_site`

### Eigener Server

1. **Website builden:**
   ```bash
   bundle exec jekyll build
   ```
2. **_site/ Ordner auf Server hochladen**

## ⚙️ Konfiguration

### Basis-Einstellungen

Bearbeite `_config.yml` für:
- Website-Titel und Beschreibung
- Kontaktdaten
- Social Media Links
- Google Analytics

### Farben anpassen

Die Farbpalette ist in `assets/css/main.css` definiert:

```css
:root {
  --primary-turquoise: #00b2bb;
  --primary-yellow: #fff564;
  --secondary-blue: #666cde;
  /* ... weitere Farben */
}
```

## 🎨 Design-System

### Farben
- **Primär:** Türkis (#00b2bb) und Gelb (#fff564)
- **Sekundär:** Blau (#666cde), Grün (#a5e35f), Hellblau (#78d3fa), Pink (#fa2d6e)

### Typografie
- **Headlines:** Open Sans (sans-serif)
- **Body Text:** Source Serif Pro (serif)

### Breakpoints
- **Mobile:** < 768px
- **Tablet:** 768px - 1024px
- **Desktop:** > 1024px

## 📞 Support

Bei Fragen oder Problemen:
- **E-Mail:** info@oic-bielefeld.de
- **Issues:** [GitHub Issues](https://github.com/dein-username/oic-bielefeld/issues)

## 📄 Lizenz

© 2025 Open Innovation City Bielefeld. Eine Initiative der Stadt Bielefeld.

---

**Entwickelt mit ❤️ für die Stadt Bielefeld**
