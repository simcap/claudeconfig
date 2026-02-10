---
name: understand-hugo-project
description: Making sure we understand the layout of Hugo projects. Hugo is an open-source static website generators. Use when the user works with the Hugo stack.
---

Important: There can be multiple Hugo projects (i.e. static websites) in the working directory we are working in. Each projects would be independent!

A single Hugo project usually is a directory where either there is:

- a `hugo.{toml,yaml}` file present
- or a `hugo.{toml,yaml}` present in a the directory `config/_default/`

The name of the containing directory is basically the name of the Hugo project/website.

The Hugo project has then the following directory structure.

- `archetypes/` — templates for new content
- `assets/` — CSS, Sass, JavaScript, TypeScript, images (asset pipeline)
- `config/` — site configuration
- `content/` — Markdown content and page resources
- `data/` — data files (JSON, TOML, YAML, XML)
- `i18n/` — translation tables
- `layouts/` — HTML templates
- `static/` — files copied as-is to the built site (favicon, robots.txt, etc.)
- `themes/` — Hugo themes

Ignore `/public` and `/resources` — they are generated outputs.

Sometimes a `Caddyfile` is present in order to configure a Caddy server. Basically, it is the ultimate server used here mainly as a reverse proxy to host multiple websites with different hostnames on one instance.