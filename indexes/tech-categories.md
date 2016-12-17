---
layout: page
title: "Technology Categories"
description: "A catalogue of data transformation, data platform and other technologies used within the Data Engineering space, organised by category"
permalink: "/tech-categories/"
createable: true
create_text: "Have a new technology category page to add to this site?"
path: "_tech-categories"
discourse_category: "Technologies"
discourse_category_text: "Want to discuss any of these technologies?"
regenerate: true
---
{% assign t = site.tech-categories | sort: 'title' %}
{% include _list-technologies.html list=t %}