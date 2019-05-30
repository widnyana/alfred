#!/usr/bin/env bash
set -e

CROND_DIR=/etc/cron.d
CLONE_DIR=/opt/housekeeping


echo -e "Cloning to $CLONE_DIR"
git clone https://github.com/widnyana/alfred $CLONE_DIR

#: symlink to /etc/cron.d
for filename in $CLONE_DIR/cron.d/*; do
  [ -e "$filename" ] || continue
  echo -e "Symlinking $filename to $CROND_DIR"
  ln -sfn "$filename" $CROND_DIR
done

