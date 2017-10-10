#!/bin/bash -ex

date

# Run HTML proofer on generated _site directory, checking internal links only
time bundle exec htmlproofer --assume-extension --internal-domains "ondataengineering.net" --disable-external --checks-to-ignore "ScriptCheck,ImageCheck" --allow-hash-href ./_site 2>&1 | tee output.log

date
