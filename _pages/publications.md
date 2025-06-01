<!-- _pages/publications.md -->
---
layout: default
title: Publications
permalink: /publications/
---

# Publications

{% assign pubs = site.publications | sort: "date" | reverse %}
<ul>
  {% for paper in pubs %}
    <li>
      <a href="{{ paper.url | relative_url }}">{{ paper.title }}</a>
      {% if paper.venue %} · <em>{{ paper.venue }}</em>{% endif %}
    </li>
  {% endfor %}
</ul>
