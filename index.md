---
layout: default
format: blog-index
breadcrumb: false
permalink: /index.html
regenerate: true

widget1:
  title: "Technologies"
  url: '/technologies/'
  image: '/assets/img/widget-technologies.jpg'
  text: 'Our catalog of data transformation, data store and other associated technologies'
widget2:
  title: "Technology Categories"
  url: '/tech-categories/'
  image: '/assets/img/widget-tech-categories.jpg'
  text: 'The technology catalog, organised by category'
widget3:
  title: "Technology Vendors"
  url: '/tech-vendors/'
  image: '/assets/img/widget-tech-vendors.jpg'
  text: 'The technology catalog, organised by vendor'
widget4:
  title: "Forums"
  url: '{{ site.discourse_url }}'
  image: '/assets/img/widget-forums.png'
  text: 'Discourse forums for the discussion of data engineering topics and for collaborating on this site.'
---

<div class="row t50">
	{% if page.widget1.title %}
		{% include _frontpage-widget.html widget=page.widget1 %}
  {% endif %}

	{% if page.widget2.title %}
		{% include _frontpage-widget.html widget=page.widget2 %}
	{% endif %}

	{% if page.widget3.title %}
		{% include _frontpage-widget.html widget=page.widget3 %}
	{% endif %}
    
  {% if page.widget4.title %}
		{% include _frontpage-widget.html widget=page.widget4 %}
	{% endif %}
</div>

<div class="row t20">
    <div class="medium-6 text-center columns">
        <a class="button large radius {{ page.callforaction.style }}" href="/site/contributing/">This is an open collaborative site - click here for details on how to get involved</a>
    </div>
    <div class="medium-6 text-center columns">
        <a class="button large radius {{ page.callforaction.style }}" href="/site/subscribe/">Get site updates by RSS, e-mail or Twitter - click here for details on how to subscribe</a>
    </div>
</div>

<article><div class="row frontpage">
  <div class="medium-3 columns text-center">
    <h2 class="b20">Recent Changes</h2>
    
    {% assign count = 0 %}
    {% assign changes = site.documents | where_exp: "d", "d.collection <> 'posts'" | group_by: "date" | sort: "name" | reverse %}

    {% for c in changes %}
      {% if count < 50 %}
        <h2 class="t30">{{ c.name | date: "%Y-%m-%d" }}</h2>
        <ul class="no-bullet">
          {% assign items = c.items | sort: "id" %}
          {% for t in items %}
            <li><a href="{{ t.url }}">{{ t.title }}</a></li>
          {% endfor %}
        </ul>
        {% assign count = count | plus: c.items.size | plus: 4 %}
      {% endif %}
    {% endfor %}
  </div>

  <div class="medium-6 columns">
    <h2 class="text-center b20">Latest News and Posts</h2>

    {% for post in site.posts limit:5 %}
      {% include _post_summary.html reduced-metadata=true %}
    {% endfor %}
    
    {% if site.posts.size > 5 %}
      {% include _next-previous-buttons-large.html prev-name='Next' archive-name='Blog Archive' archive-url='/blog/archive/' next-name='Previous' next-url='/blog/page2' %}
    {% endif %}
  </div>

  <div class="medium-3 columns text-center">
    <h2 class="b20">Twitter Feed</h2>

    <a class="twitter-timeline" data-width="250" data-height="1300" data-dnt="true" data-theme="light" href="https://twitter.com/OnDataEng">Tweets by OnDataEng</a> <script async src="//platform.twitter.com/widgets.js" charset="utf-8"></script>
  </div>
</div></article>