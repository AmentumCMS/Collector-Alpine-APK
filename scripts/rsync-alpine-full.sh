#!/bin/sh

# Lock to prevent concurrent runs
lockfile="/tmp/alpine-mirror.lock"
[ -z "$flock" ] && exec env flock=1 flock -n $lockfile "$0" "$@"

# Define source and destination
src="rsync://rsync.alpinelinux.org/alpine/"

# Rsync only the latest version and selected repos/archs
rsync \
  --archive \
  --update \
  --hard-links \
  --delete \
  --delete-after \
  --delay-updates \
  --timeout=600 \
  --include "v3.22/" \
  --include "v3.22/main/" \
  --include "v3.22/main/x86_64/***" \
  --include "v3.22/community/" \
  --include "v3.22/community/x86_64/***" \
  --exclude "*" \
  "$src" "."


  # --log-file "rsync.log" \
  # --include "latest-stable/" \
  # --include "latest-stable/main/" \
  # --include "latest-stable/main/x86_64/" \
  # --include "latest-stable/community/" \
  # --include "latest-stable/community/x86_64/" \