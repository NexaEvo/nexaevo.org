#!/usr/bin/env bash
# Publish the NexaEvo landing page from its git checkout to the nginx web root.
# Temporary hosting on the shared server; the site is static, so publishing is a copy.
set -euo pipefail
SRC=/root/NexaEvo/nexaevo.org
DST=/var/www/nexaevo.org

git -C "$SRC" pull --ff-only -q origin main
rsync -a --delete \
  --exclude '.git' --exclude 'README.md' --exclude 'CNAME' --exclude 'deploy.sh' --exclude 'nginx/' \
  "$SRC"/ "$DST"/
echo "published $(git -C "$SRC" rev-parse --short HEAD) to $DST"
