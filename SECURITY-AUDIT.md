# Security Audit Report

**Date:** March 25, 2026
**Project:** OIC Bielefeld Website
**Type:** Static Jekyll site (GitHub Pages)

## Summary

The project is a static Jekyll website with no server-side processing, which significantly reduces the attack surface. Nevertheless, **18 security issues** were identified, including **1 High** severity finding remaining (1 fixed).

| Severity | Count | Status |
|---|---|---|
| High | 2 | 2 Fixed |
| Medium | 8 | Open |
| Low | 8 | Open |

---

## High Severity

### HIGH-01: Pretix Widget Loaded on Every Page
**File:** `_includes/head.html:23-24`
**Status:** **Fixed** (April 1, 2026)

The Pretix JavaScript and CSS were loaded globally in `head.html` — including on pages that have no Pretix widget (Impressum, 404, search, most blog posts). There was no SRI hash. A compromised `pretix.eu` server could have executed arbitrary code on **all pages**.

Additionally, the CSS URL was hardcoded to the expired event `OIC-BIE/ki-zivil-4`.

**Fix Applied:**
- ✅ Removed Pretix `<link>` and `<script>` from `_includes/head.html`
- ✅ Moved both tags into `_includes/pretix-widget.html` — loaded only on pages that include the widget
- ✅ CSS URL is now dynamic (`/OIC-BIE/{{ include.event }}/widget/v2.css`) — no longer hardcoded to the expired event

**Files Modified:**
- `_includes/head.html`
- `_includes/pretix-widget.html`

---

### HIGH-02: Newsletter Iframe with Excessive Permissions
**File:** `index.html:384` / `_includes/newsletter.html:16`
**Status:** **Fixed** (April 1, 2026)

```html
allow="geolocation; microphone; camera"
allowfullscreen="true"
```

A newsletter signup form has no legitimate need for access to geolocation, microphone, or camera. If `bielefeld.de` is ever compromised, this iframe would have browser-granted access to the user's microphone and camera.

Additionally, `checkOrigin: false` is set in the iFrameResizer config (`index.html:410`, `newsletter.html:36`), which disables origin validation entirely.

**Fix Applied:**
- ✅ Removed `allow="geolocation; microphone; camera"` attribute entirely
- ✅ Removed `allowfullscreen="true"` and `allowtransparency="true"`
- ✅ Changed `checkOrigin: false` to `checkOrigin: ['https://www.bielefeld.de']` to validate origin

**Files Modified:**
- `_includes/newsletter.html`
- `index.html`

---

## Medium Severity

### MEDIUM-01: No Content Security Policy (CSP)
**File:** `_includes/head.html`
**Status:** **Fixed** (April 1, 2026)

No CSP header or `<meta>` tag exists anywhere in the project. Without CSP, injected scripts from any origin can execute freely. Note: GitHub Pages does not support custom HTTP headers, so a `<meta http-equiv="Content-Security-Policy">` tag would provide partial protection.

**Recommendation:** Add a CSP `<meta>` tag to `_includes/head.html`. Example:
```html
<meta http-equiv="Content-Security-Policy" content="
  default-src 'self';
  script-src 'self' 'unsafe-inline' https://pretix.eu https://cdn.jsdelivr.net;
  style-src 'self' 'unsafe-inline' https://fonts.googleapis.com https://pretix.eu;
  font-src https://fonts.gstatic.com;
  frame-src https://www.bielefeld.de https://pretix.eu;
  img-src 'self' https://img.youtube.com data:;
">
```

---

### MEDIUM-02: Inline Scripts in 5 Layout/Page Files
**Files:**
- `_layouts/post.html:751-984` (lightbox, YouTube, gallery logic — 234 lines)
- `_layouts/page.html:174-199`
- `_layouts/author.html:222-247`
- `ki-zivilgesellschaft.html:327-386`
- `workshop-crowdsourcing.html:141-167`

**Status:** Open

Inline scripts cannot be controlled by a future CSP without `'unsafe-inline'`. The large inline script block in `post.html` contains logic that should live in `main.js`.

---

### MEDIUM-03: `innerHTML +=` with Computed Values
**File:** `assets/js/main.js:519-523`
**Status:** Open

```javascript
dateElement.innerHTML += ' <span ...>(Heute!)</span>';
dateElement.innerHTML += ` <span ...>(in ${diffDays} Tagen)</span>`;
```

While `diffDays` is a number (no direct XSS), the `innerHTML +=` pattern re-parses existing DOM content as HTML on every call. This can amplify injected content from other attack vectors.

**Recommendation:** Use `insertAdjacentHTML()` or `createElement` + `appendChild`.

---

### MEDIUM-04: `rel="noopener"` Missing `noreferrer` on External Links
**Files:** `index.html:213,310` / `ki-zivilgesellschaft.html:168` / `_includes/pretix-widget.html:18`
**Status:** **Fixed** (April 1, 2026)

```html
<a href="..." target="_blank" rel="noopener">
```

`noreferrer` is missing on event booking buttons and project links. This is inconsistent — `default.html` footer correctly uses `rel="noopener noreferrer"`.

**Recommendation:** Use `rel="noopener noreferrer"` on all `target="_blank"` links.

---

### MEDIUM-05: No SRI Hashes for External Resources
**File:** `_includes/head.html:17,23,24` / `index.html:398` / `_includes/newsletter.html:30`
**Status:** Partially resolved via LOW-02

| Resource | Status |
|---|---|
| Google Fonts CSS | Nicht zutreffend — Site nutzt nur lokale Fonts |
| Pretix Widget CSS | SRI nicht möglich (dynamische URL pro Event) |
| Pretix Widget JS | SRI nicht praktikabel (keine Versionsnummer in URL) |
| iFrameResizer JS | ✅ Behoben via LOW-02 — jetzt lokal gehostet, kein SRI nötig |

Verbleibende Restrisiko: Pretix-Ressourcen ohne SRI. Da Pretix die URLs nicht versioniert, ist SRI hier nicht umsetzbar ohne Gefahr von Produktionsausfällen bei Pretix-Updates.

---

### MEDIUM-06: `url` in `_config.yml` Uses HTTP Instead of HTTPS
**File:** `_config.yml:5`
**Status:** **Fixed** (bereits vor diesem Audit behoben)

`_config.yml` verwendet korrekt `https://oic-bielefeld.de`.

---

### MEDIUM-07: No Clickjacking Protection (`frame-ancestors`)
**Status:** Open

No `X-Frame-Options` or CSP `frame-ancestors` protection is configured. An attacker could embed the site in a hidden iframe to trick users into clicking buttons (e.g., newsletter subscription).

**Recommendation:** Add `frame-ancestors 'self'` to the CSP (see MEDIUM-01). Note: `X-Frame-Options` is not available via `<meta>` tags; only the CSP directive works here.

---

### MEDIUM-08: `jekyll-admin` in Gemfile Without Authentication
**File:** `Gemfile:29`
**Status:** **Fixed** (bereits vor diesem Audit behoben)

Die Zeile ist auskommentiert (`# gem "jekyll-admin"`), das Gem wird nicht geladen.

---

## Low Severity

### LOW-01: `console.log` Debug Output in Production Code
**Files:** `assets/js/main.js:496` / `_layouts/post.html:803,813`
**Status:** Open

Debug statements expose internal structure (gallery IDs, event titles) to anyone opening the browser console.

**Recommendation:** Remove all `console.log` calls from production code.

---

### LOW-02: Outdated iFrameResizer Version Loaded from GitHub Tag
**Files:** `_includes/newsletter.html:30` / `index.html:398`
**Status:** **Fixed** (April 1, 2026)

**Fix Applied:**
- ✅ Updated from `4.2.10` to `4.4.5` (neueste 4.x-Version)
- ✅ Datei lokal unter `assets/js/iframeResizer.min.js` gehostet — kein externer CDN mehr
- ✅ MEDIUM-05 für iFrameResizer damit hinfällig (lokale Dateien brauchen kein SRI)

---

### LOW-03: `Gemfile.lock` Listed in `.gitignore` but Present in Repo
**File:** `.gitignore:18`
**Status:** Open

`Gemfile.lock` is listed in `.gitignore` but actually committed to the repository. This inconsistency can lead to different gem versions being resolved in different environments, obscuring the security patch status.

**Recommendation:** Remove `Gemfile.lock` from `.gitignore` to make version pinning explicit and consistent.

---

### LOW-04: YouTube Video ID Inserted into `iframe.src` Without Validation
**File:** `_layouts/post.html:968-972`
**Status:** Open (low risk in current setup)

```javascript
const videoId = this.dataset.videoId;
iframe.src = `https://www.youtube.com/embed/${videoId}?autoplay=1`;
```

`videoId` comes from a `data-video-id` attribute set via Jekyll/YAML (not user input), so there is no current XSS risk. However, the pattern of inserting an unescaped variable into a URL string is fragile and could become a vulnerability if the data source changes.

---

### LOW-05: `onclick` Inline Handlers in HTML
**Files:** `index.html:21,102` / `ki-zivilgesellschaft.html:80`
**Status:** Open

Inline `onclick` attributes require `'unsafe-inline'` in any CSP, making a strict CSP harder to implement.

**Recommendation:** Replace with `addEventListener` calls in `main.js`.

---

### LOW-06: Retrospective Posts Included in RSS Feed
**Status:** Open

Posts marked with `is_retrospective: true` are filtered from `/beitraege/` but still appear in the RSS feed generated by `jekyll-feed`. This is an information consistency issue.

**Recommendation:** Configure `jekyll-feed` to exclude retrospective posts (e.g., via a custom feed template or `feed.path` with filtering).

---

### LOW-07: Google Site Verification Token in Public Repository
**File:** `_includes/head.html:10`
**Status:** Informational

```html
<meta name="google-site-verification" content="Dn5wjZl9wLdwUXGXl2Z0-bbc-6U-5llBN-YiQ9DcYjo" />
```

This token must be publicly visible for Google to verify it — no action required. Noted for completeness.

---

### LOW-08: VAT ID in Public Repository
**File:** `impressum.md:37`
**Status:** Informational

The VAT ID is publicly required by German law (Impressumspflicht) and is correct in the HTML output. It is permanently stored in git history. No action required, noted for data inventory purposes.

---

## Not Applicable (Explicitly Verified)

| Topic | Finding |
|---|---|
| Template Injection | Jekyll's Liquid engine escapes YAML values by default. No malicious payloads found in `_data/`. |
| API Keys / Secrets | None found. Google Analytics slot in `_config.yml` is empty. No `.env` file present. |
| GitHub Actions Workflow | Well-configured: minimal permissions, up-to-date action versions (`v4`/`v5`). |
| CSRF | Not applicable for a static site. Newsletter form is externally embedded. |

---

## Prioritized Action Plan

| Priority | Issue | Effort | Status |
|---|---|---|---|
| 1 | HIGH-01: Load Pretix script only on pages that need it | Small | **Fixed** |
| 2 | HIGH-02: Reduce iframe `allow` to `""` + fix `checkOrigin` | Small | Open |
| 3 | MEDIUM-06: Change `url` in `_config.yml` to `https://` | Trivial | **Fixed** |
| 4 | MEDIUM-04: Add `noreferrer` to all `target="_blank"` links | Small | **Fixed** |
| 5 | MEDIUM-01: Add CSP `<meta>` tag | Medium | **Fixed** |
| 6 | MEDIUM-05: Add SRI hashes to external scripts | Small | Open |
| 7 | MEDIUM-08: Remove unused `jekyll-admin` from Gemfile | Trivial | **Fixed** |
| 8 | LOW-01: Remove `console.log` calls | Trivial | Open |
| 9 | LOW-02: Update / self-host iFrameResizer | Medium | Open |
| 10 | LOW-03: Remove `Gemfile.lock` from `.gitignore` | Trivial | Open |
