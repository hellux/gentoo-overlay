# Copyright 2020 Gentoo Authors
# Distributed under the terms of the GNU General Public License v2

EAPI=7

DESCRIPTION="An extensible lyrics fetcher, with daemon support for cmus and mocp"
HOMEPAGE="https://github.com/trizen/clyrics"
SRC_URI="https://github.com/trizen/${PN}/archive/${PV}.tar.gz -> ${PF}.tar.gz"

LICENSE="GPL-3"
SLOT="0"
KEYWORDS="~amd64 ~x86"

DEPEND="dev-lang/perl
	dev-perl/WWW-Mechanize
	dev-perl/IO-HTML
	dev-perl/LWP-Protocol-https"
RDEPEND="${DEPEND}"
BDEPEND=""

src_install() {
	dobin clyrics
	insinto /usr/share/"${PN}"
	doins plugins/*

	dodoc README.md
}
