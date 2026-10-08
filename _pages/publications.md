---
title: Publications
description: "Formal research outputs such as papers, preprints, reports, and thesis-related writing."
permalink: /publications/
---
{% comment %}
Internal editing note:
- Keep this page public-facing and concise.
- Publication entry guidance belongs primarily in README.md.
- Prefer external links for formal outputs unless an internal detail page is clearly useful.
{% endcomment %}
# Publications

This section is reserved for formal research outputs such as papers, preprints, reports, or thesis-related writing.

{% assign pubs = site.publications | sort: 'date' | reverse %}
{% if pubs.size > 0 %}
<ul>
  {% for paper in pubs %}
    <li>
      <a href="{{ paper.url | relative_url }}">{{ paper.title }}</a>
      {% if paper.venue %} · <em>{{ paper.venue }}</em>{% endif %}
      {% if paper.status %} · {{ paper.status }}{% endif %}
    </li>
  {% endfor %}
</ul>
{% else %}
<div class="empty-state-card">
  <h2>Current Status</h2>
  <p>No formal publications are listed yet.</p>
  <p>This page is intentionally kept in place so that future outputs can be added without changing the overall site structure.</p>
</div>
{% endif %}
