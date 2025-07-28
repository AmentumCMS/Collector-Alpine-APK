#!/bin/sh
wget \
  --mirror \
  --no-parent \
  --no-host-directories \
  --cut-dirs=1 \
  --reject "APKINDEX.tar.gz.sig" \
  https://dl-cdn.alpinelinux.org/alpine/v3.21/main/x86_64/
