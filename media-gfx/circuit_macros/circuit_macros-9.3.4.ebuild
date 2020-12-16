# Copyright 2020 Gentoo Authors
# Distributed under the terms of the GNU General Public License v2

EAPI=7

DESCRIPTION="M4 macros producing dpic code for drawing electric circuits and other diagrams."
HOMEPAGE="https://ece.uwaterloo.ca/~aplevich/Circuit_macros/"
SRC_URI="https://ece.uwaterloo.ca/~aplevich/Circuit_macros/Circuit_macros${PV}.tar.gz"

LICENSE="LPPL-1.3c"
SLOT="0"
KEYWORDS="~amd64 ~x86"
IUSE="examples"

RDEPEND="sys-devel/m4 media-gfx/dpic"

S="${WORKDIR}/Circuit_macros${PV}"

src_compile() { :; }

src_install() {
	insinto /usr/share/${PN}
	doins dpictools.pic *.m4

	echo "M4PATH=\"/usr/share/${PN}\"" > "${T}/99${PN}"
	doenvd "${T}/99${PN}"
	elog "Re-login or run '. /etc/profile.d' for M4PATH to be set."

	insinto /usr/share/texmf-site/tex/latex/${PN}
	doins boxdims.sty

	dodoc doc/Circuit_macros.pdf README CHANGES

	if use examples; then
		docinto examples
		dodoc examples/*.m4 examples/examples.pdf
	fi

	einstalldocs
}
