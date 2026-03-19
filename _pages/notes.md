---
title: Notes
permalink: /notes/
---
<!--
Internal editing note:
- Keep this page public-facing and concise.
- Notes writing guidance belongs primarily in README.md.
- Use this page as an index of public notes, not as a maintenance document.
-->
# Notes

This section collects reading notes, study logs, technical memos, and short essays.
It serves as a public record of ideas, methods, and questions worth revisiting.

{% assign notes = site.notes | sort: 'date' | reverse %}
{% if notes.size > 0 %}
<ul>
  {% for note in notes %}
    <li>
      <a href="{{ note.url | relative_url }}">{{ note.title }}</a>
      {% if note.date %} · {{ note.date | date: '%Y-%m-%d' }}{% endif %}
    </li>
  {% endfor %}
</ul>
{% else %}
<div class="empty-state-card">
  <h2>Current Status</h2>
  <p>No notes are listed yet.</p>
  <p>This page will gradually collect reading notes, technical memos, and short reflections as they are written.</p>
</div>
{% endif %}
