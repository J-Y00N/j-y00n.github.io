---
title: Research
permalink: /research/
---
# Research and Projects

This section collects longer technical efforts such as research projects, reproductions, experiments, and study-driven builds.
Each entry is written as a separate Markdown file inside `_projects/`.

At the moment, this page may include both formal research and serious independent work.
That is appropriate for the current stage of graduate preparation, as long as each entry is concrete about its goals, methods, and outcomes.

## What belongs here

- research projects
- replication or reproduction studies
- technically substantial course or independent projects
- model development and evaluation work
- signal analysis or data-analysis pipelines
- longer-term experiments that deserve documentation
- competition entries with meaningful technical substance
- personal research builds that are not formal publications

{% assign projects = site.projects | sort: 'date' | reverse %}
{% if projects.size > 0 %}
<div class="project-card-list">
  {% for project in projects %}
    <article class="project-card">
      <p class="project-card-meta">
        {% if project.status %}<span class="project-status">{{ project.status }}</span>{% endif %}
        {% if project.area %}<span>{{ project.area }}</span>{% endif %}
        {% if project.date %}<span>{{ project.date | date: '%Y-%m-%d' }}</span>{% endif %}
      </p>
      <h2 class="project-card-title">
        <a href="{{ project.url | relative_url }}">{{ project.title }}</a>
      </h2>
      {% if project.summary %}
      <p class="project-card-summary">{{ project.summary }}</p>
      {% endif %}
      {% if project.repo_url or project.report_url %}
      <p class="project-card-links">
        {% if project.repo_url %}<a class="profile-pill" href="{{ project.repo_url }}">GitHub</a>{% endif %}
        {% if project.report_url %}<a class="profile-pill" href="{{ project.report_url }}">Report</a>{% endif %}
      </p>
      {% endif %}
    </article>
  {% endfor %}
</div>
{% else %}
No projects listed yet.
{% endif %}

## Writing Guideline

For each project page, prefer clear descriptions of:

- the question or motivation
- the data or domain
- the methods used
- what was learned
- links to code, reports, figures, or slides

## Scope Note

It is completely reasonable to list personal projects, competition submissions, and independent technical work here, especially before formal publications exist.
The important thing is to present them honestly as projects or research builds rather than as published results.
