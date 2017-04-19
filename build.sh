set -ex

# Build jekyll for production
JEKYLL_ENV=production bundle exec jekyll b $1

cd _site

# For some reason, on Windows jekyll creates files with UNIX line endings, which really confuses git
if [[ -n "$WINDIR" ]]
then
  find * -type f -exec unix2dos {} \; 
fi

# Discourse 1.6 doesn't like UTF-8 characters in the RSS feed (fixed in Discourse 1.7)
iconv -f UTF-8 -t ISO-8859-15 --unicode-subst='?' discourse_feed.xml > discourse_feed.xml.new
mv discourse_feed.xml.new discourse_feed.xml
