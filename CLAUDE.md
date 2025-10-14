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
- Events can have conditional booking URLs with customizable button text and target audience specifications
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

### Adding Events
Edit `_data/events.yml` with all event details:
```yaml
- title: "Event Title"
  description: "Event description..."
  date: "2025-08-15"
  time: "18:00"
  duration: "2 Stunden"
  location: "Innovation Office, Niederwall 23"
  category: "Workshop"  # or "Vortrag", "Meetup", etc.
  target_audience: "Alle Bürger*innen"
  cost: "Kostenlos"
  booking_url: "https://pretix.eu/..."  # Optional
  link_text: "Anmelden"  # Optional, fallback: "Anmelden"
  featured: true  # or false
  topic: "ki-zivilgesellschaft"  # Optional, für thematische Landing-Pages
```

**Event Parameters:**
- `link_text`: Custom text for the booking button (optional, defaults to "Anmelden" if omitted)
- `booking_url`: If provided, displays button with link_text or "Anmelden"
- `featured`: Controls prominence on event pages
- `topic`: Thematic grouping for filtered event pages (optional, e.g., "ki-zivilgesellschaft", "digitalisierung")

### Creating Thematic Event Landing Pages
For specialized event pages that show only events from a specific topic, use the topic filtering system:

**Filter Logic Example** (from `ki-zivilgesellschaft.html`):
```liquid
{% assign today = 'now' | date: '%Y-%m-%d' %}
{% assign ki_events = site.data.events | where: 'topic', 'ki-zivilgesellschaft' | sort: 'date' %}

<!-- Upcoming events -->
{% assign upcoming_events = ki_events | where_exp: 'event', 'event.date >= today' %}

<!-- Past events (reverse chronological) -->
{% assign past_events = ki_events | where_exp: 'event', 'event.date < today' | sort: 'date' | reverse %}
```

**Features:**
- **Topic-based filtering**: Only shows events matching the specified topic
- **Dual sections**: Separate display for upcoming and past events
- **Consistent styling**: Uses the same event-card components as the main events page
- **Reusable pattern**: Can be applied to other thematic landing pages

**Topic Values:**
- `"ki-zivilgesellschaft"`: KI und Zivilgesellschaft event series
- `"digitalisierung"`: Digitization-focused events
- `"innovation"`: Innovation workshops and talks
- Add new topics as needed for future landing pages

### Adding Image Galleries
Use the gallery include for GitHub Pages compatibility:
```markdown
{% include gallery.html 
   images="image1.jpg|Optional caption 1,image2.jpg|Another caption,image3.jpg" 
   folder="/assets/images/folder/" %}
```

**Gallery Features:**
- **Pinterest-style masonry layout** with responsive grid (5→3→2→1 columns)
- **Enhanced lightbox** with arrow navigation and keyboard support (←/→ keys)
- **Touch gestures** for mobile (swipe left/right to navigate)
- **Image preloading** for smooth navigation experience
- **Captions support** with `|` separator (auto-generated from filename if omitted)
- **Progressive enhancement** - works without JavaScript for basic image display

### Adding Images with Captions in Blog Posts
**New as of January 2025:** Images in blog posts now support automatic caption display using the title attribute:

```markdown
![Alt text for accessibility](/assets/images/image.jpg "Visible caption text")
```

**Image Caption System:**
- **Alt text** (between `[]`): Used for accessibility and screen readers
- **Title attribute** (between `""`): Automatically displayed as visible caption below image
- **Lightbox integration**: Title text is shown in enlarged view instead of alt text
- **Automatic styling**: Captions are styled with italic font and proper spacing
- **Optional**: Images without title attribute work normally without captions

**Implementation Details:**
- CSS class `.image-caption` for styling captions
- JavaScript automatically creates caption elements for images with title attributes
- Optimized spacing: Image margin adjusted to bring caption closer to image
- Responsive design: Captions adapt to all screen sizes

### Adding Pretix Event Widgets
For embedding event registration forms directly in blog posts:
```markdown
{% include pretix-widget.html event="event-name" %}
```

**Optional Parameters:**
```markdown
{% include pretix-widget.html event="ki-zivil-4" items="123,124" voucher="GUTSCHEIN2025" %}
```

**Widget Features:**
- **Direct registration** without leaving the website
- **Responsive design** optimized for all screen sizes
- **Automatic localization** in German
- **On-demand loading** - CSS/JS only loaded when widget is used
- **Mobile-optimized** checkout flow
- **Consistent styling** integrated with website design

**Parameters:**
- `event`: Pretix event name (required) - only the event identifier, e.g., "ki-zivil-4"
- `items`: Specific ticket IDs to display (optional) - comma-separated list
- `voucher`: Pre-fill voucher code (optional)
- `disable-vouchers`: Set to "true" to hide voucher input (optional)

### Linking Event Announcements and Retrospectives

**New as of October 2025:** Event announcements and retrospectives can be elegantly linked without cluttering the blog overview!

#### Workflow:

**1. Create Event Announcement:**
Create a regular blog post for the event announcement in `_beitraege/`:
```markdown
---
title: "KI Workshop for Associations"
teaser: "Learn how AI can support your association work"
author: "Sarah Mueller"
category: "Events"
date: 2025-08-15
---

Event details, registration form, etc.
```

**2. After Event: Create Retrospective:**
Create a new post with "-rueckschau" suffix:
```markdown
---
title: "KI Workshop for Associations - Retrospective"
teaser: "An inspiring evening with many practical insights"
author: "Sarah Mueller"
category: "Events"
date: 2025-08-20
related_post: "ki-workshop-vereine"
is_retrospective: true
---

Event recap, photos, summary, etc.
```

**3. Link Posts Together:**
Add to the **original announcement post**:
```yaml
retrospective_post: "ki-workshop-vereine-rueckschau"
```

#### Key Parameters:

- **`is_retrospective: true`**: Marks post as retrospective
  - Retrospectives are **filtered out** from `/beitraege/` overview page
  - Accessible via banner link or direct URL only

- **`related_post: "filename"`**: Links back to announcement
  - Automatically displays "📅 Event Announcement" banner with link

- **`retrospective_post: "filename"`**: Links to retrospective
  - Automatically displays "📸 Event Retrospective Available" banner with link

#### Implementation Details:

**Banner Component:** `_includes/related-post-banner.html`
- Automatically included in `_layouts/post.html`
- Bidirectional linking with visual banners
- Responsive design with slide-in animation
- Different color schemes for announcement vs. retrospective

**Filtering:** `beitraege.html`
```liquid
{% for beitrag in sorted_beitraege %}
{% unless beitrag.is_retrospective %}
  <!-- Only show non-retrospective posts -->
{% endunless %}
{% endfor %}
```

**Benefits:**
- Clean blog overview (only announcements visible)
- No lost content (retrospectives accessible via links)
- Automatic visual connection between related posts
- Optional system (only use when needed)

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