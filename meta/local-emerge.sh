#!/bin/sh

LOCAL_REPO="/usr/local/portage"

overlay=$1
atom=$2

[ -z "$overlay" ] && exit 1
[ -z "$atom" ] && exit 2
[ -n "$3" ] && exit 3

category="$(echo "$atom" | cut -d/ -f1)"

if [ -r "$LOCAL_REPO/$atom" ]; then
    rm -r "${LOCAL_REPO:?}/${atom:?}"
fi

mkdir -p "$LOCAL_REPO/$category"
cp -r "$overlay/$atom" "$LOCAL_REPO/$category"

find "$LOCAL_REPO" -name '*.ebuild' | xargs -IF ebuild F digest

emerge -a "$atom"
