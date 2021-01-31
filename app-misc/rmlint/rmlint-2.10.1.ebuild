# Copyright 2021 Gentoo Authors
# Distributed under the terms of the GNU General Public License v2

EAPI=7

PYTHON_COMPAT=( python3_{7..9} )
inherit python-any-r1 scons-utils

DESCRIPTION="Tool to remove duplicates and other lint from your filesystem"
HOMEPAGE="https://github.com/sahib/rmlint"
SRC_URI="https://github.com/sahib/rmlint/archive/v$PV.tar.gz"

LICENSE="GPL-3"
SLOT="0"
KEYWORDS="~amd64 ~x86"
IUSE="doc nls json-cache"

DEPEND=">=dev-libs/glib-2.32
	json-cache? ( dev-libs/json-glib )
	nls? ( sys-devel/gettext )
"
RDEPEND="${DEPEND}"
BDEPEND="doc? ( dev-python/sphinx )"

src_configure() {
	MYSCONS=(
		DEBUG=1 # prevent pre-strip of binary
		--prefix="${D}/usr"
		--actual-prefix="${ED}/usr"
	)
	escons "${MYSCONS[@]}" config
}

src_compile() {
	escons "${MYSCONS[@]}"
}

src_install() {
	escons "${MYSCONS[@]}" install

	# duplicates of glib files
	rm -rf "${D}"/usr/share/glib-2.0

	# unused rmlint-shredder gui files
	rm -rf "${D}"/usr/share/icons
	rm -rf "${D}"/usr/share/applications
	rm -rf "${D}"/usr/lib

	use doc || rm -rf "${D}"/usr/share/man
	use nls || rm -rf "${D}"/usr/share/locale

	# let portage handle compression of manpage
	use doc && gunzip "${D}"/usr/share/man/man1/rmlint.1.gz
}
