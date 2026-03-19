---
title: Publications
permalink: /publications/
---
# Publications

This section is reserved for formal research outputs such as published papers, preprints, technical reports, theses, or other archival writing.

At the moment, no formal publications are listed here yet.
That is a normal state for an early-stage academic profile.

When results become available, this page can grow into a clean bibliography-style record of:

- journal articles
- conference papers
- preprints
- technical reports
- thesis-related writing
- other formal research outputs

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

## When This Section Becomes Active

Once you have a formal output, prefer a reference-style entry with direct external links rather than a long internal write-up.

Typical links may include:

- publisher or journal page
- DOI page
- arXiv or other archive
- OpenReview or conference page
- code repository
- poster or slides

## Suggested Entry Format

When creating publication entries, try to include:

- title
- date
- venue
- status
- authors
- abstract or summary
- links to PDF, code, poster, or slides when available

## Scope Note

Projects, experiments, competition work, and independent technical builds usually belong in [Research]({{ '/research/' | relative_url }}) unless they have become formal written outputs.
