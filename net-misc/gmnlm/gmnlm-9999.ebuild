# Copyright 2020 Gentoo Authors
# Distributed under the terms of the GNU General Public License v2

EAPI=7

DESCRIPTION="CLI Gemini client"
HOMEPAGE="https://git.sr.ht/~sircmpwn/gmni"

EGIT_REPO_URI="https://git.sr.ht/~sircmpwn/gmni"
inherit git-r3

LICENSE="GPL-3"
SLOT="0"
KEYWORDS="~amd64"
IUSE="doc"

DEPEND="dev-libs/openssl"
RDEPEND="${DEPEND}"
BDEPEND="doc? ( app-text/scdoc )"

src_configure() {
	# econf provides --mandir and --libdir which overrides the DESTDIR variable
	# later during the install. Default src_configure has thus been overridden
	# by a direct call to configure without these arguments.
	./configure --prefix="${EPREFIX}"/usr
}
