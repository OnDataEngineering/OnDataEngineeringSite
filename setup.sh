#!/bin/bash -e

if [[ $# -ne 2 ]]
then
  echo "Usage: `basename $0` <content_dir> <site_dir>"
  exit -1
fi

if [[ ! -d $1 ]]
then
  echo "$1 is not a directory"
  exit -1
fi

if [[ ! -d $2 ]]
then
  echo "$2 is not a directory"
  exit -1
fi

set -x

# Link content and site directories

ln -snf $1 _content
ln -snf $2 _site

# Link internal directories
# We don't check these in as it causes Windows all sorts of issues

ln -snf _content/_drafts _drafts
ln -snf _content/_posts _posts
ln -snf _content/_technologies _technologies
ln -snf _content/_tech-categories _tech-categories
ln -snf _content/_tech-vendors _tech-vendors
ln -snf ../_content/_templates _includes/templates
ln -snf ../_content/_includes/shared _includes/shared
ln -snf ../_content/_data/shared _data/shared
ln -snf _content/images images
ln -snf _content/indexes indexes
ln -snf shared/authors.yml _data/authors.yml