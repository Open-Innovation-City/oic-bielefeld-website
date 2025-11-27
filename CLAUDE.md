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
- **NewsletterModal class** for newsletter overlay with URL-based auto-opening (`?newsletter=true` or `#newsletter`)
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

**Automatic mode (recommended for multiple images):**
```markdown
{% include gallery.html folder="/assets/images/folder/" %}
```

**Manual mode (for specific images with custom captions):**
```markdown
{% include gallery.html
   images="image1.jpg|Optional caption 1,image2.jpg|Another caption,image3.jpg"
   folder="/assets/images/folder/" %}
```

**Gallery Features:**
- **Automatic folder loading** (new as of October 2025): Omit `images` parameter to load all images from folder
- **Pinterest-style masonry layout** with responsive grid (5→3→2→1 columns)
- **Enhanced lightbox** with arrow navigation and keyboard support (←/→ keys)
- **Touch gestures** for mobile (swipe left/right to navigate)
- **Image preloading** for smooth navigation experience
- **Captions support** with `|` separator (auto-generated from filename if omitted)
- **Progressive enhancement** - works without JavaScript for basic image display
- **Gallery isolation**: Multiple galleries on same page are kept separate in lightbox navigation

**Implementation Details:**
- **Unique gallery IDs**: Gallery ID is generated from folder path to ensure separation between multiple galleries
- **Automatic image detection**: Uses Jekyll's `site.static_files` to find all images (jpg, jpeg, png, gif, webp) in specified folder
- **Alphabetical sorting**: Auto-loaded images are sorted alphabetically (use numerical prefixes for custom order: `01-first.jpg`, `02-second.jpg`)
- **Manual override**: Use `gallery_id` parameter to explicitly set gallery ID if needed

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

### Adding Quote Blocks
**New as of October 2025:** For embedding styled quotes in blog posts:
```markdown
{% include quote.html
   text="The quote text goes here."
   author="Optional source or author name" %}
```

**Quote Block Component:**
- **Reuses 404 page design**: Same styling as the Douglas Adams quote on the 404 error page
- **Visual elements**: Large decorative quotation mark, white card with shadow, blue accent border
- **Flexible layout**: Works with or without author attribution
- **Responsive design**: Adapts to all screen sizes with mobile-optimized spacing

**Parameters:**
- `text`: Quote text (required)
- `author`: Source/author attribution (optional) - displayed right-aligned below quote

**Implementation Details:**
- Component file: `_includes/quote.html`
- Self-contained styling within component (no main.css dependencies)
- CSS uses design token variables: `--primary-turquoise`, `--secondary-blue`, `--text-dark`, etc.
- Responsive breakpoints at 768px and 480px
- Font size scales from 1.3rem (desktop) to 1.1rem (mobile)

**Example Usage:**
```markdown
{% include quote.html
   text="Innovation unterscheidet zwischen einem Anführer und einem Verfolger."
   author="Steve Jobs" %}
```

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

### Category Filter System for Blog Posts

**New as of October 2025:** The `/beitraege/` page includes an interactive category filter system with full accessibility support!

#### Features:

**Filter Functionality:**
- **Dynamic filtering** by blog post categories
- **URL parameter support** - filters can be shared via URL (`?filter=kategorie`)
- **Automatic counting** - shows number of posts per category
- **Smooth animations** - staggered card appearance when filtering
- **Keyboard navigation** - full arrow key support for accessibility
- **Screen reader support** - ARIA labels and live region announcements

**Visual Design:**
- **Gradient active state** with turquoise-to-blue gradient
- **Hover effects** with shimmer animation
- **Responsive layout** - wraps gracefully on mobile devices
- **Count badges** - automatically hidden on very small screens
- **Focus indicators** - yellow outline for keyboard navigation

#### Implementation:

**HTML Structure** (`beitraege.html`):
```liquid
<!-- Automatic category detection -->
{% assign all_categories = site.beitraege | where_exp: "item", "item.is_retrospective != true" | map: 'category' | uniq | compact | sort %}

<!-- Filter buttons with accessibility -->
<nav aria-label="Beiträge filtern" class="filter-section fade-in">
    <div role="radiogroup" aria-label="Kategorie auswählen" class="filter-buttons">
        <button role="radio"
                aria-checked="true"
                class="filter-btn active"
                data-filter="all">
            Alle <span class="filter-count">({{ site.beitraege.size }})</span>
        </button>

        {% for category in all_categories %}
            <button role="radio"
                    class="filter-btn"
                    data-filter="{{ category | slugify }}">
                {{ category }} <span class="filter-count">(count)</span>
            </button>
        {% endfor %}
    </div>
</nav>

<!-- Blog cards with category data attribute -->
<div class="project-card" data-category="{{ beitrag.category | slugify }}">
    <!-- Card content -->
</div>
```

**JavaScript Class** (`assets/js/main.js:668-887`):
```javascript
class BeitraegeFilter {
    // Handles filtering logic, animations, keyboard navigation
    // Updates URL parameters and announces changes to screen readers
}
```

**Key Methods:**
- `applyFilter(filter)` - Applies selected filter with animations
- `setupKeyboardNavigation()` - Arrow keys, Home/End navigation
- `updateResultCount()` - Updates and announces filter results
- `checkURLParameter()` - Restores filter from URL on page load

**CSS Styling** (`assets/css/main.css:2005-2206`):
- `.filter-section` - Container with responsive margins
- `.filter-btn` - Button styling with transitions
- `.filter-btn.active` - Gradient background for active filter
- `.filter-count` - Badge styling for post counts

#### Usage:

**Adding Categories to Blog Posts:**
Simply add a `category` field in the front matter:
```yaml
---
title: "Blog Post Title"
category: "Workshop"  # or "Events", "Tutorial", etc.
---
```

**URL Filtering:**
Users can share filtered views via URL:
- All posts: `/beitraege/`
- Filtered: `/beitraege/?filter=workshop`

**Keyboard Shortcuts:**
- **Arrow keys / Tab**: Navigate between filters
- **Enter / Space**: Activate selected filter
- **Home / End**: Jump to first/last filter

#### Accessibility Features:

- **ARIA roles**: `radiogroup` for filter buttons with `aria-checked` states
- **Screen reader announcements**: Live region updates on filter changes
- **Keyboard focus management**: Proper tabindex handling
- **Reduced motion support**: Animations disabled for users with motion sensitivity
- **Semantic HTML**: `<nav>` with descriptive labels

#### Integration with Retrospectives:

The filter system **automatically excludes** retrospective posts (marked with `is_retrospective: true`) from:
- Category counting
- Filter results
- "Alle" button count

This ensures clean category organization while keeping retrospectives accessible via linked announcements.

### Newsletter Direct Links

**New as of November 2025:** The newsletter modal can be opened directly via URL parameters or hash fragments.

**Use Cases:**
- Email campaigns linking directly to newsletter signup
- Social media posts with direct registration
- QR codes at events
- External marketing materials

**URL Formats:**
- **URL Parameter** (recommended): `?newsletter=true`
  - Example: `https://oic-bielefeld.de/?newsletter=true`
  - Example: `https://oic-bielefeld.de/beitraege/?newsletter=true`

- **Hash Fragment**: `#newsletter`
  - Example: `https://oic-bielefeld.de/#newsletter`
  - Example: `https://oic-bielefeld.de/events/#newsletter`

**Implementation Details:**
- JavaScript class: `NewsletterModal` in `assets/js/main.js:948-1002`
- Method: `checkURLForAutoOpen()` (line 979-991)
- Auto-opens modal on page load when URL contains parameter/hash
- Compatible with all existing modal functionality (ESC key, overlay click, close button)
- Works on all pages where the newsletter modal is present

**Technical Notes:**
- Uses `URLSearchParams` API for parameter detection
- Hash detection via `window.location.hash`
- Modal opens automatically after DOM ready
- No interference with regular modal triggers

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
- Always assume, that a Jekyll with Livereload ist running in the background for testing purposes.