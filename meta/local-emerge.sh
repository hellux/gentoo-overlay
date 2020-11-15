#!/bin/sh
# usage: ./local-emerge.sh overlay [dependency..] atom
# Atoms/dependencies must include category and not just the package name.

LOCAL_REPO="/usr/local/portage"

overlay=$1
[ -z "$overlay" ] && exit 1
shift 1
atoms="$*"
[ -z "$atoms" ] && exit 2

for atom in $atoms; do
    cat="$(echo "$atom" | cut -d/ -f1 | tr -dc '[:alnum:]-')"
    pkg="$(echo "$atom" | cut -d/ -f2 | cut -d- -f1)"
    catpkg="$cat/$pkg"

    [ -r "$LOCAL_REPO/$catpkg" ] && rm -r "${LOCAL_REPO:?}/${catpkg:?}"

    mkdir -p "$LOCAL_REPO/$cat"
    cp -r "$overlay/$catpkg" "$LOCAL_REPO/$cat"
done

find "$LOCAL_REPO" -name '*.ebuild' | xargs -IF ebuild F digest

emerge -a "$atom"
