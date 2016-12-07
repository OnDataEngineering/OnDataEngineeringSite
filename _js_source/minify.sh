# Requires minify npm package to be installed
# See: https://www.npmjs.com/package/minifier

minify --output ../assets/js/modernizr.min.js modernizr.js

minify --output ../assets/js/app.min.js jquery.js foundation/foundation.js foundation/foundation.interchange.js foundation/foundation.reveal.js foundation/foundation.topbar.js app.js
