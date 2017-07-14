set -ex

# Build jekyll for production
JEKYLL_ENV=production bundle exec jekyll b $1

cd _site

# For some reason, on Windows jekyll creates files with UNIX line endings, which really confuses git
if [[ -n "$WINDIR" ]]
then
  find * -type f -exec unix2dos {} \; 
fi