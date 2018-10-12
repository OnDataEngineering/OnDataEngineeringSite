#!/bin/bash -ex

date

# Build jekyll for production
JEKYLL_ENV=production time bundle exec jekyll b $1 | tee build.log

date
