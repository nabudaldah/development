#!/bin/bash

subject=$(git log -1 --oneline)
if [[ "$subject" != *full?linkcheck* ]]; then
    echo "No [full-linkcheck] annotation found. Exiting."
    exit 0
fi
sudo apt install -qq  -y w3c-linkchecker

checklink \
    --suppress-broken '-1:https://opencpn.org/' \
    --suppress-broken '-1:https://www.opencpn.org/flyspray/' \
    --suppress-broken '403:https://www.opencpn.org/' \
    --suppress-broken '403:https://opencpn.org/flyspray/' \
    --suppress-broken '403:https://opencpn.org/flyspray/index.php?project=0&do=index' \
    --suppress-broken '403:https://opencpn.org/OpenCPN/info/downloadplugins.html' \
    --suppress-broken '403:$dokuwiki?id=opencpn:opencpn_user_manual' \
    --suppress-broken '-1:https://cubian.org/downloads/' \
    --suppress-broken '-1:https://cubian.org/2013/08/12/enlarge-cubian-rootfs-partition/' \
    --suppress-redirect 'https://opencpn-manuals.github.io/development->https://opencpn-manuals.github.io/development/' \
    --exclude bigdumboat.com \
    --exclude 'https://opencpn.org/wiki/dokuwiki/' \
    --exclude opencpn.org \
    --depth 4 -s docs/index.html 
