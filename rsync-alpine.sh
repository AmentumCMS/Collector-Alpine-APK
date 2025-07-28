
src="rsync://rsync.alpinelinux.org/alpine/"
dest="$PWD/alpine/"
mkdir -p "$dest"

/usr/bin/rsync \
  --archive \
  --update \
  --hard-links \
  --delete \
  --delete-after \
  --delay-updates \
  --timeout=600 \
  "$src" "$dest"