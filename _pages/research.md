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

{% assign projects = site.projects | sort: 'date' | reverse %}
{% if projects.size > 0 %}
<ul>
  {% for project in projects %}
    <li>
      <a href="{{ project.url | relative_url }}">{{ project.title }}</a>
      {% if project.summary %} - {{ project.summary }}{% endif %}
    </li>
  {% endfor %}
</ul>
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
