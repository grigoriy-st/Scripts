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
  PAGER=cat yay -S --noconfirm \
    --answerclean All \
    --answerdiff All \
    --editmenu n \
    --cleanmenu n \
    --diffmenu n \
    --pgpfetch n \
    --mflags '--skippgpcheck' \
    "$pkg" -y
done
