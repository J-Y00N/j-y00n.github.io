---
title: Research
permalink: /research/
---
<!--
Internal editing note:
- Keep this page visitor-facing and concise.
- Project maintenance guidance lives primarily in README.md.
- Add or update project entries in _projects/ and keep this page as a curated index.
-->
# Research and Projects

This section highlights current research-oriented projects in biosignals, machine learning, and related technical work.
It includes both independent research builds and longer-form experimental projects that reflect my present academic direction.

{% assign projects = site.projects | sort: 'date' | reverse %}
{% if projects.size > 0 %}
<div class="project-card-list">
  {% for project in projects %}
    <article class="project-card">
      <div class="project-card-body">
        {% if project.thumbnail_url %}
        <a class="project-card-media" href="{{ project.url | relative_url }}">
          <img src="{{ project.thumbnail_url | relative_url }}" alt="{{ project.title }}">
        </a>
        {% endif %}
        <div class="project-card-copy">
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
        </div>
      </div>
    </article>
  {% endfor %}
</div>
{% else %}
No projects listed yet.
{% endif %}
