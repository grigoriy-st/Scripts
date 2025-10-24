#!/bin/bash
set -euo pipefail

if [ $# -eq 0 ]; then
  echo "Usage: $0 <package1> [package2] ..." >&2
  exit 1
fi

if ! command -v yay >/dev/null; then
  echo "ERROR: yay is not installed" >&2
  exit 1
fi

for pkg in "$@"; do
  echo "==> Installing AUR package: $pkg"
  script -qec "yay -S --noconfirm \
    --answerclean All \
    --answerdiff All \
    --editmenu false \
    --cleanmenu false \
    --diffmenu false \
    --pgpfetch false \
    --mflags '--skippgpcheck' \
    '$pkg'" /dev/null
done
