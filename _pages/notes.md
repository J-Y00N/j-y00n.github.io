---
title: Notes
permalink: /notes/
---
# Notes

This section is for reading notes, study logs, technical memos, and short essays.
Each entry is written as a separate Markdown file inside `_notes/`.

The purpose of this page is not frequent posting for its own sake.
It is to keep a public record of useful thinking, whether that comes from reading papers, working through methods, or reflecting on experiments.

## Good note types

- reading notes on papers or books
- derivations or concept explanations
- experiment logs and retrospectives
- technical memos for future reference
- short essays on research direction or methodology

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
No notes listed yet.
{% endif %}

## Writing Guideline

Notes do not need to be polished like publications.
They should still be readable, specific, and worth revisiting later.
