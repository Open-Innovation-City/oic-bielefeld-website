# CLAUDE.md

This file provides guidance to Claude Code (claude.ai/code) when working with code in this repository.

## Development Commands

### Local Development
```bash
# Install dependencies
bundle install

# Start development server
bundle exec jekyll serve

# Start with live-reload
bundle exec jekyll serve --livereload

# Build for production
bundle exec jekyll build
```

### Content Management
Content is managed through YAML data files in `_data/`:
- `team.yml` - Team member profiles with expertise, roles, and contact info
- `projects.yml` - Project portfolios with status tracking and metadata  
- `events.yml` - Event listings with booking URLs and target audiences

## Architecture Overview

### Jekyll Configuration
- **Jekyll 4.3.2** with performance plugins (image compression, minification)
- **SEO optimization** via jekyll-seo-tag with custom meta tags
- **Multi-deployment support** (GitHub Pages, Netlify, custom server)
- **German language focus** with proper timezone and locale settings

### Content-Driven Architecture
This site uses a **data-driven approach** where all dynamic content is managed through structured YAML files rather than individual markdown files:

- Team members include animation delays for staggered loading effects
- Projects support status tracking ("Im Live-Betrieb", "Umgesetzt", "Gestartet") 
- Events can have conditional booking URLs and target audience specifications
- All content supports rich metadata (dates, locations, links, categories)

### CSS Architecture  
Single CSS file (`assets/css/main.css`) with **design token system**:
- CSS custom properties for consistent color palette
- Component-based sections (hero, about, team, projects, events, contact)
- **Adaptive navigation** that switches light/dark theme based on section background colors
- Mobile-first responsive design with CSS Grid/Flexbox

### JavaScript Interactions
Class-based architecture (`assets/js/main.js`) with:
- **AdaptiveNavigation class** for automatic theme switching via background color detection
- **Intersection Observer API** for scroll-triggered animations with staggered delays
- **Error-resilient asset loading** with logo fallback system
- **Performance-optimized animations** using requestAnimationFrame

### Asset Organization
- **Images**: Organized by purpose (`/team/`, `/icons/`) with SVG icon system
- **Logo system**: Multiple versions (light/dark/SVG) with CSS fallback generation
- **Performance**: Automated image compression via Jekyll plugin

## Key Development Patterns

### Adding Team Members
Edit `_data/team.yml` with required fields:
```yaml
- name: "Full Name"
  role: "Position Title"  
  image: "/assets/images/team/filename.jpg"
  expertise: ["Skill 1", "Skill 2"]
  email: "email@oic-bielefeld.de"
  animation_delay: 0.2  # For staggered animations
```

### Adding Projects
Edit `_data/projects.yml` with status tracking:
```yaml
- title: "Project Name"
  tag: "Category"
  description: "Project description..."
  status: "Im Live-Betrieb"  # or "Umgesetzt", "Gestartet"
  responsible: "Team Member Name"
  date: "2024"
  link: "https://optional-url.com"  # Optional
```

### Adding Image Galleries
Use the `{% gallery %}` tag in posts and pages:
```markdown
{% gallery %}
/assets/images/folder/image1.jpg | Optional caption for image 1
/assets/images/folder/image2.jpg | Another caption
/assets/images/folder/image3.jpg
{% endgallery %}
```

**Gallery Features:**
- **Pinterest-style masonry layout** with responsive grid (5→3→2→1 columns)
- **Enhanced lightbox** with arrow navigation and keyboard support (←/→ keys)
- **Touch gestures** for mobile (swipe left/right to navigate)
- **Image preloading** for smooth navigation experience
- **Captions support** with `|` separator (auto-generated from filename if omitted)
- **Progressive enhancement** - works without JavaScript for basic image display

### Styling Considerations
- **Background color detection**: Navigation automatically adapts to section backgrounds
- **Animation delays**: Use consistent staggered timing (0.1s, 0.2s, 0.3s increments)
- **Color system**: Always use CSS custom properties from design token system
- **Error handling**: Logo and image loading includes graceful fallbacks

### SEO & Performance
- **Meta tags**: Managed via `_includes/head.html` with preconnect optimization
- **German language**: Content structure optimized for German municipal website requirements
- **Legal compliance**: Includes proper Impressum/Datenschutz pages
- **Asset optimization**: Images automatically compressed, CSS/JS minified on build