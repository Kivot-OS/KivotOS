# KivotOS Design System

This document is the single source of truth for KivotOS visual identity.
All docs pages **must** follow these rules.

---

## 1. 8px Grid System 🔒 LOCKED

All spacing, sizing, and layout values MUST be multiples of `8px`. This grid is **locked**: every length in `theme/style.css` resolves through a `--space-*` or `--radius-*` token — no raw off-grid pixel values. Radii use the 4/8 scale. Shadow blur radii are the only exempt values (visual effect, not layout).

| Token | Value | Usage |
|-------|-------|-------|
| `--space-1` | 8px | Tight padding, gap between inline elements |
| `--space-2` | 16px | Card padding, section gap |
| `--space-3` | 24px | Section padding, heading margins |
| `--space-4` | 32px | Major sections, hero padding |
| `--space-5` | 40px | Page sections |
| `--space-6` | 48px | Large page sections |
| `--space-7` | 56px | Hero blocks |
| `--space-8` | 64px | Page gutters |

**Exceptions:** None. If you need a value that isn't a multiple of 8, reconsider the layout.

---

## 2. Color System

**Brand gradient (both themes):** `linear-gradient(135deg, #667eea, #764ba2)` — indigo→purple. This is the KivotOS signature, used on the hero title, feature icons, and primary buttons. Dark mode shifts it to `linear-gradient(135deg, #6c5ce7, #a855f7)`.

### 2.1 Arona (Light) — default

Named after the Blue Archive student and Schale Residence's AI assistant. Periwinkle blue over a near-white canvas.

| Token | HEX | Usage |
|-------|-----|-------|
| `--vp-c-brand-1` | `#5b8dee` | Primary — links, buttons, active states |
| `--vp-c-brand-2` | `#667eea` | Primary hover / gradient start |
| `--vp-c-brand-3` | `#764ba2` | Primary active / gradient end |
| `--vp-c-brand-soft` | `#eef2fe` | Soft background for badges, callouts |
| `--vp-c-bg` | `#fefefe` | Page background — near white |
| `--vp-c-bg-alt` | `#f8f9fc` | Section background |
| `--vp-c-bg-elv` | `#ffffff` | Elevated surfaces — cards, modals |
| `--vp-c-text-1` | `#1a1a2e` | Primary text |
| `--vp-c-text-2` | `#4a4a68` | Secondary text — muted descriptions |
| `--vp-c-text-3` | `#8b8ba7` | Tertiary text — captions |
| `--vp-c-border` | `#e2e4eb` | Borders, dividers |
| `--vp-c-accent` | `#764ba2` | Accent — purple |
| `--kglow-primary` | `rgba(91, 141, 238, 0.18)` | Blue glow — hover effects |

**Arona atmosphere:** near-white canvas, periwinkle primary, indigo→purple gradient. Feels airy, bright, modern.

### 2.2 Plana (Dark)

Named after the enigmatic dark-haired AI from Blue Archive. Lilac/purple over deep indigo-black.

| Token | HEX | Usage |
|-------|-----|-------|
| `--vp-c-brand-1` | `#b794f6` | Primary — links, buttons, active states |
| `--vp-c-brand-2` | `#a855f7` | Primary hover / gradient end |
| `--vp-c-brand-3` | `#6c5ce7` | Primary active / gradient start |
| `--vp-c-brand-soft` | `#221a3a` | Soft background |
| `--vp-c-bg` | `#0f0f1a` | Page background — indigo black |
| `--vp-c-bg-alt` | `#16162a` | Section background |
| `--vp-c-bg-elv` | `#1e1e38` | Elevated surfaces — dark indigo |
| `--vp-c-text-1` | `#f0f0f5` | Primary text |
| `--vp-c-text-2` | `#a0a0b8` | Secondary text |
| `--vp-c-text-3` | `#6a6a85` | Tertiary text |
| `--vp-c-border` | `#2a2a4a` | Borders, dividers |
| `--vp-c-accent` | `#a855f7` | Accent — bright purple |
| `--kglow-primary` | `rgba(183, 148, 246, 0.2)` | Lilac glow — hover effects |

**Plana atmosphere:** deep indigo-black, lilac primary, purple gradient. Feels intense, mysterious, elegant.

### 2.3 Theme Switching

- VitePress built-in dark mode toggle controls light/dark
- `html` element gets `.dark` class in dark mode
- All tokens are defined in `:root` (light) and `.dark` (dark) blocks
- No JavaScript needed — VitePress handles persistence via `localStorage`

---

## 3. Typography

### 3.1 Font Stack

**Body:**
```
'Outfit', -apple-system, BlinkMacSystemFont, 'Segoe UI', Roboto, sans-serif
```

**Headings (h1–h4, hero, feature titles):**
```
'Space Grotesk', 'Outfit', sans-serif
```

Outfit + Space Grotesk loaded from Google Fonts (preconnect in `config.mjs` head). System fonts as fallback. Matches the kivotos-landing brand.

### 3.2 Scale

| Token | Size | Weight | Line Height | Usage |
|-------|------|--------|-------------|-------|
| `--text-xs` | 12px | 400 | 1.5 | Captions, metadata |
| `--text-sm` | 14px | 400 | 1.6 | Body text |
| `--text-base` | 16px | 400 | 1.6 | Body large, lead text |
| `--text-lg` | 20px | 600 | 1.3 | H4, feature titles |
| `--text-xl` | 24px | 600 | 1.3 | H3 |
| `--text-2xl` | 32px | 700 | 1.2 | H2 |
| `--text-3xl` | 40px | 700 | 1.2 | H1 |
| `--text-4xl` | 48px | 800 | 1.1 | Hero title |

### 3.3 Code

```
'Fira Code', 'JetBrains Mono', 'Courier New', monospace
```

Code blocks use the monospace stack. Inline code inherits.

---

## 4. Border Radius

| Token | Value | Usage |
|-------|-------|-------|
| `--radius-sm` | 4px | Small elements — badges, inline code |
| `--radius-md` | 8px | **Default** — cards, buttons, code blocks |
| `--radius-lg` | 16px | Large surfaces — hero, modals |
| `--radius-xl` | 24px | Hero images, full-width sections |

---

## 5. Shadows

| Token | Value | Usage |
|-------|-------|-------|
| `--shadow-sm` | `0 1px 2px rgba(0,0,0,0.06)` | Subtle elevation |
| `--shadow-md` | `0 4px 8px rgba(0,0,0,0.08)` | Card hover, dropdowns |
| `--shadow-lg` | `0 8px 24px rgba(0,0,0,0.12)` | Modals, hero images |

---

## 6. Components

### 6.1 Navigation Bar
- Height: 56px (`--space-7`)
- Background: `var(--vp-c-bg-elv)` with `backdrop-filter: blur(8px)`
- Border-bottom: 1px `var(--vp-c-border)`
- Logo: 32px x 32px

### 6.2 Hero Section (Homepage)
- Logo: 128px x 128px, circular or transparent, with `--kglow-primary` drop-shadow
- Title: `--text-4xl`, `--vp-c-text-1`
- Tagline: `--text-lg`, `--vp-c-text-2`
- Actions: 8px border-radius, brand button uses `--vp-c-brand-1`

### 6.3 Feature Cards
- Background: `var(--vp-c-bg-soft)`
- Padding: 24px (`--space-3`)
- Border-radius: 8px (`--radius-md`)
- Hover: `translateY(-4px)`, `--shadow-md`
- Icon: 32px, `--vp-c-brand-soft` background

### 6.4 Content Pages
- Max width: 960px
- H2: `--text-2xl`, border-bottom 1px `--vp-c-divider`
- Code block: `--radius-md`, `var(--vp-code-block-bg)`
- Table: full-width, cells padded 16px

### 6.5 Buttons
- Border-radius: 8px
- Padding: 12px 24px (horizontal = 3x vertical)
- Font-weight: 600

### 6.6 Footer
- Border-top: 1px `--vp-c-divider`
- Padding: 32px (`--space-4`)
- Text: `--text-sm`, `--vp-c-text-2`

---

## 7. Glow Effects

- Hero logo: `drop-shadow(0 0 24px var(--kglow-primary))`
- Hover becomes: `drop-shadow(0 0 40px var(--kglow-primary))`
- Transition: 0.3s ease

This creates the halo effect — blue glow for Arona, red glow for Plana — matching their character motifs.

---

## 8. Responsive Behavior

| Breakpoint | Behavior |
|------------|----------|
| ≥ 960px | Desktop layout, sidebars visible |
| 768–960px | Collapsed sidebar, hamburger nav |
| < 768px | Single column, stacked features, reduced hero font sizes |

All spacing scales down proportionally — never break the 8px grid.

---

## 9. Motion

- Theme switch: `transition: 0.25s` on all color/border properties
- Feature cards: `transition: 0.2s` on transform and box-shadow
- No animation on initial page load (respects `prefers-reduced-motion`)

---

## 10. Accessibility

- All interactive elements must have visible focus ring (`2px solid var(--vp-c-brand-1)`, 2px offset)
- Color contrast ratio: minimum 4.5:1 for text, 3:1 for large text
- Theme toggle button labeled "Appearance" with context-specific titles
- Skip-to-content link (VitePress default)

---

*This design system is living. Propose changes via pull request to DESIGN.md.*
