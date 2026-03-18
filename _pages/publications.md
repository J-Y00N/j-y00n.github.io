---
title: Publications
permalink: /publications/
---
# Publications

Use this page for published papers, preprints, manuscripts in preparation, selected reports, or other writing that is strong enough to archive as a formal output.
Each item is a separate Markdown file inside `_publications/`.

At the current stage, it is completely reasonable for this section to include:

- preprints
- workshop or class reports
- technical manuscripts in preparation
- serious independent write-ups

The main standard is clarity about what the item is and what stage it is in.

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
No publications listed yet.
{% endif %}

## Recommended Metadata

When creating publication entries, try to include:

- title
- date
- venue
- status
- authors
- abstract or summary
- links to PDF, code, poster, or slides when available
