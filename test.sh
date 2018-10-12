#!/bin/bash -ex

date

# Check build for errors
grep "Error:" build.log || true

# Run HTML proofer on generated _site directory, checking internal links only
time bundle exec htmlproofer --assume-extension --internal-domains "ondataengineering.net" --disable-external --checks-to-ignore "ScriptCheck,ImageCheck" --allow-hash-href ./_site

# Error if there were build errors
if grep -q "Error:" build.log; then
    exit 1
fi

date
