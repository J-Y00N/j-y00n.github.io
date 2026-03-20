# j-y00n.github.io

A lightweight academic website built with GitHub Pages and Jekyll.
The site is designed to be easy to maintain with Markdown-first content.

## Purpose

This repository is for a GitHub Pages site that can serve multiple stages of academic use:

- graduate application profile
- lightweight research homepage
- archive for projects, notes, and publications
- longer-term academic website after admission or graduation

The design goal is to keep content editing simple.
Most updates should require only Markdown edits, not template changes.

## Site Structure

- `index.md`: home page
- `_pages/`: fixed pages such as About, CV, Research, Publications, and Notes
- `_projects/`: one Markdown file per project or research entry
- `_publications/`: one Markdown file per paper, report, or preprint
- `_notes/`: one Markdown file per note or short post
- `_includes/`, `_layouts/`, `_sass/`: shared templates and styling
- `bin/`: small helper scripts for setup, build, and local preview
- `_site/`: generated output, never edit by hand

## Operating Principle

Use Markdown for content and touch templates only when the site's structure or appearance really needs to change.

- If you are adding or revising text, edit Markdown files
- If you are changing navigation or reusable page fragments, edit `_includes/`
- If you are changing the page skeleton, edit `_layouts/`
- If you are changing fonts, spacing, color, or page styling, edit `_sass/`
- Do not manually edit files inside `_site/`

## Local Development Environment

Use Bundler rather than Docker by default.
That gives you a project-local dependency set similar in spirit to a Python virtual environment.
This repository pins Ruby with `.ruby-version` and `.tool-versions`.

### Why this setup is recommended

- GitHub Pages already works naturally with Jekyll
- `Bundler` and `Gemfile.lock` are enough to pin Ruby gem dependencies
- Docker would add more maintenance overhead than value for a small personal site
- A Ruby version manager keeps the system Ruby out of the workflow

## One-Time Setup

1. Install a Ruby version manager such as `rbenv`, `asdf`, or `mise`
2. If you use `rbenv`, add `eval "$(rbenv init - zsh)"` to your shell startup file
3. Open a new shell
4. Move into this repository
5. Confirm the pinned Ruby is active with `ruby -v`
6. Run `./bin/setup`

If the repository is configured correctly, `ruby -v` should report the version from `.ruby-version`.

## Daily Workflow

### Start local preview

Run:

```bash
./bin/serve
```

The site will usually be available at `http://127.0.0.1:4000`.
This is the main command for writing and visually checking content.

### Run a build check

Run:

```bash
./bin/build
```

Use this before pushing if you want a quick production-style verification.

### Install or refresh dependencies

Run:

```bash
./bin/setup
```

Use this when:

- setting up the site on a new machine
- updating Ruby gems
- recovering from a broken local gem installation

## Content Editing Guide

### 1. Edit the home page

File:

- `index.md`

Use this for the first impression of the site:

- short self-positioning
- broad research direction
- links to the key sections
- current stage or short status note

### 2. Edit fixed pages

Files:

- `_pages/about.md`
- `_pages/cv.md`
- `_pages/research.md`
- `_pages/publications.md`
- `_pages/notes.md`

Use fixed pages for top-level sections that should always exist in navigation.

### 3. Add a new project

Create a new Markdown file inside `_projects/`.

Recommended naming pattern:

- `YYYY-MM-DD-short-project-name.md`

Recommended front matter:

```md
---
title: "Project Title"
date: 2026-03-19
summary: "One-line summary shown in the project list."
status: Ongoing
---
```

Suggested body structure:

- overview
- motivation
- methods
- current progress
- links to code, slides, report, or data

How this works in the site:

- each file in `_projects/` becomes one research entry
- `Research` automatically collects and lists those entries
- card metadata such as `summary`, `status`, `date`, `thumbnail_url`, `repo_url`, and `report_url` can be managed in front matter
- project images should live under `assets/images/research/`

### 4. Add a new note

Create a new Markdown file inside `_notes/`.

Recommended naming pattern:

- `YYYY-MM-DD-short-note-title.md`

Recommended front matter:

```md
---
title: "Note Title"
date: 2026-03-19
news: true
---
```

Good uses for notes:

- reading notes
- derivation notes
- experiment logs
- short technical essays
- application or research reflections

Optional home-news marker:

- set `news: true` on a note when you want it to appear in the homepage `News` section
- homepage `News` shows the latest three marked notes by date
- if no note is marked, homepage `News` falls back to recent notes

### 5. Add a new publication or report

Create a new Markdown file inside `_publications/`.

Recommended front matter:

```md
---
title: "Paper Title"
date: 2026-03-19
venue: "Preprint"
status: Draft
permalink: /publications/paper-title/
---
```

Recommended content:

- authors
- abstract or summary
- links to PDF, code, poster, or slides
- optional note on status such as submitted, in preparation, or published

Preferred linking rule:

- if a paper, preprint, or report has a stable external page, link to that external source first
- use an internal PDF only when you want to host a file directly on the site

### 6. Update the CV page

File:

- `_pages/cv.md`

This page can remain short even if you later provide a downloadable PDF.
Typical sections include:

- education
- research experience
- projects
- publications and preprints
- awards
- skills
- teaching or mentoring

## PDF Assets

Use `assets/files/` for PDFs that should be hosted directly in this site.

Recommended examples:

- `assets/files/cv.pdf`
- `assets/files/thesis.pdf`
- `assets/files/report-name.pdf`

General rule:

- use site-hosted PDFs for CVs, thesis files, or reports you want to serve directly
- use external links for journal pages, arXiv, DOI pages, or conference proceedings when available
- if a PDF belongs to a publication entry, link it from the publication item rather than duplicating file references across multiple pages

## Profile Image

Use `assets/images/profile.jpg` or `assets/images/profile.png` for the main profile image.

General rule:

- keep the main profile image at a stable top-level path under `assets/images/`
- keep research figures under `assets/images/research/`
- avoid mixing profile images with project-specific figures

## Writing Style Guidelines

For this site, prefer a tone that is:

- academically serious but not inflated
- clear about uncertainty where plans are still evolving
- specific about methods and interests
- concise on landing pages and fuller on project pages

Good principle:

- do not claim a finalized identity too early
- do describe stable research motivations and recurring themes

## Design and Maintenance Guidelines

- Keep navigation small and stable
- Prefer adding content over adding new page types
- Reuse the existing collections before inventing new structures
- Keep the homepage concise
- Put long-form detail into project, note, or publication pages
- Favor plain Markdown and simple links over custom embedded components

## Deployment

This repository is intended for GitHub Pages deployment through the `j-y00n.github.io` repository convention.

Basic deployment flow:

1. Make content or style changes
2. Run `./bin/build`
3. Commit and push to the default branch
4. Let GitHub Pages build and publish automatically

In the current local Git setup:

- remote: `origin -> https://github.com/J-Y00N/j-y00n.github.io.git`
- default working branch: `main`

That means pushes to `main` should be reflected on the public site automatically, assuming GitHub Pages is enabled for the repository.

## What to Edit for Common Tasks

- Change biography text: `index.md` or `_pages/about.md`
- Add a project: create a file in `_projects/`
- Add a note: create a file in `_notes/`
- Add a publication: create a file in `_publications/`
- Add or replace a profile image: put the file in `assets/images/profile.jpg` or `assets/images/profile.png`
- Add or replace a hosted PDF: put the file in `assets/files/`
- Change navigation links: `_includes/header.html`
- Change page layout: `_layouts/default.html`
- Change visual style: `_sass/_custom.scss`
- Change site-wide settings: `_config.yml`

## Environment Note

Do not rely on the macOS system Ruby for this project.
Use the repository-pinned Ruby through `rbenv`, `asdf`, or `mise`, then run the helper scripts.

## Troubleshooting

### The wrong Ruby version is active

Symptoms:

- `ruby -v` shows system Ruby
- `./bin/setup` says the Ruby version is wrong

Check:

- whether `rbenv` is installed
- whether `eval "$(rbenv init - zsh)"` is in `~/.zshrc`
- whether you opened a fresh interactive shell
- whether `.ruby-version` exists in the repository root

### `bundle install` fails

Try:

```bash
./bin/setup
```

If that still fails, verify:

- the correct Ruby version is active
- network access to `rubygems.org` is available
- `vendor/bundle/` is writable

### The site builds locally but looks wrong

Check:

- whether the relevant content file has valid front matter
- whether a permalink was typed incorrectly
- whether the page you changed belongs in `_pages/`, `_projects/`, `_notes/`, or `_publications/`
- whether the CSS change belongs in `_sass/_custom.scss`

### GitHub Pages deploys but a page is missing

Check:

- that the file has YAML front matter
- that the file is in the correct collection directory
- that `_config.yml` still lists the collection
- that the file name and permalink do not conflict with another page

## Future Extensions

Possible additions later, only if actually needed:

- downloadable CV PDF in `assets/files/`
- profile photo or portrait
- project thumbnails
- blog-like tagging for notes
- analytics or visitor metrics
- contact links and social links

Keep the current structure unless one of those additions clearly improves the site's real use.
