# Modern CSS Examples

64 modern CSS tips comparing outdated patterns with their modern replacements.
Source: [modern-css.com](https://modern-css.com/#all-comparisons)

---

## 1. Perceptually Uniform Colors with OKLCH

**Bad:**
```css
--brand: #4f46e5;
--brand-light: #818cf8;
--brand-dark: #3730a3;
```

**Good:**
```css
--brand: oklch(0.55 0.2 264);
--brand-light: oklch(0.75 0.2 264);
```

---

## 2. Frosted Glass Effect Without Opacity Hacks

**Bad:**
```css
.card::before {
  background-image: url(bg.jpg);
  filter: blur(12px);
  z-index: -1;
}
```

**Good:**
```css
.glass {
  backdrop-filter: blur(12px);
  background: rgba(255, 255, 255, 0.1);
}
```

---

## 3. Preventing Layout Shift from Scrollbar

**Bad:**
```css
body {
  overflow-y: scroll;
}
/* or */
body {
  padding-right: 17px;
}
```

**Good:**
```css
body {
  scrollbar-gutter: stable;
}
```

---

## 4. Preventing Scroll Chaining Without JavaScript

**Bad:**
```js
modal.addEventListener('wheel', (e) => e.preventDefault());
```

**Good:**
```css
.modal-content {
  overflow-y: auto;
  overscroll-behavior: contain;
}
```

---

## 5. Responsive Images Without Background-Image Hack

**Bad:**
```css
.card-image {
  background-image: url(...);
  background-size: cover;
  background-position: center;
}
```

**Good:**
```css
img {
  object-fit: cover;
  width: 100%;
  height: 200px;
}
```

---

## 6. Form Validation Styles Without JavaScript

**Bad:**
```js
// JS: add .touched on blur, then
.touched:invalid { color: red; }
```

**Good:**
```css
input:user-invalid {
  border-color: red;
}
input:user-valid {
  border-color: green;
}
```

---

## 7. Auto-Growing Textarea Without JavaScript

**Bad:**
```js
el.addEventListener('input', () => {
  el.style.height = el.scrollHeight + 'px';
});
```

**Good:**
```css
textarea {
  field-sizing: content;
  min-height: 3lh;
}
```

---

## 8. Smooth Height Auto Animations Without JavaScript

**Bad:**
```js
el.style.height = el.scrollHeight + 'px';
el.addEventListener('transitionend', ...);
```

**Good:**
```css
:root {
  interpolate-size: allow-keywords;
}
.accordion {
  height: 0;
  transition: height 0.3s ease;
}
.accordion.open {
  height: auto;
}
```

---

## 9. Range Style Queries Without Multiple Blocks

**Bad:**
```css
@container style(--p: 51%) {
}
@container style(--p: 52%) {
}
```

**Good:**
```css
@container style(--progress > 50%) {
  .bar {
    ...;
  }
}
```

---

## 10. Sticky & Snapped Element Styling Without JavaScript

**Bad:**
```js
window.addEventListener('scroll', () => {
  /* check position */
});
```

**Good:**
```css
@container scroll-state(stuck: top) {
  .header {
    ...;
  }
}
```

---

## 11. Typed Attribute Values Without JavaScript

**Bad:**
```js
el.style.width = el.dataset.pct + '%';
```

**Good:**
```css
.bar {
  width: attr(data-pct type(<percentage>));
}
```

---

## 12. Inline Conditional Styles Without JavaScript

**Bad:**
```js
el.classList.toggle('primary', isPrimary);
```

**Good:**
```css
.btn {
  background: if(style(--variant: primary): blue; else: gray);
}
```

---

## 13. Reusable CSS Logic Without Sass Mixins

**Bad:**
```scss
@function fluid($min, $max) {
  @return clamp(...);
}
```

**Good:**
```css
@function --fluid(--min, --max) {
  @return clamp(...);
}
```

---

## 14. Corner Shapes Beyond Rounded Borders

**Bad:**
```css
.card {
  clip-path: polygon(/* 20+ points */);
}
```

**Good:**
```css
.card {
  border-radius: 2em;
  corner-shape: squircle;
}
```

---

## 15. Responsive Clip Paths Without SVG

**Bad:**
```css
.shape {
  clip-path: path('M0 200 L100 0...');
}
```

**Good:**
```css
.shape {
  clip-path: shape(from 0% 100%, ...);
}
```

---

## 16. Scroll Spy Without IntersectionObserver

**Bad:**
```js
const observer = new IntersectionObserver(cb);
```

**Good:**
```css
nav a:target-current {
  color: var(--accent);
}
```

---

## 17. Filling Available Space Without Calc Workarounds

**Bad:**
```css
.full {
  width: calc(100% - 40px);
}
```

**Good:**
```css
.full {
  width: stretch;
}
```

---

## 18. Staggered Animations Without Nth-Child Hacks

**Bad:**
```css
li:nth-child(1) {
  --i: 0;
}
li:nth-child(2) {
  --i: 1;
}
```

**Good:**
```css
li {
  transition-delay: calc(0.1s * (sibling-index() - 1));
}
```

---

## 19. Carousel Navigation Without JavaScript Library

**Bad:**
```js
new Swiper('.carousel', {
  navigation: { ... },
  pagination: { ... },
});
```

**Good:**
```css
.carousel::scroll-button(right) {
  content: ">";
}
```

---

## 20. Vertical Text Centering Without Padding Hacks

**Bad:**
```css
.btn {
  padding: 10px 20px;
  padding-top: 8px; /* hack */
}
```

**Good:**
```css
h1,
button {
  text-box: trim-both cap alphabetic;
}
```

---

## 21. Hover Tooltips Without JavaScript Events

**Bad:**
```js
btn.addEventListener('mouseenter', () => showTooltip());
```

**Good:**
```html
<button interestfor="tip">Hover me</button>
<div id="tip" popover="hint">...</div>
```

---

## 22. Modal Controls Without Onclick Handlers

**Bad:**
```html
<button onclick="document.querySelector('#dlg').showModal()">Open</button>
```

**Good:**
```html
<button commandfor="dlg" command="show-modal">Open</button>
<dialog id="dlg">...</dialog>
```

---

## 23. Dialog Light Dismiss Without Click-Outside Listeners

**Bad:**
```js
dialog.addEventListener('click', (e) => {
  /* check bounds */
});
```

**Good:**
```html
<dialog closedby="any">Click outside to close</dialog>
```

---

## 24. Customizable Selects Without JavaScript Library

**Bad:**
```js
new Choices('#my-select'); /* rebuilds DOM */
```

**Good:**
```css
select {
  appearance: base-select;
}
```

---

## 25. Vivid Colors Beyond sRGB

**Bad:**
```css
.hero {
  color: rgb(200, 80, 50); /* sRGB only */
}
```

**Good:**
```css
.hero {
  color: oklch(0.7 0.25 29);
}
```

---

## 26. Color Variants Without Sass Functions

**Bad:**
```scss
/* Sass: lighten($brand, 20%), darken($brand, 10%) */
```

**Good:**
```css
.btn {
  background: oklch(from var(--brand) calc(l + 0.2) c h);
}
```

---

## 27. Multiline Text Truncation Without JavaScript

**Bad:**
```js
/* JS: slice text, then */
.card-title { overflow: hidden; }
```

**Good:**
```css
.card-title {
  display: -webkit-box;
  -webkit-line-clamp: 3;
  line-clamp: 3;
}
```

---

## 28. Drop Caps Without Float Hacks

**Bad:**
```css
.drop-cap::first-letter {
  float: left;
  font-size: 3em;
  line-height: 1;
}
```

**Good:**
```css
.drop-cap::first-letter {
  initial-letter: 3;
}
```

---

## 29. Positioning Shorthand Without Four Properties

**Bad:**
```css
.overlay {
  top: 0;
  right: 0;
  bottom: 0;
  left: 0;
}
```

**Good:**
```css
.overlay {
  position: absolute;
  inset: 0;
}
```

---

## 30. Lazy Rendering Without IntersectionObserver

**Bad:**
```js
new IntersectionObserver((entries) => {
  /* render */
}).observe(el);
```

**Good:**
```css
.section {
  content-visibility: auto;
  contain-intrinsic-size: auto 500px;
}
```

---

## 31. Dropdown Menus Without JavaScript Toggles

**Bad:**
```css
.menu {
  display: none;
}
.menu.open {
  display: block;
}
```

**Good:**
```css
button[popovertarget="menu"] {
}
#menu[popover] {
  position: absolute;
}
```

---

## 32. Tooltip Positioning Without JavaScript

**Bad:**
```js
/* Popper.js / Floating UI: compute, position, update on scroll */
```

**Good:**
```css
.trigger {
  anchor-name: --tip;
}
.tooltip {
  position-anchor: --tip;
  top: anchor(bottom);
}
```

---

## 33. Scoped Styles Without BEM Naming

**Bad:**
```css
/* BEM: .card__title, .card__body */
.card__title {
  ...;
}
```

**Good:**
```css
@scope (.card) {
  .title {
    font-size: 1.25rem;
  }
  .body {
    color: #444;
  }
}
```

---

## 34. Typed Custom Properties Without JavaScript

**Bad:**
```css
:root {
  --hue: 0;
}
/* hsl(var(--hue), ...) — no interpolation */
```

**Good:**
```css
@property --hue {
  syntax: "<angle>";
  inherits: false;
  initial-value: 0deg;
}
```

---

## 35. Independent Transforms Without Shorthand

**Bad:**
```css
.icon {
  transform: translateX(10px) rotate(45deg) scale(1.2);
}
```

**Good:**
```css
.icon {
  translate: 10px 0;
  rotate: 45deg;
  scale: 1.2;
}
```

---

## 36. Animating Display None Without Workarounds

**Bad:**
```js
el.addEventListener('transitionend', () => {
  /* then display:none */
});
```

**Good:**
```css
.panel {
  transition: opacity 0.2s, overlay 0.2s;
  transition-behavior: allow-discrete;
}
.panel.hidden {
  opacity: 0;
  display: none;
}
```

---

## 37. Entry Animations Without JavaScript Timing

**Bad:**
```js
requestAnimationFrame(() => {
  el.classList.add('visible');
});
```

**Good:**
```css
.card {
  @starting-style {
    opacity: 0;
    transform: translateY(10px);
  }
}
```

---

## 38. Page Transitions Without Framework

**Bad:**
```js
Barba.init({
  /* transition hooks */
});
```

**Good:**
```css
/* JS: document.startViewTransition(() => updateDOM()); */
.hero {
  view-transition-name: hero;
}
```

---

## 39. Scroll Snapping Without Carousel Library

**Bad:**
```js
$('.carousel').slick({
  /* touchstart/scroll handlers */
});
```

**Good:**
```css
.carousel {
  scroll-snap-type: x mandatory;
}
.carousel > * {
  scroll-snap-align: start;
}
```

---

## 40. Balanced Headlines Without Manual Line Breaks

**Bad:**
```html
<!-- manual <br> or Balance-Text.js -->
<h1>Long headline<br />text here</h1>
```

**Good:**
```css
h1,
h2 {
  text-wrap: balance;
}
```

---

## 41. Font Loading Without Invisible Text

**Bad:**
```css
@font-face {
  /* Default: text invisible until font loads */
}
```

**Good:**
```css
@font-face {
  font-family: "MyFont";
  font-display: swap;
}
```

---

## 42. Multiple Font Weights Without Multiple Files

**Bad:**
```css
@font-face {
  font-weight: 400;
}
@font-face {
  font-weight: 700;
}
```

**Good:**
```css
@font-face {
  font-family: "MyVar";
  font-weight: 100 900;
}
```

---

## 43. Dark Mode Defaults Without Extra CSS

**Bad:**
```css
@media (prefers-color-scheme: dark) {
  input,
  select,
  textarea {
    ...;
  }
}
```

**Good:**
```css
:root {
  color-scheme: light dark;
}
```

---

## 44. Dark Mode Colors Without Duplicating Values

**Bad:**
```css
@media (prefers-color-scheme: dark) {
  color: #eee;
}
```

**Good:**
```css
:root {
  color-scheme: light dark;
}
.text {
  color: light-dark(#111, #eee);
}
```

---

## 45. Low-Specificity Resets Without Complicated Selectors

**Bad:**
```css
.reset ul,
.reset ol {
  /* specificity (0,1,1) */
}
```

**Good:**
```css
:where(ul, ol) {
  margin: 0;
  padding-inline-start: 1.5rem;
}
```

---

## 46. Direction-Aware Layouts Without Left/Right

**Bad:**
```css
margin-left: 1rem;
[dir="rtl"] .box {
  margin-right: 1rem;
  margin-left: 0;
}
```

**Good:**
```css
.box {
  margin-inline-start: 1rem;
  padding-inline-end: 1rem;
  border-block-start: 1px solid;
}
```

---

## 47. Naming Grid Areas Without Line Numbers

**Bad:**
```css
.item {
  float: left;
  grid-column: 1 / 3;
  grid-row: 2;
}
```

**Good:**
```css
.layout {
  display: grid;
  grid-template-areas:
    "header header"
    "sidebar main"
    "footer footer";
}
```

---

## 48. Aligning Nested Grids Without Duplicating Tracks

**Bad:**
```css
.child-grid {
  grid-template-columns: 1fr 1fr 1fr; /* duplicate parent tracks */
}
```

**Good:**
```css
.child-grid {
  display: grid;
  grid-template-columns: subgrid;
}
```

---

## 49. Modal Dialogs Without JavaScript Library

**Bad:**
```css
.overlay {
  position: fixed;
  z-index: 999;
}
/* + JavaScript to toggle */
```

**Good:**
```css
dialog {
  padding: 1rem;
}
dialog::backdrop {
  background: rgb(0 0 0 / 0.5);
}
```

---

## 50. Styling Form Controls Without Rebuilding

**Bad:**
```css
input[type="checkbox"] {
  appearance: none;
  /* + 20 lines of custom styles */
}
```

**Good:**
```css
input[type="checkbox"],
input[type="radio"] {
  accent-color: #7c3aed;
}
```

---

## 51. Grouping Selectors Without Repetition

**Bad:**
```css
.card h1,
.card h2,
.card h3,
.card h4 {
  margin-bottom: 0.5em;
}
```

**Good:**
```css
.card :is(h1, h2, h3, h4) {
  margin-bottom: 0.5em;
}
```

---

## 52. Focus Styles Without Annoying Mouse Users

**Bad:**
```css
:focus {
  outline: 2px solid blue; /* shows on click too */
}
```

**Good:**
```css
:focus-visible {
  outline: 2px solid var(--focus-color);
}
```

---

## 53. Controlling Specificity Without !important

**Bad:**
```css
.card .title {
  ...;
}
.page .card .title.special {
  color: red !important;
}
```

**Good:**
```css
@layer base, components, utilities;

@layer utilities {
  .mt-4 {
    margin-top: 1rem;
  }
}
```

---

## 54. Theme Variables Without Preprocessor

**Bad:**
```scss
/* Sass */
$primary: #7c3aed;
.btn {
  background: $primary;
}
```

**Good:**
```css
:root {
  --primary: #7c3aed;
}
.btn {
  background: var(--primary);
}
```

---

## 55. Fluid Typography Without Media Queries

**Bad:**
```css
h1 {
  font-size: 1rem;
}
@media (min-width: 600px) {
  h1 {
    font-size: 1.5rem;
  }
}
```

**Good:**
```css
h1 {
  font-size: clamp(1rem, 2.5vw, 2rem);
}
```

---

## 56. Spacing Elements Without Margin Hacks

**Bad:**
```css
.grid > * {
  margin-right: 16px;
}
.grid > *:last-child {
  margin-right: 0;
}
```

**Good:**
```css
.grid {
  display: flex;
  gap: 16px;
}
```

---

## 57. Aspect Ratios Without Padding Hack

**Bad:**
```css
.wrapper {
  padding-top: 56.25%;
  position: relative;
}
.inner {
  position: absolute;
  inset: 0;
}
```

**Good:**
```css
.video-wrapper {
  aspect-ratio: 16 / 9;
}
```

---

## 58. Sticky Headers Without JavaScript Listeners

**Bad:**
```js
/* scroll listener + getBoundingClientRect + class toggle */
window.addEventListener('scroll', () => { ... });
```

**Good:**
```css
.header {
  position: sticky;
  top: 0;
}
```

---

## 59. Scroll-Linked Animations Without Library

**Bad:**
```js
/* IntersectionObserver: 15+ lines */
const observer = new IntersectionObserver(cb);
observer.observe(el);
```

**Good:**
```css
.element {
  animation-timeline: view();
  animation-range: entry;
  /* GPU-accelerated */
}
```

---

## 60. Nesting Selectors Without Sass/Less

**Bad:**
```scss
/* requires Sass */
.nav {
  & a {
    color: #888;
  }
}
```

**Good:**
```css
/* plain CSS, no build step */
.nav {
  & a {
    color: #888;
  }
}
```

---

## 61. Responsive Components Without Media Queries

**Bad:**
```css
/* viewport-based */
@media (max-width: 768px) {
  .card {
    ...;
  }
}
```

**Good:**
```css
@container (width < 400px) {
  .card {
    flex-direction: column;
  }
}
```

---

## 62. Mixing Colors Without Preprocessor

**Bad:**
```scss
/* Sass */
$blend: mix($blue, $pink, 60%);
```

**Good:**
```css
.element {
  background: color-mix(in oklch, #3b82f6, #ec4899);
}
```

---

## 63. Selecting Parent Elements Without JavaScript

**Bad:**
```js
el.closest('.parent').classList.add('has-image');
```

**Good:**
```css
.card:has(img) {
  grid-template: auto 1fr;
}
```

---

## 64. Centering Elements Without Transform Hack

**Bad:**
```css
.centered {
  position: absolute;
  top: 50%;
  left: 50%;
  transform: translate(-50%, -50%);
}
```

**Good:**
```css
.parent {
  display: grid;
  place-items: center;
}
```
