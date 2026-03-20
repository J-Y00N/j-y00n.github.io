---
title: Home
---
<div class="profile-intro">
  <aside class="profile-aside">
    <div class="profile-photo-slot">
      <div class="profile-photo-frame">
        <img src="{{ '/assets/images/profile.png' | relative_url }}" alt="Profile photo of J. Yoon">
      </div>
    </div>
    <div class="profile-links-card">
      <h2>Profile Links</h2>
      <div class="icon-link-grid">
        {% for link in site.data.profile_links %}
        <a class="icon-link" href="{{ link.url }}" aria-label="{{ link.label }}">
          {% include profile-link-icon.html icon=link.icon %}
          <span class="sr-only">{{ link.label }}</span>
        </a>
        {% endfor %}
      </div>
    </div>
    <div class="profile-links-card">
      <h2>Site Info</h2>
      <div class="meta-stack">
        <p><span>Status</span><code>[graduate applicant / researcher / student]</code></p>
        <p><span>Base</span><code>[institution or city]</code></p>
        <p><span>Updated</span><code>[YYYY-MM-DD]</code></p>
        <p><span>Visitors</span><code>[optional later]</code></p>
      </div>
    </div>
  </aside>
  <div class="profile-copy">
    <h2>J. Yoon</h2>
    <p>
      This website is a lightweight academic profile for graduate-school preparation,
      research documentation, and public technical writing. My current direction
      remains intentionally open across statistics, applied mathematics,
      computational neuroscience, BCI, machine learning, and computational science.
    </p>
    <p>
      I am especially drawn to work that combines mathematical structure, empirical
      data, and scientific interpretation. Rather than presenting a fixed label too
      early, this site is meant to document how those interests develop through
      projects, notes, and application materials.
    </p>

    <h2>Short Introduction</h2>
    <ul>
      <li>I am currently <code>[current status: undergraduate / graduate student / researcher / applicant]</code> at <code>[institution or context]</code>.</li>
      <li>My interests are centered on <code>[2-4 fields or themes]</code>.</li>
      <li>I am especially interested in <code>[problem types, methods, or domains]</code>.</li>
      <li>This site collects <code>[projects / notes / publications / application materials]</code> related to that work.</li>
    </ul>

    <h2>Focus Areas</h2>
    <ul>
      <li><code>[Focus area 1]</code></li>
      <li><code>[Focus area 2]</code></li>
      <li><code>[Focus area 3]</code></li>
      <li><code>[Focus area 4]</code></li>
      <li><code>[Focus area 5]</code></li>
    </ul>

    <h2>On This Site</h2>
    <dl class="site-map">
      <dt><a href="{{ '/about/' | relative_url }}">About</a></dt>
      <dd>A fuller narrative statement and academic background.</dd>

      <dt><a href="{{ '/research/' | relative_url }}">Research</a></dt>
      <dd>Projects, experiments, and research-oriented technical work.</dd>

      <dt><a href="{{ '/publications/' | relative_url }}">Publications</a></dt>
      <dd>Papers, reports, preprints, and future formal outputs.</dd>

      <dt><a href="{{ '/notes/' | relative_url }}">Notes</a></dt>
      <dd>Updates, notes, and short writing on ongoing work.</dd>

      <dt><a href="{{ '/cv/' | relative_url }}">CV</a></dt>
      <dd>Education, experience, and a concise academic record.</dd>
    </dl>

    <h2>News</h2>
    {% assign news_notes = site.notes | where_exp: "note", "note.news == true" %}
    {% if news_notes.size > 0 %}
    {% assign latest_notes = news_notes | sort: 'date' | reverse %}
    {% else %}
    {% assign latest_notes = site.notes | sort: 'date' | reverse %}
    {% endif %}
    {% if latest_notes.size > 0 %}
    <ul class="news-list">
      {% for note in latest_notes limit: 3 %}
      <li>
        {% if note.date %}
        <span class="news-date">{{ note.date | date: "%Y-%m-%d" }}</span>
        {% else %}
        <span class="news-date">Undated</span>
        {% endif %}
        <a href="{{ note.url | relative_url }}">{{ note.title }}</a>
      </li>
      {% endfor %}
    </ul>
    <p><a href="{{ '/notes/' | relative_url }}">See all notes and updates</a></p>
    {% else %}
    <div class="empty-state-card">
      <h3>Current Status</h3>
      <p>No updates are listed yet.</p>
    </div>
    {% endif %}
  </div>
</div>
