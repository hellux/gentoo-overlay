#!/bin/sh
# Compare local ebuild versions with upstream package releases
# usage: ./check-releases.sh [packages_file]
#
# Packages file contains an entry for each package. Each entry contains exactly
# 3 fields in order:
#   - an atom (category/name),
#   - a regular expression for the filename of the downloadable tarball with
#     the version part surrounded by @ symbols, e.g.
#     "name-@[0-9]+.[0-9]+@\.tar\.gz",
#   - a URL to the downloads page.
#
# Fields can be separated with either whitespace or a newline directly followed
# by whitespace. For example:
#
# sci-electronics/verilator
#   verilator-@[0-9]+\.[0-9]+@\.tgz
#   https://www.veripool.org/projects/verilator/wiki/Download

if [ -n "$1" ];
then packages=$1
else packages=upstream-sources
fi

[ -r "$packages" ] || exit 1

PKGS=$(mktemp)
VERSIONS=$(mktemp)
HTMLS=$(mktemp -d)

# Preprocess packages file, resulting file contains one entry per line with
# space separated fields.
sed -z 's/\n[\t ]/ /g' "$packages" | tr -s " \n" > "$PKGS"

# Query installed overlays and the portage tree for ebuild versions for each
# package.
atoms=$(cut -d" " -f1 "$PKGS")
equery l -opF '$category/$name	$version' $atoms | tr -s '\n' > "$VERSIONS" \
    || exit 2

# Fetch the download page for each package.
curl_args=""
while read -r atom _ url; do
    mkdir -p "$HTMLS/$(dirname "$atom")"
    curl_args="$curl_args -o $HTMLS/$atom $url "
done < "$PKGS"
curl -LsZ $curl_args || exit 3

# Compare latest upstream package with latest ebuild.
while read -r atom regex _; do
    printf "%s" "$atom: "

    ere=$(echo "$regex" | tr -d "@")
    upstream_package=$(grep -oE "$ere" "$HTMLS/$atom" | sort -rV | head -n1)
    [ -z "$upstream_package" ] && exit 4

    prefix=$(echo "$regex" | cut -d@ -f1 | tr -d '\\')
    suffix=$(echo "$regex" | cut -d@ -f3 | tr -d '\\')
    ebuild_version=$(grep "$atom" "$VERSIONS" | cut -f2 | sort -rV | head -n1)
    ebuild_package=$prefix$ebuild_version$suffix
    [ -z "$ebuild_version" ] && exit 5

    if [ "$ebuild_package" = "$upstream_package" ];
    then echo "up to date -- $ebuild_version"
    else echo "NEW VERSION available -- $upstream_package"
    fi
done < "$PKGS"

rm -r "$HTMLS"
rm "$PKGS" "$VERSIONS"
