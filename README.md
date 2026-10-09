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
- `_projects/`: one Markdown file per project, shown as a summary with links
- `_publications/`: one Markdown file per paper, report, or preprint, shown the same way
- `_notes/`: one Markdown file per note or short post
- `_data/`: site data such as `profile_links.yml`
- `_layouts/`: page templates (`default`, `home`, `page`, `note`, and the list pages `project-index`, `note-index`, `publication-index`)
- `_includes/`: reusable fragments such as the header, footer, and summary cards
- `_sass/`: styling
- `bin/`: small helper scripts for setup, build, and local preview
- `_site/`: generated output, never edit by hand

## Operating Principle

Use Markdown for content and touch templates only when the site's structure or appearance really needs to change.

- If you are adding or revising text, edit Markdown files
- If you are changing contact links, edit `_data/profile_links.yml`
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

## One-Time Setup (macOS)

1. Install a Ruby version manager such as `rbenv`, `asdf`, or `mise`
2. If you use `rbenv`, add `eval "$(rbenv init - zsh)"` to your shell startup file
3. Open a new shell
4. Move into this repository
5. Confirm the pinned Ruby is active with `ruby -v`
6. Run `./bin/setup`

If the repository is configured correctly, `ruby -v` should report the version from `.ruby-version`.

## One-Time Setup (Windows with WSL2)

On Windows, work inside WSL2 with Ubuntu.
It is a real Linux environment, so the commands in this README work the same way as on macOS.

1. In PowerShell as administrator, run `wsl --install -d Ubuntu`, restart, and create the Ubuntu user
2. Install VS Code on Windows with the "Add to PATH" option, and add the `WSL` extension
3. In the Ubuntu terminal, install the build tools:

```bash
sudo apt update
sudo apt install -y git gh build-essential libssl-dev libyaml-dev zlib1g-dev libffi-dev
```

4. Install `rbenv` with `ruby-build`:

```bash
git clone https://github.com/rbenv/rbenv.git ~/.rbenv
git clone https://github.com/rbenv/ruby-build.git ~/.rbenv/plugins/ruby-build
echo 'eval "$(~/.rbenv/bin/rbenv init - bash)"' >> ~/.bashrc
eval "$(~/.rbenv/bin/rbenv init - bash)"
```

5. Set the same commit name and email as on the other computer:

```bash
git config --global user.name "Your Name"
git config --global user.email "your-id@users.noreply.github.com"
```

6. Clone into the Ubuntu home folder, not under `/mnt/c/`, then install the pinned Ruby and run the setup:

```bash
cd ~
git clone https://github.com/J-Y00N/j-y00n.github.io.git
cd j-y00n.github.io
rbenv install
./bin/setup
code .
```

`rbenv install` with no version reads `.ruby-version`, so this step stays correct when the pinned Ruby changes.

Notes:

- `code .` opens the folder in VS Code on Windows while the terminal and Ruby run in Ubuntu
- the local preview at `http://localhost:4000` opens in a Windows browser
- if it does not open, run `JEKYLL_HOST=0.0.0.0 ./bin/serve` and open port 4000 at the address that `hostname -I` prints
- before the first `git push`, run `gh auth login`, choose HTTPS, and let it authenticate Git

## Working on Two Computers

- start each session with `git pull`
- end each session with `git push`, so the other computer can continue from there
- keep one clone per computer, cloned from GitHub
- do not copy the folder between computers or sync it through a cloud drive, because `vendor/bundle/` holds gems built for one system
- run `./bin/setup` again after `Gemfile.lock` changes
- `.gitattributes` keeps line endings as LF on every computer

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

Each page and note can set `description` in its front matter.
It is used for search results and link previews.
On a project or publication, `description` is the summary shown on the card and in the CV.

### 1. Edit the home page

File:

- `index.md`

Use this for the first impression of the site:

- short self-positioning
- broad research direction
- research interests

Put the longer background and motivation in `_pages/about.md`.

How this works in the site:

- the body of `index.md` is plain Markdown and appears next to the profile photo
- the name above it comes from `author` in `_config.yml`, or from `heading` in `index.md`
- `photo` and `site_info` in its front matter fill the left column
- `site_info` values accept inline Markdown such as a link
- the `Updated` date in the left column is added automatically from the build date
- `Selected Publications` and `Selected Projects` list entries with `featured: true`
- `News` lists notes marked `news: true`

### 2. Edit fixed pages

Files:

- `_pages/about.md`
- `_pages/cv.md`
- `_pages/research.md`
- `_pages/publications.md`
- `_pages/notes.md`

Use fixed pages for top-level sections that should always exist in navigation.
A new page in `_pages/` gets the URL `/file-name/` unless it sets its own `permalink`.

How this works in the site:

- the heading at the top of the page comes from `heading`, or from `title` when `heading` is not set
- `title` also names the browser tab and link previews
- a new page does not join the menu by itself, so add its link in `_includes/header.html`
- Research, Notes, and Publications list their entries through their layout, so their Markdown file holds only the intro text
- keep the `layout:` line in `research.md`, `notes.md`, and `publications.md`, because it is what adds the list
- write section headings with `##`, because the page title is already the top heading

### 3. Add a new project

Create a new Markdown file inside `_projects/`.

Recommended naming pattern:

- `YYYY-MM-DD-short-project-name.md`
- `date` in the front matter sets the order of the list, newest first
- the date in the file name is used only when `date` is left out

Recommended front matter:

```md
---
title: "Project Title"
date: 2026-03-19
description: "One or two lines on the question and the main result."
status: Ongoing
featured: true
area: "Field / Method"
period: "2025.03 - 2025.06"
thumbnail_url: "/assets/images/research/short-project-name/figure.png"
links:
  - label: GitHub
    url: "https://github.com/..."
  - label: Report
    url: "https://..."
---
```

How this works in the site:

- each project is shown as a summary card on `Research`, not as a page of its own
- keep the details on the linked pages, such as a repository, report, paper, or blog post
- the body below the front matter is not published, so leave it empty
- `links` takes any address, for example GitHub, Hugging Face, a personal blog, a Notion page, or a lab or company post
- the label is free text, such as `Code`, `Model`, `Demo`, `Blog`, or `Slides`
- the first link also opens from the title and the thumbnail, so put the main destination first
- a link whose `url` is `"#"` or empty is skipped, and an entry without links shows its title as plain text
- a link to a file under `/assets/` shows even before the file exists, so add the file first
- a file hosted on this site can be linked as `/assets/files/name.pdf`
- `period` is optional, and the year of `date` is shown when it is missing
- `thumbnail_url` is optional, and the card uses the full width without it
- `featured: true` shows the project under `Selected Projects` on the home page and the CV
- project images should live under `assets/images/research/`

### 4. Add a new note

Create a new Markdown file inside `_notes/`.

Recommended naming pattern:

- `YYYY-MM-DD-short-note-title.md`
- the URL drops the date: `2026-03-19-short-note-title.md` becomes `/notes/short-note-title/`
- keep the part after the date unique, because two notes with the same name after the date share one URL, one of them is lost, and the build gives no warning
- start every file name with its date, or set `date` in the front matter, because a note without a date shows no date and goes to the end of the list
- a note dated in the future is published right away, so the date does not schedule it

Recommended front matter:

```md
---
title: "Note Title"
date: 2026-03-19
description: "One-line summary."
news: true
---
```

Notes are the only entries with a page of their own, so long-form writing belongs here.
Images use plain Markdown, for example `![Figure caption](/assets/images/notes/figure.png)`.

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
Publications work the same way as projects: a summary card with outside links.

Recommended naming pattern:

- `YYYY-MM-DD-short-paper-title.md`
- `date` in the front matter sets the order of the list, newest first
- the date in the file name is used only when `date` is left out

Recommended front matter:

```md
---
title: "Paper Title"
date: 2026-03-19
description: "One or two lines on the contribution."
authors: "J. Yoon, Coauthor A, and Coauthor B"
venue: "Preprint"
status: Draft
featured: true
thumbnail_url: "/assets/images/publications/paper-title.png"
links:
  - label: arXiv
    url: "https://arxiv.org/abs/..."
  - label: Code
    url: "https://github.com/..."
  - label: PDF
    url: /assets/files/paper-title.pdf
---
```

How this works in the site:

- `Publications` shows each entry as a summary card, the same as `Research`
- the body below the front matter is not published, so keep the abstract on the linked page
- `links` follows the same rules as for projects, and the first link opens from the title
- `featured: true` shows the entry under `Selected Publications` on the home page
- the CV lists every publication in the citation format below, built from `authors`, `title`, `venue`, `date`, and `status`

Preferred linking rule:

- if a paper, preprint, or report has a stable external page, link to that external source first
- use an internal PDF only when you want to host a file directly on the site

Recommended citation format:

```
J. Yoon, Coauthor A, and Coauthor B. "Paper Title." Journal or Conference Name, 2027. [Paper] [Code]
J. Yoon and Coauthor A. "Preprint Title." arXiv preprint, 2027. [arXiv]
J. Yoon. "Master's Thesis Title." Master's thesis, [University Name], 2027. [PDF]
```

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

How this works in the site:

- write education, research experience, awards, skills, and teaching as Markdown
- three include lines fill in sections automatically, so move a line to change where its section appears
  - `{% include cv-contact.html %}`: the name from `author` in `_config.yml`, the visible contact links, and a download button for the `cv` entry
  - `{% include cv-projects.html %}`: projects with `featured: true`
  - `{% include cv-publications.html %}`: every entry in `_publications/`
- `Selected Projects` and `Publications and Preprints` are left out while they have nothing to show

### 7. Update profile and contact links

File:

- `_data/profile_links.yml`

How this works in the site:

- the same list feeds the home page icons, the footer, and the CV contact section
- a link whose `url` is `"#"` or empty stays hidden until a real address is filled in
- use `mailto:name@example.com` for the email entry
- use a full address such as `https://...`, or a site path that starts with `/`
- a link to a file under `/assets/` appears only once that file exists, so the `CV (PDF)` entry appears once `assets/files/cv.pdf` is added
- `icon` takes `email`, `github`, `linkedin`, `scholar`, or `cv`, and any other value shows a plain dot
- the entry with `icon: cv` becomes the download button on the CV page instead of a contact line
- add a new icon in `_includes/profile-link-icon.html`

### 8. Keep an old address working

Files:

- `_pages/research.md`
- `_notes/2026-03-19-welcome.md`
- `_notes/2026-03-20-current-stage.md`

How this works in the site:

- `redirect_from` in front matter lists old addresses that forward to that page
- `_pages/research.md` forwards the old project pages under `/projects/` to `/research/`
- each note forwards its old dated address, such as `/notes/2026-03-19-welcome/`, to its current one
- keep these lines, because removing one breaks links that were already shared
- when you rename a page or a note, add its old address under `redirect_from`, with the trailing slash
- projects and publications have no page of their own, so put their old addresses on `_pages/research.md` or `_pages/publications.md`
- do not copy `redirect_from` into a new note, because the old address would then point to the new note

## PDF Assets

Use `assets/files/` for PDFs that should be hosted directly in this site.

Recommended examples:

- `assets/files/cv.pdf`
- `assets/files/thesis.pdf`
- `assets/files/report-name.pdf`

General rule:

- use site-hosted PDFs for CVs, thesis files, or reports you want to serve directly
- use external links for journal pages, arXiv, DOI pages, or conference proceedings when available
- if a PDF belongs to a publication entry, add it to that entry's `links` rather than duplicating file references across multiple pages

## Profile Image

Use `assets/images/profile.jpg` or `assets/images/profile.png` for the main profile image.

General rule:

- keep the main profile image at a stable top-level path under `assets/images/`
- keep figures under `assets/images/research/`, `assets/images/publications/`, or `assets/images/notes/`
- avoid mixing profile images with project-specific figures
- if the image file name changes, also update `photo` in `index.md` and the default `image` in `_config.yml`

## Writing Style Guidelines

For this site, prefer a tone that is:

- academically serious but not inflated
- clear about uncertainty where plans are still evolving
- specific about methods and interests
- concise on landing pages and summary cards, and fuller in notes and on the linked pages

Good principle:

- do not claim a finalized identity too early
- do describe stable research motivations and recurring themes

## Design and Maintenance Guidelines

- Keep navigation small and stable
- Prefer adding content over adding new page types
- Reuse the existing collections before inventing new structures
- Keep the homepage concise
- Put long-form detail into notes or into the pages that projects and publications link to
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

- Change the short introduction or research interests: `index.md`
- Change the longer background: `_pages/about.md`
- Change contact links: `_data/profile_links.yml`
- Add a project: create a file in `_projects/`
- Add a note: create a file in `_notes/`
- Add a publication: create a file in `_publications/`
- Replace the profile image: overwrite `assets/images/profile.png`, or add a new file and update `photo` in `index.md` and `image` in `_config.yml`
- Add or replace a hosted PDF: put the file in `assets/files/`
- Change navigation links: `_includes/header.html`
- Change the shared page frame: `_layouts/default.html`
- Change how note pages look: `_layouts/note.html`
- Change how the Research, Notes, or Publications lists look: `_layouts/project-index.html`, `_layouts/note-index.html`, `_layouts/publication-index.html`
- Change the summary card for projects and publications: `_includes/entry-card.html` and `_includes/entry-links.html`
- Change the footer: `_includes/footer.html`
- Change the home page sections such as Selected Projects or News: `_layouts/home.html`
- Change the automatic CV sections: `_includes/cv-contact.html`, `_includes/cv-projects.html`, `_includes/cv-publications.html`, `_includes/citation.html`
- Show a project or publication on the home page: set `featured: true` in its front matter
- Change visual style: `_sass/_custom.scss`
- Change site-wide settings: `_config.yml`

## Environment Note

Do not rely on the macOS system Ruby or the Ruby from `apt` for this project.
Use the repository-pinned Ruby through `rbenv`, `asdf`, or `mise`, then run the helper scripts.
`Gemfile.lock` uses `github-pages` 232, the version shown in the GitHub Pages build log.
When the build log shows a newer version, run `bundle update github-pages`, then `./bin/build`, and commit `Gemfile.lock` if the build is clean.

## Troubleshooting

### The wrong Ruby version is active

Symptoms:

- `ruby -v` shows system Ruby
- `./bin/setup` says the Ruby version is wrong

Check:

- whether `rbenv` is installed
- whether `eval "$(rbenv init - zsh)"` is in `~/.zshrc` on macOS, or `eval "$(~/.rbenv/bin/rbenv init - bash)"` is in `~/.bashrc` on WSL
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

If it fails while compiling `nokogiri`, check that `PLATFORMS` in `Gemfile.lock` lists your system: `arm64-darwin` on macOS, `x86_64-linux` on WSL, or `aarch64-linux` on WSL with an ARM processor.
Add a missing one with `bundle lock --add-platform <platform>`, then run `./bin/setup` again.

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
- that `_config.yml` still lists `_pages` under `include`
- that no other note has the same name after the date, since the note URL drops the date
- for a project or publication, that it appears on `Research` or `Publications`, since it has no page of its own

### A profile link or the CV PDF does not show

Check:

- that its `url` in `_data/profile_links.yml` is not `"#"` or empty
- that a file under `/assets/` exists at exactly that path, including upper and lower case

## Future Extensions

Possible additions later, only if actually needed:

- blog-like tagging for notes
- analytics or visitor metrics

Keep the current structure unless one of those additions clearly improves the site's real use.
