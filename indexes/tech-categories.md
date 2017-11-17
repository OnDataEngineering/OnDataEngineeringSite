---
layout: page
title: "Technology Categories"
description: "A catalogue of data transformation, data platform and other technologies used within the Data Engineering space, organised by category"
permalink: "/tech-categories/"
regenerate: true
---
{% assign t = site.tech-categories | sort: 'title' %}
{% include _list-technologies.html list=t %}