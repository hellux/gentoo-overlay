# Copyright 2020 Gentoo Authors
# Distributed under the terms of the GNU General Public License v2

EAPI=7

ADA_COMPAT=( gnat_20{20..21} )
inherit ada llvm

DESCRIPTION="VHDL 2008/93/87 simulator"
HOMEPAGE="http://ghdl.free.fr/"
SRC_URI="https://github.com/ghdl/ghdl/archive/v${PV}.tar.gz -> ${PF}.tar.gz"

LICENSE="GPL-2 MIT !gplcompat? ( Apache-2.0 IEEE Mentor Vital )"
SLOT="0"
KEYWORDS="~amd64"
IUSE="+mcode -llvm +libghdl -synth -gplcompat"
REQUIRED_USE="${ADA_REQUIRED_USE}
	^^ ( mcode llvm )"

RDEPEND="${ADA_DEPS}
	llvm? ( <=sys-devel/llvm-11 )"
DEPEND="${RDEPEND}"

LLVM_MAX_SLOT=9

PATCHES=(
	"${FILESDIR}/${P}-multilib.patch"
)

pkg_setup() {
	ada_pkg_setup

	if use llvm; then
		llvm_pkg_setup
	fi
}

src_configure() {
	args=""
	use llvm && args="$args --with-llvm-config"

	./configure $args \
		--prefix="${EPREFIX}"/usr \
		$(use_enable gplcompat) \
		$(use_enable libghdl) \
		$(use_enable synth) || die "configure failed"
}
