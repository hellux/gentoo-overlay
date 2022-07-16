# Copyright 2022 Gentoo Authors
# Distributed under the terms of the GNU General Public License v2

EAPI=8

DESCRIPTION="CLI Wiktionary frontend"
HOMEPAGE="https://github.com/hellux/wiktc"

EGIT_REPO_URI="https://github.com/hellux/wiktc.git"
inherit git-r3

LICENSE="GPL-3"
SLOT="0"
KEYWORDS="~amd64"

DEPEND="net-misc/curl app-misc/jq www-client/elinks"
RDEPEND="${DEPEND}"
BDEPEND=""

src_install() {
	default_src_install
	mv wtc.sh wtc
	dobin wtc
}
