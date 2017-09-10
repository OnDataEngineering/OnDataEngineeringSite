#!/bin/bash -ex

# Get site commit short hash
export SITE_COMMIT_HASH="$(git log --format=%h -n 1)"

# Get content commit
cd _content
export CONTENT_COMMIT_MESSAGE="$(git log --oneline -n 1)"
cd ..

# Commit changes
cd _site
git add -A
git status
git config --global user.email "$ODE_COMMIT_EMAIL"
git config --global user.name "$ODE_COMMIT_NAME"
git config --global push.default simple
git commit -m "$COMMIT_MESSAGE"

# Publish changes
git push