#!/bin/bash

# Replace function
sed-replace() {
  find $3 -type f -name "*.*" -not -path "*/.git/*" -not -path "*/vendor/*" -print0 | xargs -0 sed -i "s|$1|$2|g"
}

INDEX_TITLE="SlowBikeClub Vinyl Decals - Track Bike Vinyl Decals"

#########
# INDEX #
#########
rm index.html
cat templates/header.html.template \
  templates/index.html.template \
  templates/footer.html.template \
  >> index.html
sed-replace %TITLE% "$INDEX_TITLE" index.html
sed-replace %TRACKMAPS_ORDER_LINK% "$TRACKMAPS_ORDER_LINK" index.html
