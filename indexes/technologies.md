---
layout: page
title: "Technologies"
permalink: "/technologies/"
createable: true
create_text: "Have a new technology page to add to this site?"
path: "_technologies"
discourse_category: "Technologies"
discourse_category_text: "Want to discuss any of these technologies?"
regenerate: true
---
{% assign t = site.technologies | sort: 'id' %}
{% include _list-technologies.html list=t %}