# OnDataEngineering.net Source Code

This is the source code for the [OnDataEngineering](http://OnDataEngineering.net) site.  This repo does not contain the site content (which is available at <https://github.com/OnDataEngineering/OnDataEngineering>), see the instructions below for details of how to link this content in and build the site.

This is a private repo, and the contents of this repo are therefore not available under licence.  For details of the licensing of the content of the [OnDataEngineering](http://ondataengineering.net) site, please see <http://ondataengineering.net/site/content-license/> or <https://github.com/OnDataEngineering/OnDataEngineering>. 

## Building and serving site

### Dependencies

Install the latest stable version of Ruby v2 from <http://www.ruby-lang.org/en/downloads/>.  Under Windows, you'll also need to install the appropriate development kit - see <http://jekyll-windows.juthilo.com/1-ruby-and-devkit/>.

Install the latest stable version of RubyGems from <http://rubygems.org/pages/download>

Install the required ruby gems (including Jekyll) via "gem install bundler" and "bundle install".

### Linking to content site

Before building, the content on the site must be linked as follows:

Clone/checkout the content repo <https://github.com/OnDataEngineering/OnDataEngineering>

Run the setup.sh script in the root of this repo passing the name of the directory the content repo was checked out to in the previous step.  This will create softlinks for _drafts, _posts, _technologies and images to the content repo, along with linking the content templates into _includes/templates so these can be presented when creating pages through the site.  Note that this script should work under both Unix and Windows, but has only been tested under Windows.  Note that use under Windows requires NTFS.

If you get a "readlink(xxx): Function not implemented" error, then run "git config --replace-all core.symlinks true" to turn on git support for symlinks.

### Serving site

For development using localhost and port 4000:

    bundle exec jekyll serve --config _config.yml,_config_dev.yml

For development using ondataengineering.local and port 80 (for testing integration with Discourse):

    bundle exec jekyll serve --config _config.yml,_config_dev2.yml -P 80

For production:

    JEKYLL_ENV=production bundle exec jekyll serve --config _config.yml --port 80

Feel free to turn on incremental builds (--incremental) - this should work ok

### Build process

Compilation of SASS code and the minification of the resulting CSS is handled by jekyll.  Note that the minification of CSS is disabled if using either of the config_dev config files

Minification of HTML is handled by the top level compress layout.  Note that this is only enabled if JEKYLL_ENV is set to "production"

Minification of JavaScript is handled by a script within the _js_source folder that uses the [minify npm package](https://www.npmjs.com/package/minifier).  All JavaScript source is held in this _js_source directory and compiled to the following:

* assets/js/modernizr.min.js - only modernizer, included in the HTML Head section
* assets/js/app.min.js - contains all other JavaScript sources, included at the end of the HTML Body section

This script must be run manually whenever any of the JavaScript sources are changed.

## External Libraries

This site is based on a heavily modified version of the [Feeling Responsive site](https://github.com/Phlow/feeling-responsive) by Moritz �mo.� Sauer // Phlow.de which is available under the MIT licence.

This uses the [Foundation](http://foundation.zurb.com/) for layout, styling and the navigation menu bar, which is available under the MIT licence.

Icons are from [Entypo+](http://entypo.com/) by Daniel Bruce, which is available under a CC BY-SA 4.0 licence.

HTML compression is from [jekyll-compress-html](http://jch.penibelst.de/) by Anatol Broder // penibelst which is available under the MIT licence.

All configuration, customisation and extensions for the OnDataEngineering site are not being made public under licence, and this repository is therefore not publicly available and should not be made so.

### Feeling Responsive

A copy of Feeling Responsive was taken as a manual copy from the [bare-bones-version branch](https://github.com/Phlow/feeling-responsive/tree/bare-bones-version) at hash 0b3817815669ca182241a4126259ebd36d9b1f69 using git archive so as not to pollute the downstream network graph of feeling-responsive.

Merges of new feeling-responsive features will have to be manually merged using the same method if ever required.

### Foundation

[Foundation 5.5.3](http://foundation.zurb.com/sites/docs/v/5.5.3/) is used for this site.  This is an upgrade from the Foundation version shipped with Feeling Responsive.

Foundation (and it's dependencies) are downloaded using [Bower](http://bower.io/) into the "bower_components" directory via "bower update" from the OnDataEngineering root directory - this downloads the Foundation version specified in the bower.json file.

The "bower_components" directory is included in the .gitignore file and not checked in.  Instead the following files are copied into the OnDataEngineering source directories and checked in from there:

* _bower_components/foundation/scss/foundation.scss -> _sass/foundation.scss
* _bower_components/foundation/scss/normalize.scss -> _sass/normalize.scss
* _bower_components/foundation/scss/foundation/_functions.scss -> _sass/foundation/_functions.scss
* _bower_components/foundation/scss/foundation/components/ -> _sass/foundation/components/
* _bower_components/foundation/js/foundation.js -> _js_source/foundation.js
* _bower_components/jquery/dist/jquery.js -> _js_source/jquery.js
* _bower_components/modernizr/modernizr.js -> _js_source/modernizr.js

For reference, the following files were taken from the [foundation-compass-template](https://github.com/zurb/foundation-compass-template) as starting points for the OnDataEngineering integration with Foundation:

* js/app.js -> _js_source/app.js
* scss/_settings.scss -> _sass/foundation_settings.scss
* scss/app.scss -> assets/css/app.scss
* index.md -> validate default layout and related includes

### Entypo+ IconFont

The Entypo+ IconFont is unmodified from the version distributed with Feeling Responsive, however the source has been moved to _iconfont so as not to serve this as part of the site

The steps for changing and re-compiling this font are not currently known, but are presumably documented on the [Entypo+ Website](http://entypo.com/)

## Useful Links

* Kramdown: <http://kramdown.gettalong.org/syntax.html>
* Jekyll: <http://jekyllrb.com/docs/home/>
  * List of variables: <https://jekyllrb.com/docs/variables/>
  * Collections info: <https://jekyllrb.com/docs/collections/>
  * Custom tags and filters: <https://jekyllrb.com/docs/templates/>
* Liquid Docs: <https://shopify.github.io/liquid/>
  * Tags (logic): <https://shopify.github.io/liquid/tags/>
  * Filters (post pipe operators): <https://shopify.github.io/liquid/filters/>
* Foundation: <http://foundation.zurb.com/sites/docs/v/5.5.3/>
* Liquid Summary: <https://github.com/Shopify/liquid/wiki/Liquid-for-Designers>
* Liquid Docs: <https://docs.shopify.com/themes/liquid-documentation/basics>
* Feeling Responsive: <https://phlow.github.io/feeling-responsive/>, <https://github.com/Phlow/feeling-responsive>
* Git: <http://git-scm.com/book/en/v2>, <http://git-scm.com/docs>
* Jekyll on Windows: <http://jekyllrb.com/docs/windows/#installation>, <http://jekyll-windows.juthilo.com/>

## Site Reference Material

### Site Structure

* index.html - homepage; constructs page from _frontpage-widget.html, call for action buttons and list of latest posts and content updates
* assets/ - static assets
  * css/
  * fonts/
  * img/
  * js/
* images/ - images from the content repo
* pages
  * 404.html - standard error page
  * atom.xml; feed.xml - ATOM and RSS feeds
  * humans.txt; robots.txt
  * sitemap.xml
  * CNAME, nojekyll - configuration for GitHub pages - sets CNAME and disables Jekyll builds
  * z_discourse_feed.xml -  RSS feed for Discourse to use for the creation of topics 
* site/ - site information page
  * content-license/
  * contributing/
  * search/
* blog/ - blog index
  * archive/ - blog archive
  * \<YYYY>/\<MM>/\<DD>/\<post-name>/ - blog posts
* technologies/ - list of all technologies
* technologies/\<tech-name> - page per technology
* technologies/\<tech-name>/\<sub-proj-name> - page per sub-project
* tech-vendors/ - list of all vendors
* tech-vendors/\<vendor-name> - page per vendor
* tech-categories/ - list of all technology categories
* tech-categories/\<category-name> - page per category

### Layouts

* null - used by all pages in pages subdirectory (bar the 404 page)
* compress - Jekyll layout that compresses HTML
  * default - constructs page from _head.html, _navigation.html, _breadcrumb.html, content, _footer.html, _footer_scripts.html
    * page-fullwidth - constructs page from page title, description and content - not currently used
    * page - constructs page from page title, _meta_information.html, description, _content_header.html, content, related posts, _next-previous-buttons.html, _comments.html along with _sidebar.html - used by content pags and indexes, blog index and archive, 404 page and site pages

### Includes

* _head - HTML head - used by default layout
* _favicon - header includes for site icons - used by _head included
* _navigation - top of page menu bar - used by default layout
* _breadcrumbs - breadcrumb navigation bar - used by default layout
* _footer - HTML footer - used by default layout
* _footer_scripts - scripts to be included after HTML footer - used by default layout

* _side_bar - page sidebar - used by page layout
* _meta_information - blog post meta information line to go under titles - used by page layout
* _content_header - creates standard content at top of content pages as follows:
      * technology - technology information, sub-projects (using _list-technologies.html), related technologies
      * tech-category - table of technologies in category
      * tech-vendor - vendor information, table of technologies from vendor
* _comments - discourse comments - used by page layout if comments are turned on for page / collection

* _frontpage-widget - top intro widgets on home page - used by frontpage layout
* _google_search - google search box - used by search page
* _list-posts - compact list of posts - used by blog archive page and content layouts (e.g. technology pages)
* _post_summary - summary of blog post - used by frontpage layout and blog index page
* _next-previous-buttons - next/archive/prev navigation buttons - used by page layout (if meta information on) and some category layouts
* _next-previous-buttons-large - larger more central next/archive/prev navigation buttons for pages without a sidebar - used by front page and blog index pages

### Formats

Formats can be specified in page Front Matter, and get injected as a class of the HTML body section, allowing changes in CSS styles.

The following are the formats currently used:

* blog-index - used by the front page and blog index pages and removes the top and bottom margins from h2 styles
* two-heading-page - use by content pages that only use h1 and h2 to drop the h2 font size down to the h3 font size

### Colours

| Main Site        | Discourse                     | Colour                   | Notes                                         |
| $body-bg         | Secondary / Header Background | #FFFFFF (white)          |                                               |
| $body-font-color | Primary / Header Primary      | #222222 (black/oil)      |                                               |
| $primary-color   | Tertiary / Quaternary         | #334D5C (dark turquoise) | Buttons, links and navigation bars            |
| $secondary-color |                               | #E4E4E4 (light grey)     | Used for all grey shades on site              |
| $alert-color     | Danger                        | #DF4949 (red)            | Site alert items, discourse dangerous actions |
| $success-color   | Success                       | #A1D044 (green)          | Site success items, discourse success notes   |
| $warning-color   | Highlight                     | #E27A3F (orange)         | Site warning items, discourse highlights      |
| $info-color      | Wiki                          | #45B29D (turquoise)      | Site info items, discourse wiki posts         |
|                  | Love                          | #FA6C8D (pink)           | Discourse like buttons                        |

### Discourse Integration

Setting page.discussable adds a link to the sidebar and a button next to the page title to view the associated topic in Discourse, and includes the page in the Discourse RSS feed. page.discuss_text controls the text for the sidebar link and tooltop popup on the discuss button.

Setting page.discourse_category adds a link to the sidebar for viewing the associated Discourse Category.  page.discourse_category_text controls the text for this sidebar link, with page.discourse_category_name specifiying the name of the category

Setting page.discourse_comments to true causes _comments.html to be included at the end of page layout.  This includes a div and a piece of Javascript that calls the Discourse embed.js script to replace the div with an IFrame containing the top comments for the blog post.  See <https://meta.discourse.org/t/embedding-discourse-comments-via-javascript/31963> for details on how this works.

Setting page.discourse_comments also enables a "Discussion" link to \<post-url>/#discourse-comments in the post meta information under post titles via the _meta_information include.

Setting page.discourse_counts then enables a piece of Javascript in _footer_scripts.html that appends " (x replies)" to the "Discussion" link in meta information by calling the Discourse counts.js script.  This works on the blog indexes and homepage as well as individual pages.

### GitHub Integration

Setting page.editable adds a link to the sidebar and a button next to the page title to edit the page in GitHib.  page.edit_text controls the text for this link and tooltip popup on the button.

Setting page.createable adds a link to the sidebar and a button next to the page title to add new pages in GitHub - this is intended to be used on index pages. page.create_text can be used to set the text in the sidebar.  page.create_path should  be used to set to the GitHub path to create the new file in.

### Front Page Imagery

widget-technologies - https://www.pexels.com/photo/tool-set-on-plank-175039/
widget-tech-categories - https://unsplash.com/photos/GJCWj-n3h4E
widget-tech-vendors - https://unsplash.com/photos/lwIX8oXGlZc
widget-use-cases - https://www.pexels.com/photo/whiteboard-sketching-design-planning-7366/
widget-evaluations - https://www.pexels.com/photo/grey-metal-hammer-34520/